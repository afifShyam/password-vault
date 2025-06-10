// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PasswordEntry _$PasswordEntryFromJson(Map<String, dynamic> json) =>
    _PasswordEntry(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      password: json['password'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$PasswordEntryToJson(_PasswordEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'password': instance.password,
      'email': instance.email,
    };
