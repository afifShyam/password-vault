// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 VaultStatus get status; List<PasswordEntry> get entries; List<PasswordEntry> get filteredEntries; List<String> get emails; String get searchQuery; Map<String, bool> get obscureMap; String get error;
/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultStateCopyWith<VaultState> get copyWith => _$VaultStateCopyWithImpl<VaultState>(this as VaultState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.entries, entries)&&const DeepCollectionEquality().equals(other.filteredEntries, filteredEntries)&&const DeepCollectionEquality().equals(other.emails, emails)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.obscureMap, obscureMap)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(entries),const DeepCollectionEquality().hash(filteredEntries),const DeepCollectionEquality().hash(emails),searchQuery,const DeepCollectionEquality().hash(obscureMap),error);

@override
String toString() {
  return 'VaultState(status: $status, entries: $entries, filteredEntries: $filteredEntries, emails: $emails, searchQuery: $searchQuery, obscureMap: $obscureMap, error: $error)';
}


}

/// @nodoc
abstract mixin class $VaultStateCopyWith<$Res>  {
  factory $VaultStateCopyWith(VaultState value, $Res Function(VaultState) _then) = _$VaultStateCopyWithImpl;
@useResult
$Res call({
 VaultStatus status, List<PasswordEntry> entries, List<PasswordEntry> filteredEntries, List<String> emails, String searchQuery, Map<String, bool> obscureMap, String error
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? entries = null,Object? filteredEntries = null,Object? emails = null,Object? searchQuery = null,Object? obscureMap = null,Object? error = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VaultStatus,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<PasswordEntry>,filteredEntries: null == filteredEntries ? _self.filteredEntries : filteredEntries // ignore: cast_nullable_to_non_nullable
as List<PasswordEntry>,emails: null == emails ? _self.emails : emails // ignore: cast_nullable_to_non_nullable
as List<String>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,obscureMap: null == obscureMap ? _self.obscureMap : obscureMap // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VaultState].
extension VaultStatePatterns on VaultState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VaultState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VaultState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VaultState value)  $default,){
final _that = this;
switch (_that) {
case _VaultState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VaultState value)?  $default,){
final _that = this;
switch (_that) {
case _VaultState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VaultStatus status,  List<PasswordEntry> entries,  List<PasswordEntry> filteredEntries,  List<String> emails,  String searchQuery,  Map<String, bool> obscureMap,  String error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VaultState() when $default != null:
return $default(_that.status,_that.entries,_that.filteredEntries,_that.emails,_that.searchQuery,_that.obscureMap,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VaultStatus status,  List<PasswordEntry> entries,  List<PasswordEntry> filteredEntries,  List<String> emails,  String searchQuery,  Map<String, bool> obscureMap,  String error)  $default,) {final _that = this;
switch (_that) {
case _VaultState():
return $default(_that.status,_that.entries,_that.filteredEntries,_that.emails,_that.searchQuery,_that.obscureMap,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VaultStatus status,  List<PasswordEntry> entries,  List<PasswordEntry> filteredEntries,  List<String> emails,  String searchQuery,  Map<String, bool> obscureMap,  String error)?  $default,) {final _that = this;
switch (_that) {
case _VaultState() when $default != null:
return $default(_that.status,_that.entries,_that.filteredEntries,_that.emails,_that.searchQuery,_that.obscureMap,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _VaultState extends VaultState {
  const _VaultState({this.status = VaultStatus.initial, final  List<PasswordEntry> entries = const <PasswordEntry>[], final  List<PasswordEntry> filteredEntries = const <PasswordEntry>[], final  List<String> emails = const <String>[], this.searchQuery = '', final  Map<String, bool> obscureMap = const <String, bool>{}, this.error = ''}): _entries = entries,_filteredEntries = filteredEntries,_emails = emails,_obscureMap = obscureMap,super._();
  

@override@JsonKey() final  VaultStatus status;
 final  List<PasswordEntry> _entries;
@override@JsonKey() List<PasswordEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

 final  List<PasswordEntry> _filteredEntries;
@override@JsonKey() List<PasswordEntry> get filteredEntries {
  if (_filteredEntries is EqualUnmodifiableListView) return _filteredEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredEntries);
}

 final  List<String> _emails;
@override@JsonKey() List<String> get emails {
  if (_emails is EqualUnmodifiableListView) return _emails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emails);
}

@override@JsonKey() final  String searchQuery;
 final  Map<String, bool> _obscureMap;
@override@JsonKey() Map<String, bool> get obscureMap {
  if (_obscureMap is EqualUnmodifiableMapView) return _obscureMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_obscureMap);
}

@override@JsonKey() final  String error;

/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultStateCopyWith<_VaultState> get copyWith => __$VaultStateCopyWithImpl<_VaultState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._entries, _entries)&&const DeepCollectionEquality().equals(other._filteredEntries, _filteredEntries)&&const DeepCollectionEquality().equals(other._emails, _emails)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._obscureMap, _obscureMap)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_entries),const DeepCollectionEquality().hash(_filteredEntries),const DeepCollectionEquality().hash(_emails),searchQuery,const DeepCollectionEquality().hash(_obscureMap),error);

@override
String toString() {
  return 'VaultState(status: $status, entries: $entries, filteredEntries: $filteredEntries, emails: $emails, searchQuery: $searchQuery, obscureMap: $obscureMap, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VaultStateCopyWith<$Res> implements $VaultStateCopyWith<$Res> {
  factory _$VaultStateCopyWith(_VaultState value, $Res Function(_VaultState) _then) = __$VaultStateCopyWithImpl;
@override @useResult
$Res call({
 VaultStatus status, List<PasswordEntry> entries, List<PasswordEntry> filteredEntries, List<String> emails, String searchQuery, Map<String, bool> obscureMap, String error
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? entries = null,Object? filteredEntries = null,Object? emails = null,Object? searchQuery = null,Object? obscureMap = null,Object? error = null,}) {
  return _then(_VaultState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VaultStatus,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<PasswordEntry>,filteredEntries: null == filteredEntries ? _self._filteredEntries : filteredEntries // ignore: cast_nullable_to_non_nullable
as List<PasswordEntry>,emails: null == emails ? _self._emails : emails // ignore: cast_nullable_to_non_nullable
as List<String>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,obscureMap: null == obscureMap ? _self._obscureMap : obscureMap // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
