// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthenticateWithBiometrics value)?  authenticateWithBiometrics,TResult Function( AuthenticateWithPin value)?  authenticateWithPin,TResult Function( SetPin value)?  setPin,TResult Function( StartSession value)?  startSession,TResult Function( EndSession value)?  endSession,TResult Function( CheckPinStatus value)?  checkPinStatus,TResult Function( ResetPinWithBiometric value)?  resetPinWithBiometric,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthenticateWithBiometrics() when authenticateWithBiometrics != null:
return authenticateWithBiometrics(_that);case AuthenticateWithPin() when authenticateWithPin != null:
return authenticateWithPin(_that);case SetPin() when setPin != null:
return setPin(_that);case StartSession() when startSession != null:
return startSession(_that);case EndSession() when endSession != null:
return endSession(_that);case CheckPinStatus() when checkPinStatus != null:
return checkPinStatus(_that);case ResetPinWithBiometric() when resetPinWithBiometric != null:
return resetPinWithBiometric(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthenticateWithBiometrics value)  authenticateWithBiometrics,required TResult Function( AuthenticateWithPin value)  authenticateWithPin,required TResult Function( SetPin value)  setPin,required TResult Function( StartSession value)  startSession,required TResult Function( EndSession value)  endSession,required TResult Function( CheckPinStatus value)  checkPinStatus,required TResult Function( ResetPinWithBiometric value)  resetPinWithBiometric,}){
final _that = this;
switch (_that) {
case AuthenticateWithBiometrics():
return authenticateWithBiometrics(_that);case AuthenticateWithPin():
return authenticateWithPin(_that);case SetPin():
return setPin(_that);case StartSession():
return startSession(_that);case EndSession():
return endSession(_that);case CheckPinStatus():
return checkPinStatus(_that);case ResetPinWithBiometric():
return resetPinWithBiometric(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthenticateWithBiometrics value)?  authenticateWithBiometrics,TResult? Function( AuthenticateWithPin value)?  authenticateWithPin,TResult? Function( SetPin value)?  setPin,TResult? Function( StartSession value)?  startSession,TResult? Function( EndSession value)?  endSession,TResult? Function( CheckPinStatus value)?  checkPinStatus,TResult? Function( ResetPinWithBiometric value)?  resetPinWithBiometric,}){
final _that = this;
switch (_that) {
case AuthenticateWithBiometrics() when authenticateWithBiometrics != null:
return authenticateWithBiometrics(_that);case AuthenticateWithPin() when authenticateWithPin != null:
return authenticateWithPin(_that);case SetPin() when setPin != null:
return setPin(_that);case StartSession() when startSession != null:
return startSession(_that);case EndSession() when endSession != null:
return endSession(_that);case CheckPinStatus() when checkPinStatus != null:
return checkPinStatus(_that);case ResetPinWithBiometric() when resetPinWithBiometric != null:
return resetPinWithBiometric(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authenticateWithBiometrics,TResult Function( String pin)?  authenticateWithPin,TResult Function( String pin)?  setPin,TResult Function()?  startSession,TResult Function()?  endSession,TResult Function()?  checkPinStatus,TResult Function()?  resetPinWithBiometric,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthenticateWithBiometrics() when authenticateWithBiometrics != null:
return authenticateWithBiometrics();case AuthenticateWithPin() when authenticateWithPin != null:
return authenticateWithPin(_that.pin);case SetPin() when setPin != null:
return setPin(_that.pin);case StartSession() when startSession != null:
return startSession();case EndSession() when endSession != null:
return endSession();case CheckPinStatus() when checkPinStatus != null:
return checkPinStatus();case ResetPinWithBiometric() when resetPinWithBiometric != null:
return resetPinWithBiometric();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authenticateWithBiometrics,required TResult Function( String pin)  authenticateWithPin,required TResult Function( String pin)  setPin,required TResult Function()  startSession,required TResult Function()  endSession,required TResult Function()  checkPinStatus,required TResult Function()  resetPinWithBiometric,}) {final _that = this;
switch (_that) {
case AuthenticateWithBiometrics():
return authenticateWithBiometrics();case AuthenticateWithPin():
return authenticateWithPin(_that.pin);case SetPin():
return setPin(_that.pin);case StartSession():
return startSession();case EndSession():
return endSession();case CheckPinStatus():
return checkPinStatus();case ResetPinWithBiometric():
return resetPinWithBiometric();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authenticateWithBiometrics,TResult? Function( String pin)?  authenticateWithPin,TResult? Function( String pin)?  setPin,TResult? Function()?  startSession,TResult? Function()?  endSession,TResult? Function()?  checkPinStatus,TResult? Function()?  resetPinWithBiometric,}) {final _that = this;
switch (_that) {
case AuthenticateWithBiometrics() when authenticateWithBiometrics != null:
return authenticateWithBiometrics();case AuthenticateWithPin() when authenticateWithPin != null:
return authenticateWithPin(_that.pin);case SetPin() when setPin != null:
return setPin(_that.pin);case StartSession() when startSession != null:
return startSession();case EndSession() when endSession != null:
return endSession();case CheckPinStatus() when checkPinStatus != null:
return checkPinStatus();case ResetPinWithBiometric() when resetPinWithBiometric != null:
return resetPinWithBiometric();case _:
  return null;

}
}

}

/// @nodoc


class AuthenticateWithBiometrics implements AuthEvent {
  const AuthenticateWithBiometrics();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticateWithBiometrics);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.authenticateWithBiometrics()';
}


}




/// @nodoc


class AuthenticateWithPin implements AuthEvent {
  const AuthenticateWithPin(this.pin);
  

 final  String pin;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticateWithPinCopyWith<AuthenticateWithPin> get copyWith => _$AuthenticateWithPinCopyWithImpl<AuthenticateWithPin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticateWithPin&&(identical(other.pin, pin) || other.pin == pin));
}


@override
int get hashCode => Object.hash(runtimeType,pin);

@override
String toString() {
  return 'AuthEvent.authenticateWithPin(pin: $pin)';
}


}

/// @nodoc
abstract mixin class $AuthenticateWithPinCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthenticateWithPinCopyWith(AuthenticateWithPin value, $Res Function(AuthenticateWithPin) _then) = _$AuthenticateWithPinCopyWithImpl;
@useResult
$Res call({
 String pin
});




}
/// @nodoc
class _$AuthenticateWithPinCopyWithImpl<$Res>
    implements $AuthenticateWithPinCopyWith<$Res> {
  _$AuthenticateWithPinCopyWithImpl(this._self, this._then);

  final AuthenticateWithPin _self;
  final $Res Function(AuthenticateWithPin) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pin = null,}) {
  return _then(AuthenticateWithPin(
null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SetPin implements AuthEvent {
  const SetPin(this.pin);
  

 final  String pin;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetPinCopyWith<SetPin> get copyWith => _$SetPinCopyWithImpl<SetPin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetPin&&(identical(other.pin, pin) || other.pin == pin));
}


@override
int get hashCode => Object.hash(runtimeType,pin);

@override
String toString() {
  return 'AuthEvent.setPin(pin: $pin)';
}


}

/// @nodoc
abstract mixin class $SetPinCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SetPinCopyWith(SetPin value, $Res Function(SetPin) _then) = _$SetPinCopyWithImpl;
@useResult
$Res call({
 String pin
});




}
/// @nodoc
class _$SetPinCopyWithImpl<$Res>
    implements $SetPinCopyWith<$Res> {
  _$SetPinCopyWithImpl(this._self, this._then);

  final SetPin _self;
  final $Res Function(SetPin) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pin = null,}) {
  return _then(SetPin(
null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StartSession implements AuthEvent {
  const StartSession();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.startSession()';
}


}




/// @nodoc


class EndSession implements AuthEvent {
  const EndSession();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EndSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.endSession()';
}


}




/// @nodoc


class CheckPinStatus implements AuthEvent {
  const CheckPinStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPinStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkPinStatus()';
}


}




/// @nodoc


class ResetPinWithBiometric implements AuthEvent {
  const ResetPinWithBiometric();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPinWithBiometric);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.resetPinWithBiometric()';
}


}




// dart format on
