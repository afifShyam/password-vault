import 'dart:developer';
import 'package:local_auth/local_auth.dart';
import 'secure_storage_service.dart';

class AuthService {
  final LocalAuthentication _auth = LocalAuthentication();
  final SecureStorageService _storageService = SecureStorageService();

  /// Authenticate using biometrics or device PIN/passcode
  Future<bool> authenticate() async {
    try {
      final bool canCheckBiometrics = await _auth.canCheckBiometrics;
      final bool isDeviceSupported = await _auth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) return false;

      return await _auth.authenticate(
        localizedReason: 'Please authenticate to access your password vault',
      );
    } catch (e) {
      log('AuthService error: $e');
      return false;
    }
  }

  /// Biometric reset
  Future<bool> attemptBiometricReset() async {
    final isAvailable = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();

    if (!isAvailable || !isDeviceSupported) return false;

    try {
      return await _auth.authenticate(
        localizedReason: 'Authenticate to reset your app PIN',
      );
    } catch (e) {
      log('Biometric reset failed: $e');
      return false;
    }
  }

  /// Delegate PIN methods to SecureStorageService

  Future<void> setPin(String pin) => _storageService.setPin(pin);

  Future<bool> verifyPin(String inputPin) =>
      _storageService.verifyPin(inputPin);

  Future<bool> isPinSet() => _storageService.isPinSet();

  Future<void> clearPin() => _storageService.clearPin();
}
