import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_vault/services/auth_service.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authService) : super(const AuthState()) {
    on<AuthenticateWithBiometrics>(_onBiometricAuth);
    on<AuthenticateWithPin>(_onPinAuth);
    on<SetPin>(_onSetPin);
    on<CheckPinStatus>(_onCheckPinStatus);
    on<ResetPinWithBiometric>(_onResetPinWithBiometric);
    on<StartSession>(_onStartSession);
    on<EndSession>(_onEndSession);
  }

  Future<void> _onResetPinWithBiometric(
    ResetPinWithBiometric event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, error: ''));
    final success = await _authService.attemptBiometricReset();
    if (success) {
      await _authService.clearPin();
      emit(
        state.copyWith(
          status: AuthStatus.initial,
          isPinSet: false,
          failedAttempts: 0,
          error: '',
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          error: 'Unable to reset PIN with biometrics',
        ),
      );
    }
  }

  final AuthService _authService;

  Future<void> _onBiometricAuth(
    AuthenticateWithBiometrics event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, error: ''));
    final success = await _authService.authenticate();
    if (success) {
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          failedAttempts: 0,
          error: '',
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          failedAttempts: state.failedAttempts + 1,
          error: 'Biometric authentication failed',
        ),
      );
    }
  }

  Future<void> _onPinAuth(
    AuthenticateWithPin event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, error: ''));
    final success = await _authService.verifyPin(event.pin);
    if (success) {
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          failedAttempts: 0,
          isSessionActive: true,
          error: '',
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          failedAttempts: state.failedAttempts + 1,
          error: 'Invalid PIN',
        ),
      );
    }
  }

  Future<void> _onSetPin(SetPin event, Emitter<AuthState> emit) async {
    await _authService.setPin(event.pin);
    emit(state.copyWith(isPinSet: true));
  }

  Future<void> _onCheckPinStatus(
    CheckPinStatus event,
    Emitter<AuthState> emit,
  ) async {
    final isSet = await _authService.isPinSet();
    emit(state.copyWith(isPinSet: isSet));
  }

  Future<void> _onStartSession(
    StartSession event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isSessionActive: true));
  }

  Future<void> _onEndSession(EndSession event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSessionActive: false, status: AuthStatus.initial));
  }
}
