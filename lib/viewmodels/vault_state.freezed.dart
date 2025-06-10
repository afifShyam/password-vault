// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VaultState {

 VaultStatus get status; List<PasswordEntry> get entries; String get searchQuery; List<String> get emails; String get error;
/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultStateCopyWith<VaultState> get copyWith => _$VaultStateCopyWithImpl<VaultState>(this as VaultState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.emails, emails)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(entries),searchQuery,const DeepCollectionEquality().hash(emails),error);

@override
String toString() {
  return 'VaultState(status: $status, entries: $entries, searchQuery: $searchQuery, emails: $emails, error: $error)';
}


}

/// @nodoc
abstract mixin class $VaultStateCopyWith<$Res>  {
  factory $VaultStateCopyWith(VaultState value, $Res Function(VaultState) _then) = _$VaultStateCopyWithImpl;
@useResult
$Res call({
 VaultStatus status, List<PasswordEntry> entries, String searchQuery, List<String> emails, String error
});




}
/// @nodoc
class _$VaultStateCopyWithImpl<$Res>
    implements $VaultStateCopyWith<$Res> {
  _$VaultStateCopyWithImpl(this._self, this._then);

  final VaultState _self;
  final $Res Function(VaultState) _then;

/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? entries = null,Object? searchQuery = null,Object? emails = null,Object? error = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VaultStatus,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<PasswordEntry>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,emails: null == emails ? _self.emails : emails // ignore: cast_nullable_to_non_nullable
as List<String>,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _VaultState extends VaultState {
  const _VaultState({required this.status, final  List<PasswordEntry> entries = const [], this.searchQuery = '', final  List<String> emails = const [], this.error = ''}): _entries = entries,_emails = emails,super._();
  

@override final  VaultStatus status;
 final  List<PasswordEntry> _entries;
@override@JsonKey() List<PasswordEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  String searchQuery;
 final  List<String> _emails;
@override@JsonKey() List<String> get emails {
  if (_emails is EqualUnmodifiableListView) return _emails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emails);
}

@override@JsonKey() final  String error;

/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultStateCopyWith<_VaultState> get copyWith => __$VaultStateCopyWithImpl<_VaultState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._emails, _emails)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_entries),searchQuery,const DeepCollectionEquality().hash(_emails),error);

@override
String toString() {
  return 'VaultState(status: $status, entries: $entries, searchQuery: $searchQuery, emails: $emails, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VaultStateCopyWith<$Res> implements $VaultStateCopyWith<$Res> {
  factory _$VaultStateCopyWith(_VaultState value, $Res Function(_VaultState) _then) = __$VaultStateCopyWithImpl;
@override @useResult
$Res call({
 VaultStatus status, List<PasswordEntry> entries, String searchQuery, List<String> emails, String error
});




}
/// @nodoc
class __$VaultStateCopyWithImpl<$Res>
    implements _$VaultStateCopyWith<$Res> {
  __$VaultStateCopyWithImpl(this._self, this._then);

  final _VaultState _self;
  final $Res Function(_VaultState) _then;

/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? entries = null,Object? searchQuery = null,Object? emails = null,Object? error = null,}) {
  return _then(_VaultState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VaultStatus,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<PasswordEntry>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,emails: null == emails ? _self._emails : emails // ignore: cast_nullable_to_non_nullable
as List<String>,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
