import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:pass_vault/model/index.dart';
import 'package:pass_vault/services/index.dart';
import 'package:uuid/uuid.dart';

import 'vault_state.dart';

class VaultViewModel extends ChangeNotifier {
  final SecureStorageService _storage;

  VaultState _state = const VaultState(status: VaultStatus.initial);
  final Map<String, bool> _obscureMap = {};
  bool _disposed = false;

  VaultViewModel(this._storage);

  VaultState get state => _state;

  void _setState(VaultState newState) {
    _state = newState;
    safeNotify();
  }

  bool isObscured(String id) => _obscureMap[id] ?? true;

  bool isAllObscured() => _obscureMap.values.every((e) => e);

  void toggleVisibility(String id) {
    _obscureMap[id] = !(_obscureMap[id] ?? true);
    safeNotify();
  }

  void setSearchQuery(String query) {
    _setState(_state.copyWith(searchQuery: query));
  }

  void hideAllPasswords() {
    _obscureMap.clear();
    safeNotify();
  }

  Future<void> loadPasswords() async {
    _setState(_state.copyWith(status: VaultStatus.loading));

    try {
      final data = await _storage.getAllPasswords();
      final entries =
          data.entries.map((e) {
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

      final emails = await _storage.getEmails();

      _setState(
        _state.copyWith(
          status: VaultStatus.loaded,
          entries: entries,
          emails: emails,
          error: 'N/A',
        ),
      );
    } catch (_) {
      _setState(
        _state.copyWith(
          status: VaultStatus.error,
          error: 'Failed to load passwords',
        ),
      );
    }
  }

  Future<void> addPassword(String title, String password, String? email) async {
    final entry = PasswordEntry(
      id: const Uuid().v4(),
      title: title,
      password: password,
      email: email ?? 'N/A',
    );

    await _storage.savePassword(key: title, value: jsonEncode(entry.toJson()));
    await _storage.saveEmail(email ?? 'N/A');
    await loadPasswords();
  }

  Future<void> deletePassword(String key) async {
    await _storage.deletePassword(key);
    await loadPasswords();
  }

  Future<void> updatePassword({
    required String oldTitle,
    required String newTitle,
    required String password,
    required String? email,
  }) async {
    if (oldTitle != newTitle) {
      await _storage.deletePassword(oldTitle);
    }

    final entry = PasswordEntry(
      id: const Uuid().v4(),
      title: newTitle,
      password: password,
      email: email ?? 'N/A',
    );

    await _storage.savePassword(
      key: newTitle,
      value: jsonEncode(entry.toJson()),
    );
    await _storage.saveEmail(email ?? 'N/A');
    await loadPasswords();
  }

  void safeNotify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
