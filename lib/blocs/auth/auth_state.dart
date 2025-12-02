import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthStatus { initial, loading, authenticated, error }

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    @Default(0) int failedAttempts,
    @Default(false) bool isPinSet,
    @Default(false) bool isSessionActive,
    @Default('') String error,
  }) = _AuthState;
  const AuthState._();

  bool get isLoading => status == AuthStatus.loading;
  bool get isAuthed => status == AuthStatus.authenticated;
}
