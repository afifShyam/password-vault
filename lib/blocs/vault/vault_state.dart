import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pass_vault/model/index.dart';

part 'vault_state.freezed.dart';

enum VaultStatus { initial, loading, loaded, error }

@freezed
abstract class VaultState with _$VaultState {
  const factory VaultState({
    @Default(VaultStatus.initial) VaultStatus status,
    @Default(<PasswordEntry>[]) List<PasswordEntry> entries,
    @Default(<PasswordEntry>[]) List<PasswordEntry> filteredEntries,
    @Default(<String>[]) List<String> emails,
    @Default('') String searchQuery,
    @Default(<String, bool>{}) Map<String, bool> obscureMap,
    @Default('') String error,
  }) = _VaultState;
  const VaultState._();

  bool get isLoading => status == VaultStatus.loading;
  bool get hasError => status == VaultStatus.error;
}
