import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  bool _isAuthenticated = false;
  int _failedAttempts = 0;

  bool get isAuthenticated => _isAuthenticated;
  int get failedAttempts => _failedAttempts;

  AuthViewModel(this._authService);

  Future<void> authenticate() async {
    final success = await _authService.authenticate();
    if (success) {
      _isAuthenticated = true;
      _failedAttempts = 0;
    } else {
      _failedAttempts++;
    }
    notifyListeners();
  }

  void reset() {
    _isAuthenticated = false;
    _failedAttempts = 0;
    notifyListeners();
  }
}
