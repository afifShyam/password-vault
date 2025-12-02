// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioState {

 PortfolioStatus get status; WebViewController? get controller; bool get isInitialized; bool get canGoBack; bool get canGoForward; double get progress; String get errorMessage;
/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioStateCopyWith<PortfolioState> get copyWith => _$PortfolioStateCopyWithImpl<PortfolioState>(this as PortfolioState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioState&&(identical(other.status, status) || other.status == status)&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,controller,isInitialized,canGoBack,canGoForward,progress,errorMessage);

@override
String toString() {
  return 'PortfolioState(status: $status, controller: $controller, isInitialized: $isInitialized, canGoBack: $canGoBack, canGoForward: $canGoForward, progress: $progress, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PortfolioStateCopyWith<$Res>  {
  factory $PortfolioStateCopyWith(PortfolioState value, $Res Function(PortfolioState) _then) = _$PortfolioStateCopyWithImpl;
@useResult
$Res call({
 PortfolioStatus status, WebViewController? controller, bool isInitialized, bool canGoBack, bool canGoForward, double progress, String errorMessage
});




}
/// @nodoc
class _$PortfolioStateCopyWithImpl<$Res>
    implements $PortfolioStateCopyWith<$Res> {
  _$PortfolioStateCopyWithImpl(this._self, this._then);

  final PortfolioState _self;
  final $Res Function(PortfolioState) _then;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? controller = freezed,Object? isInitialized = null,Object? canGoBack = null,Object? canGoForward = null,Object? progress = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PortfolioStatus,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as WebViewController?,isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioState].
extension PortfolioStatePatterns on PortfolioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioState value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioState value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PortfolioStatus status,  WebViewController? controller,  bool isInitialized,  bool canGoBack,  bool canGoForward,  double progress,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
return $default(_that.status,_that.controller,_that.isInitialized,_that.canGoBack,_that.canGoForward,_that.progress,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PortfolioStatus status,  WebViewController? controller,  bool isInitialized,  bool canGoBack,  bool canGoForward,  double progress,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PortfolioState():
return $default(_that.status,_that.controller,_that.isInitialized,_that.canGoBack,_that.canGoForward,_that.progress,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PortfolioStatus status,  WebViewController? controller,  bool isInitialized,  bool canGoBack,  bool canGoForward,  double progress,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
return $default(_that.status,_that.controller,_that.isInitialized,_that.canGoBack,_that.canGoForward,_that.progress,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioState extends PortfolioState {
  const _PortfolioState({this.status = PortfolioStatus.initial, this.controller, this.isInitialized = false, this.canGoBack = false, this.canGoForward = false, this.progress = 0.0, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  PortfolioStatus status;
@override final  WebViewController? controller;
@override@JsonKey() final  bool isInitialized;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;
@override@JsonKey() final  double progress;
@override@JsonKey() final  String errorMessage;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioStateCopyWith<_PortfolioState> get copyWith => __$PortfolioStateCopyWithImpl<_PortfolioState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioState&&(identical(other.status, status) || other.status == status)&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,controller,isInitialized,canGoBack,canGoForward,progress,errorMessage);

@override
String toString() {
  return 'PortfolioState(status: $status, controller: $controller, isInitialized: $isInitialized, canGoBack: $canGoBack, canGoForward: $canGoForward, progress: $progress, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PortfolioStateCopyWith<$Res> implements $PortfolioStateCopyWith<$Res> {
  factory _$PortfolioStateCopyWith(_PortfolioState value, $Res Function(_PortfolioState) _then) = __$PortfolioStateCopyWithImpl;
@override @useResult
$Res call({
 PortfolioStatus status, WebViewController? controller, bool isInitialized, bool canGoBack, bool canGoForward, double progress, String errorMessage
});




}
/// @nodoc
class __$PortfolioStateCopyWithImpl<$Res>
    implements _$PortfolioStateCopyWith<$Res> {
  __$PortfolioStateCopyWithImpl(this._self, this._then);

  final _PortfolioState _self;
  final $Res Function(_PortfolioState) _then;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? controller = freezed,Object? isInitialized = null,Object? canGoBack = null,Object? canGoForward = null,Object? progress = null,Object? errorMessage = null,}) {
  return _then(_PortfolioState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PortfolioStatus,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as WebViewController?,isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
