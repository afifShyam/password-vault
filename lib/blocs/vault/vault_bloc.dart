import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_vault/model/index.dart';
import 'package:pass_vault/services/secure_storage_service.dart';
import 'package:pass_vault/services/supabase_vault_remote.dart';
import 'package:uuid/uuid.dart';

import 'vault_event.dart';
import 'vault_state.dart';

class VaultBloc extends Bloc<VaultEvent, VaultState> {
  VaultBloc(this._storage, {SupabaseVaultRemote? supabaseVaultRemote})
    : _remote = supabaseVaultRemote,
      super(const VaultState()) {
    on<LoadVault>(_onLoad);
    on<AddEntry>(_onAddEntry);
    on<UpdateEntry>(_onUpdateEntry);
    on<DeleteEntry>(_onDeleteEntry);
    on<SetSearchQuery>(_onSearch);
    on<HideAll>(_onHideAll);
    on<ToggleVisibility>(_onToggleVisibility);
  }

  final SecureStorageService _storage;

  final SupabaseVaultRemote? _remote;

  Future<void> _onLoad(LoadVault event, Emitter<VaultState> emit) async {
    emit(state.copyWith(status: VaultStatus.loading, error: ''));
    try {
      final entries = await _readLocalEntries();
      final emails = await _storage.getEmails();
      final filtered = _filterEntries(entries, state.searchQuery);

      emit(
        state.copyWith(
          status: VaultStatus.loaded,
          entries: entries,
          filteredEntries: filtered,
          emails: emails,
          error: '',
        ),
      );

      await _pullRemoteAndMerge(entries, emit);
    } catch (_) {
      emit(
        state.copyWith(
          status: VaultStatus.error,
          error: 'Failed to load passwords',
        ),
      );
    }
  }

  Future<List<PasswordEntry>> _readLocalEntries() async {
    final data = await _storage.getAllPasswords();
    return data.entries.map((e) {
      try {
        final json = Map<String, dynamic>.from(jsonDecode(e.value));
        return PasswordEntry.fromJson(json);
      } catch (_) {
        return PasswordEntry(
          id: e.key,
          title: e.key,
          password: e.value,
          email: 'N/A',
        );
      }
    }).toList();
  }

  Future<void> _pullRemoteAndMerge(
    List<PasswordEntry> localEntries,
    Emitter<VaultState> emit,
  ) async {
    final remote = _remote;
    if (remote == null) return;

    try {
      final remoteEntries = await remote.fetchEntries();
      if (remoteEntries.isEmpty) return;

      for (final entry in remoteEntries) {
        await _storage.savePassword(
          key: entry.title,
          value: jsonEncode(entry.toJson()),
        );
        await _storage.saveEmail(entry.email);
      }

      final merged = _mergeEntries(localEntries, remoteEntries);
      final mergedEmails = merged.map((e) => e.email).toSet().toList();

      emit(
        state.copyWith(
          entries: merged,
          filteredEntries: _filterEntries(merged, state.searchQuery),
          emails: mergedEmails,
        ),
      );
    } catch (e) {
      log('Remote pull failed: $e');
    }
  }

  Future<void> _onAddEntry(AddEntry event, Emitter<VaultState> emit) async {
    final entry = PasswordEntry(
      id: const Uuid().v4(),
      title: event.title,
      password: event.password,
      email: event.email ?? 'N/A',
    );

    await _storage.savePassword(
      key: event.title,
      value: jsonEncode(entry.toJson()),
    );
    await _storage.saveEmail(event.email ?? 'N/A');
    await _pushRemoteEntry(entry);
    add(const VaultEvent.load());
  }

  Future<void> _onUpdateEntry(
    UpdateEntry event,
    Emitter<VaultState> emit,
  ) async {
    final oldKey = event.oldTitle;

    if (event.oldTitle != event.newTitle) {
      await _storage.deletePassword(event.oldTitle);
    }

    final entry = PasswordEntry(
      id: const Uuid().v4(),
      title: event.newTitle,
      password: event.password,
      email: event.email ?? 'N/A',
    );

    await _storage.savePassword(
      key: event.newTitle,
      value: jsonEncode(entry.toJson()),
    );
    await _storage.saveEmail(event.email ?? 'N/A');
    await _updateRemoteEntry(oldKey, entry);
    add(const VaultEvent.load());
  }

  Future<void> _onDeleteEntry(
    DeleteEntry event,
    Emitter<VaultState> emit,
  ) async {
    await _storage.deletePassword(event.title);
    await _deleteRemoteEntry(event.title);
    add(const VaultEvent.load());
  }

  void _onSearch(SetSearchQuery event, Emitter<VaultState> emit) {
    final filtered = _filterEntries(state.entries, event.query);
    emit(state.copyWith(filteredEntries: filtered, searchQuery: event.query));
  }

  void _onHideAll(HideAll event, Emitter<VaultState> emit) {
    emit(state.copyWith(obscureMap: {}));
  }

  void _onToggleVisibility(ToggleVisibility event, Emitter<VaultState> emit) {
    final updated = Map<String, bool>.from(state.obscureMap);
    final current = updated[event.id] ?? true;
    updated[event.id] = !current;
    emit(state.copyWith(obscureMap: updated));
  }

  Future<void> _pushRemoteEntry(PasswordEntry entry) async {
    if (_remote == null) return;
    try {
      await _remote.upsertEntry(entry);
    } catch (e) {
      log('Remote push failed for ${entry.title}: $e');
    }
  }

  Future<void> _updateRemoteEntry(
    String oldKey,
    PasswordEntry entry,
  ) async {
    if (_remote == null) return;
    try {
      await _remote.updateEntry(oldKey: oldKey, entry: entry);
    } catch (e) {
      log('Remote update failed for ${entry.title}: $e');
    }
  }

  Future<void> _deleteRemoteEntry(String title) async {
    if (_remote == null) return;
    try {
      await _remote.deleteEntry(title);
    } catch (e) {
      log('Remote delete failed for $title: $e');
    }
  }

  List<PasswordEntry> _mergeEntries(
    List<PasswordEntry> local,
    List<PasswordEntry> remote,
  ) {
    final merged = <String, PasswordEntry>{
      for (final entry in local) entry.title: entry,
    };
    for (final entry in remote) {
      merged[entry.title] = entry;
    }
    return merged.values.toList();
  }

  List<PasswordEntry> _filterEntries(
    List<PasswordEntry> entries,
    String query,
  ) {
    if (query.isEmpty) return entries;
    final lower = query.toLowerCase();
    return entries
        .where(
          (e) =>
              e.title.toLowerCase().contains(lower) ||
              e.email.toLowerCase().contains(lower) ||
              e.password.toLowerCase().contains(lower),
        )
        .toList();
  }
}
