import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authenticateWithBiometrics() =
      AuthenticateWithBiometrics;
  const factory AuthEvent.authenticateWithPin(String pin) = AuthenticateWithPin;
  const factory AuthEvent.setPin(String pin) = SetPin;
  const factory AuthEvent.startSession() = StartSession;
  const factory AuthEvent.endSession() = EndSession;
  const factory AuthEvent.checkPinStatus() = CheckPinStatus;
  const factory AuthEvent.resetPinWithBiometric() = ResetPinWithBiometric;
}
