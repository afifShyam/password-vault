import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_entry.freezed.dart';
part 'password_entry.g.dart';

@freezed
sealed class PasswordEntry with _$PasswordEntry {
  const factory PasswordEntry({
    required String id,
    @Default('') String title,
    @Default('') String password,
    @Default('') String email,
  }) = _PasswordEntry;

  factory PasswordEntry.fromJson(Map<String, dynamic> json) =>
      _$PasswordEntryFromJson(json);
}
