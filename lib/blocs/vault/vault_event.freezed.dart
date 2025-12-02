// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VaultEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultEvent()';
}


}

/// @nodoc
class $VaultEventCopyWith<$Res>  {
$VaultEventCopyWith(VaultEvent _, $Res Function(VaultEvent) __);
}


/// Adds pattern-matching-related methods to [VaultEvent].
extension VaultEventPatterns on VaultEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadVault value)?  load,TResult Function( AddEntry value)?  addEntry,TResult Function( UpdateEntry value)?  updateEntry,TResult Function( DeleteEntry value)?  deleteEntry,TResult Function( SetSearchQuery value)?  setSearchQuery,TResult Function( HideAll value)?  hideAll,TResult Function( ToggleVisibility value)?  toggleVisibility,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadVault() when load != null:
return load(_that);case AddEntry() when addEntry != null:
return addEntry(_that);case UpdateEntry() when updateEntry != null:
return updateEntry(_that);case DeleteEntry() when deleteEntry != null:
return deleteEntry(_that);case SetSearchQuery() when setSearchQuery != null:
return setSearchQuery(_that);case HideAll() when hideAll != null:
return hideAll(_that);case ToggleVisibility() when toggleVisibility != null:
return toggleVisibility(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadVault value)  load,required TResult Function( AddEntry value)  addEntry,required TResult Function( UpdateEntry value)  updateEntry,required TResult Function( DeleteEntry value)  deleteEntry,required TResult Function( SetSearchQuery value)  setSearchQuery,required TResult Function( HideAll value)  hideAll,required TResult Function( ToggleVisibility value)  toggleVisibility,}){
final _that = this;
switch (_that) {
case LoadVault():
return load(_that);case AddEntry():
return addEntry(_that);case UpdateEntry():
return updateEntry(_that);case DeleteEntry():
return deleteEntry(_that);case SetSearchQuery():
return setSearchQuery(_that);case HideAll():
return hideAll(_that);case ToggleVisibility():
return toggleVisibility(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadVault value)?  load,TResult? Function( AddEntry value)?  addEntry,TResult? Function( UpdateEntry value)?  updateEntry,TResult? Function( DeleteEntry value)?  deleteEntry,TResult? Function( SetSearchQuery value)?  setSearchQuery,TResult? Function( HideAll value)?  hideAll,TResult? Function( ToggleVisibility value)?  toggleVisibility,}){
final _that = this;
switch (_that) {
case LoadVault() when load != null:
return load(_that);case AddEntry() when addEntry != null:
return addEntry(_that);case UpdateEntry() when updateEntry != null:
return updateEntry(_that);case DeleteEntry() when deleteEntry != null:
return deleteEntry(_that);case SetSearchQuery() when setSearchQuery != null:
return setSearchQuery(_that);case HideAll() when hideAll != null:
return hideAll(_that);case ToggleVisibility() when toggleVisibility != null:
return toggleVisibility(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String title,  String password,  String? email)?  addEntry,TResult Function( String oldTitle,  String newTitle,  String password,  String? email)?  updateEntry,TResult Function( String title)?  deleteEntry,TResult Function( String query)?  setSearchQuery,TResult Function()?  hideAll,TResult Function( String id)?  toggleVisibility,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadVault() when load != null:
return load();case AddEntry() when addEntry != null:
return addEntry(_that.title,_that.password,_that.email);case UpdateEntry() when updateEntry != null:
return updateEntry(_that.oldTitle,_that.newTitle,_that.password,_that.email);case DeleteEntry() when deleteEntry != null:
return deleteEntry(_that.title);case SetSearchQuery() when setSearchQuery != null:
return setSearchQuery(_that.query);case HideAll() when hideAll != null:
return hideAll();case ToggleVisibility() when toggleVisibility != null:
return toggleVisibility(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String title,  String password,  String? email)  addEntry,required TResult Function( String oldTitle,  String newTitle,  String password,  String? email)  updateEntry,required TResult Function( String title)  deleteEntry,required TResult Function( String query)  setSearchQuery,required TResult Function()  hideAll,required TResult Function( String id)  toggleVisibility,}) {final _that = this;
switch (_that) {
case LoadVault():
return load();case AddEntry():
return addEntry(_that.title,_that.password,_that.email);case UpdateEntry():
return updateEntry(_that.oldTitle,_that.newTitle,_that.password,_that.email);case DeleteEntry():
return deleteEntry(_that.title);case SetSearchQuery():
return setSearchQuery(_that.query);case HideAll():
return hideAll();case ToggleVisibility():
return toggleVisibility(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String title,  String password,  String? email)?  addEntry,TResult? Function( String oldTitle,  String newTitle,  String password,  String? email)?  updateEntry,TResult? Function( String title)?  deleteEntry,TResult? Function( String query)?  setSearchQuery,TResult? Function()?  hideAll,TResult? Function( String id)?  toggleVisibility,}) {final _that = this;
switch (_that) {
case LoadVault() when load != null:
return load();case AddEntry() when addEntry != null:
return addEntry(_that.title,_that.password,_that.email);case UpdateEntry() when updateEntry != null:
return updateEntry(_that.oldTitle,_that.newTitle,_that.password,_that.email);case DeleteEntry() when deleteEntry != null:
return deleteEntry(_that.title);case SetSearchQuery() when setSearchQuery != null:
return setSearchQuery(_that.query);case HideAll() when hideAll != null:
return hideAll();case ToggleVisibility() when toggleVisibility != null:
return toggleVisibility(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class LoadVault implements VaultEvent {
  const LoadVault();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadVault);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultEvent.load()';
}


}




/// @nodoc


class AddEntry implements VaultEvent {
  const AddEntry({required this.title, required this.password, this.email});
  

 final  String title;
 final  String password;
 final  String? email;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddEntryCopyWith<AddEntry> get copyWith => _$AddEntryCopyWithImpl<AddEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddEntry&&(identical(other.title, title) || other.title == title)&&(identical(other.password, password) || other.password == password)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,title,password,email);

@override
String toString() {
  return 'VaultEvent.addEntry(title: $title, password: $password, email: $email)';
}


}

/// @nodoc
abstract mixin class $AddEntryCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $AddEntryCopyWith(AddEntry value, $Res Function(AddEntry) _then) = _$AddEntryCopyWithImpl;
@useResult
$Res call({
 String title, String password, String? email
});




}
/// @nodoc
class _$AddEntryCopyWithImpl<$Res>
    implements $AddEntryCopyWith<$Res> {
  _$AddEntryCopyWithImpl(this._self, this._then);

  final AddEntry _self;
  final $Res Function(AddEntry) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? password = null,Object? email = freezed,}) {
  return _then(AddEntry(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UpdateEntry implements VaultEvent {
  const UpdateEntry({required this.oldTitle, required this.newTitle, required this.password, this.email});
  

 final  String oldTitle;
 final  String newTitle;
 final  String password;
 final  String? email;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateEntryCopyWith<UpdateEntry> get copyWith => _$UpdateEntryCopyWithImpl<UpdateEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateEntry&&(identical(other.oldTitle, oldTitle) || other.oldTitle == oldTitle)&&(identical(other.newTitle, newTitle) || other.newTitle == newTitle)&&(identical(other.password, password) || other.password == password)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,oldTitle,newTitle,password,email);

@override
String toString() {
  return 'VaultEvent.updateEntry(oldTitle: $oldTitle, newTitle: $newTitle, password: $password, email: $email)';
}


}

/// @nodoc
abstract mixin class $UpdateEntryCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $UpdateEntryCopyWith(UpdateEntry value, $Res Function(UpdateEntry) _then) = _$UpdateEntryCopyWithImpl;
@useResult
$Res call({
 String oldTitle, String newTitle, String password, String? email
});




}
/// @nodoc
class _$UpdateEntryCopyWithImpl<$Res>
    implements $UpdateEntryCopyWith<$Res> {
  _$UpdateEntryCopyWithImpl(this._self, this._then);

  final UpdateEntry _self;
  final $Res Function(UpdateEntry) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldTitle = null,Object? newTitle = null,Object? password = null,Object? email = freezed,}) {
  return _then(UpdateEntry(
oldTitle: null == oldTitle ? _self.oldTitle : oldTitle // ignore: cast_nullable_to_non_nullable
as String,newTitle: null == newTitle ? _self.newTitle : newTitle // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DeleteEntry implements VaultEvent {
  const DeleteEntry(this.title);
  

 final  String title;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteEntryCopyWith<DeleteEntry> get copyWith => _$DeleteEntryCopyWithImpl<DeleteEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteEntry&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'VaultEvent.deleteEntry(title: $title)';
}


}

/// @nodoc
abstract mixin class $DeleteEntryCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $DeleteEntryCopyWith(DeleteEntry value, $Res Function(DeleteEntry) _then) = _$DeleteEntryCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class _$DeleteEntryCopyWithImpl<$Res>
    implements $DeleteEntryCopyWith<$Res> {
  _$DeleteEntryCopyWithImpl(this._self, this._then);

  final DeleteEntry _self;
  final $Res Function(DeleteEntry) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(DeleteEntry(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SetSearchQuery implements VaultEvent {
  const SetSearchQuery(this.query);
  

 final  String query;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetSearchQueryCopyWith<SetSearchQuery> get copyWith => _$SetSearchQueryCopyWithImpl<SetSearchQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetSearchQuery&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'VaultEvent.setSearchQuery(query: $query)';
}


}

/// @nodoc
abstract mixin class $SetSearchQueryCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $SetSearchQueryCopyWith(SetSearchQuery value, $Res Function(SetSearchQuery) _then) = _$SetSearchQueryCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SetSearchQueryCopyWithImpl<$Res>
    implements $SetSearchQueryCopyWith<$Res> {
  _$SetSearchQueryCopyWithImpl(this._self, this._then);

  final SetSearchQuery _self;
  final $Res Function(SetSearchQuery) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SetSearchQuery(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HideAll implements VaultEvent {
  const HideAll();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HideAll);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultEvent.hideAll()';
}


}




/// @nodoc


class ToggleVisibility implements VaultEvent {
  const ToggleVisibility(this.id);
  

 final  String id;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleVisibilityCopyWith<ToggleVisibility> get copyWith => _$ToggleVisibilityCopyWithImpl<ToggleVisibility>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleVisibility&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'VaultEvent.toggleVisibility(id: $id)';
}


}

/// @nodoc
abstract mixin class $ToggleVisibilityCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $ToggleVisibilityCopyWith(ToggleVisibility value, $Res Function(ToggleVisibility) _then) = _$ToggleVisibilityCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ToggleVisibilityCopyWithImpl<$Res>
    implements $ToggleVisibilityCopyWith<$Res> {
  _$ToggleVisibilityCopyWithImpl(this._self, this._then);

  final ToggleVisibility _self;
  final $Res Function(ToggleVisibility) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ToggleVisibility(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
