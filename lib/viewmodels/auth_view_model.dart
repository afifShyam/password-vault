import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  bool _isAuthenticated = false;
  int _failedAttempts = 0;

  bool get isAuthenticated => _isAuthenticated;
  int get failedAttempts => _failedAttempts;

  AuthViewModel(this._authService);

  /// Biometric authentication
  Future<void> authenticateWithBiometrics() async {
    final success = await _authService.authenticate();
    if (success) {
      _isAuthenticated = true;
      _failedAttempts = 0;
    } else {
      _failedAttempts++;
    }
    notifyListeners();
  }

  /// PIN authentication using stored PIN from secure storage
  Future<bool> authenticateWithPin(String pin) async {
    final success = await _authService.verifyPin(pin);
    if (success) {
      _isAuthenticated = true;
      _failedAttempts = 0;
    } else {
      _failedAttempts++;
    }
    notifyListeners();
    return success;
  }

  /// Biometric reset
  Future<bool> resetPinViaBiometric() async {
    final success = await _authService.attemptBiometricReset();
    if (success) {
      await _authService.clearPin(); // delete old PIN
      return true;
    }
    return false;
  }

  /// Set new PIN
  Future<void> setNewPin(String pin) async {
    await _authService.setPin(pin);
  }

  /// Call to set authenticated state directly (if needed)
  void setAuthenticated(bool value) {
    _isAuthenticated = value;
    if (value) {
      _failedAttempts = 0;
    }
    notifyListeners();
  }

  /// Check if PIN is set
  Future<bool> isPinSet() async {
    return await _authService.isPinSet();
  }

  /// Manually increment failed attempts
  void incrementFailedAttempts() {
    _failedAttempts++;
    notifyListeners();
  }

  /// Reset state (logout or retry)
  void reset() {
    _isAuthenticated = false;
    _failedAttempts = 0;
    notifyListeners();
  }
}
