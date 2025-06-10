import 'dart:developer';

import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      final bool canCheckBiometrics = await _auth.canCheckBiometrics;
      final bool isDeviceSupported = await _auth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) return false;

      return await _auth.authenticate(
        localizedReason: 'Please authenticate to access your password vault',
        options: const AuthenticationOptions(
          biometricOnly: false, // Allows fallback to device passcode
          stickyAuth: true,
        ),
      );
    } catch (e) {
      log('AuthService error: $e');
      return false;
    }
  }
}
