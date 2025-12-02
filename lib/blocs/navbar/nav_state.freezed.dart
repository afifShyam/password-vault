// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nav_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavState {

 int get index; bool get showNavBar;
/// Create a copy of NavState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavStateCopyWith<NavState> get copyWith => _$NavStateCopyWithImpl<NavState>(this as NavState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavState&&(identical(other.index, index) || other.index == index)&&(identical(other.showNavBar, showNavBar) || other.showNavBar == showNavBar));
}


@override
int get hashCode => Object.hash(runtimeType,index,showNavBar);

@override
String toString() {
  return 'NavState(index: $index, showNavBar: $showNavBar)';
}


}

/// @nodoc
abstract mixin class $NavStateCopyWith<$Res>  {
  factory $NavStateCopyWith(NavState value, $Res Function(NavState) _then) = _$NavStateCopyWithImpl;
@useResult
$Res call({
 int index, bool showNavBar
});




}
/// @nodoc
class _$NavStateCopyWithImpl<$Res>
    implements $NavStateCopyWith<$Res> {
  _$NavStateCopyWithImpl(this._self, this._then);

  final NavState _self;
  final $Res Function(NavState) _then;

/// Create a copy of NavState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? showNavBar = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,showNavBar: null == showNavBar ? _self.showNavBar : showNavBar // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NavState].
extension NavStatePatterns on NavState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavState value)  $default,){
final _that = this;
switch (_that) {
case _NavState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavState value)?  $default,){
final _that = this;
switch (_that) {
case _NavState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  bool showNavBar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavState() when $default != null:
return $default(_that.index,_that.showNavBar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  bool showNavBar)  $default,) {final _that = this;
switch (_that) {
case _NavState():
return $default(_that.index,_that.showNavBar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  bool showNavBar)?  $default,) {final _that = this;
switch (_that) {
case _NavState() when $default != null:
return $default(_that.index,_that.showNavBar);case _:
  return null;

}
}

}

/// @nodoc


class _NavState implements NavState {
  const _NavState({this.index = 0, this.showNavBar = true});
  

@override@JsonKey() final  int index;
@override@JsonKey() final  bool showNavBar;

/// Create a copy of NavState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavStateCopyWith<_NavState> get copyWith => __$NavStateCopyWithImpl<_NavState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavState&&(identical(other.index, index) || other.index == index)&&(identical(other.showNavBar, showNavBar) || other.showNavBar == showNavBar));
}


@override
int get hashCode => Object.hash(runtimeType,index,showNavBar);

@override
String toString() {
  return 'NavState(index: $index, showNavBar: $showNavBar)';
}


}

/// @nodoc
abstract mixin class _$NavStateCopyWith<$Res> implements $NavStateCopyWith<$Res> {
  factory _$NavStateCopyWith(_NavState value, $Res Function(_NavState) _then) = __$NavStateCopyWithImpl;
@override @useResult
$Res call({
 int index, bool showNavBar
});




}
/// @nodoc
class __$NavStateCopyWithImpl<$Res>
    implements _$NavStateCopyWith<$Res> {
  __$NavStateCopyWithImpl(this._self, this._then);

  final _NavState _self;
  final $Res Function(_NavState) _then;

/// Create a copy of NavState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? showNavBar = null,}) {
  return _then(_NavState(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,showNavBar: null == showNavBar ? _self.showNavBar : showNavBar // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
