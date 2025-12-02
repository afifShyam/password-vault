import 'package:freezed_annotation/freezed_annotation.dart';

part 'vault_event.freezed.dart';

@freezed
class VaultEvent with _$VaultEvent {
  const factory VaultEvent.load() = LoadVault;
  const factory VaultEvent.addEntry({
    required String title,
    required String password,
    String? email,
  }) = AddEntry;
  const factory VaultEvent.updateEntry({
    required String oldTitle,
    required String newTitle,
    required String password,
    String? email,
  }) = UpdateEntry;
  const factory VaultEvent.deleteEntry(String title) = DeleteEntry;
  const factory VaultEvent.setSearchQuery(String query) = SetSearchQuery;
  const factory VaultEvent.hideAll() = HideAll;
  const factory VaultEvent.toggleVisibility(String id) = ToggleVisibility;
}
