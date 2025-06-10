// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PasswordEntry {

 String get id; String get title; String get password; String get email;
/// Create a copy of PasswordEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordEntryCopyWith<PasswordEntry> get copyWith => _$PasswordEntryCopyWithImpl<PasswordEntry>(this as PasswordEntry, _$identity);

  /// Serializes this PasswordEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.password, password) || other.password == password)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,password,email);

@override
String toString() {
  return 'PasswordEntry(id: $id, title: $title, password: $password, email: $email)';
}


}

/// @nodoc
abstract mixin class $PasswordEntryCopyWith<$Res>  {
  factory $PasswordEntryCopyWith(PasswordEntry value, $Res Function(PasswordEntry) _then) = _$PasswordEntryCopyWithImpl;
@useResult
$Res call({
 String id, String title, String password, String email
});




}
/// @nodoc
class _$PasswordEntryCopyWithImpl<$Res>
    implements $PasswordEntryCopyWith<$Res> {
  _$PasswordEntryCopyWithImpl(this._self, this._then);

  final PasswordEntry _self;
  final $Res Function(PasswordEntry) _then;

/// Create a copy of PasswordEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? password = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PasswordEntry implements PasswordEntry {
  const _PasswordEntry({required this.id, this.title = '', this.password = '', this.email = ''});
  factory _PasswordEntry.fromJson(Map<String, dynamic> json) => _$PasswordEntryFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String password;
@override@JsonKey() final  String email;

/// Create a copy of PasswordEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordEntryCopyWith<_PasswordEntry> get copyWith => __$PasswordEntryCopyWithImpl<_PasswordEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.password, password) || other.password == password)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,password,email);

@override
String toString() {
  return 'PasswordEntry(id: $id, title: $title, password: $password, email: $email)';
}


}

/// @nodoc
abstract mixin class _$PasswordEntryCopyWith<$Res> implements $PasswordEntryCopyWith<$Res> {
  factory _$PasswordEntryCopyWith(_PasswordEntry value, $Res Function(_PasswordEntry) _then) = __$PasswordEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String password, String email
});




}
/// @nodoc
class __$PasswordEntryCopyWithImpl<$Res>
    implements _$PasswordEntryCopyWith<$Res> {
  __$PasswordEntryCopyWithImpl(this._self, this._then);

  final _PasswordEntry _self;
  final $Res Function(_PasswordEntry) _then;

/// Create a copy of PasswordEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? password = null,Object? email = null,}) {
  return _then(_PasswordEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
