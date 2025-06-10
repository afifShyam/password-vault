import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pass_vault/model/index.dart';

part 'vault_state.freezed.dart';

enum VaultStatus { initial, loading, loaded, error }

@freezed
sealed class VaultState with _$VaultState {
  const VaultState._();

  const factory VaultState({
    required VaultStatus status,
    @Default([]) List<PasswordEntry> entries,
    @Default('') String searchQuery,
    @Default([]) List<String> emails,
    @Default('') String error,
  }) = _VaultState;

  List<PasswordEntry> get filteredEntries {
    if (searchQuery.isEmpty) return entries;
    return entries.where((e) => e.title.toLowerCase().contains(searchQuery.toLowerCase())).toList();
  }
}
