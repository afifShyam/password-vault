import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const AndroidOptions _androidOptions = AndroidOptions(
  encryptedSharedPreferences: true,
  sharedPreferencesName: 'pass_vault_secure_store',
  preferencesKeyPrefix: 'pass_vault_',
);

const IOSOptions _iosOptions = IOSOptions(
  accessibility: KeychainAccessibility.first_unlock,
  synchronizable: true,
);

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: _androidOptions,
    iOptions: _iosOptions,
  );
  late final Future<void> _init = _warmUp();

  static const String _pinKey = 'user_pin';
  static const String _emailKey = 'saved_emails';
  static const String encryptionKeyStorageKey = 'vault_encryption_key';
  static const Set<String> _reservedKeys = {
    _pinKey,
    _emailKey,
    encryptionKeyStorageKey,
  };

  Future<T?> _guard<T>(Future<T?> Function() action) async {
    await _init;
    try {
      return await action();
    } on PlatformException catch (e) {
      // Some Android devices/emulators throw unwrap errors when keystore
      // material is invalid. Clearing storage forces regeneration.
      final message = e.message ?? '';
      if (message.toLowerCase().contains('unwrap key failed') ||
          message.toLowerCase().contains('keystore')) {
        log('Secure storage error, resetting keystore: $message');
        await _storage.deleteAll();
        return null;
      }
      rethrow;
    }
  }

  /// Proactively probe secure storage so keystore issues are handled once.
  Future<void> _warmUp() async {
    try {
      await _storage.readAll();
    } on PlatformException catch (e) {
      final message = e.message ?? '';
      if (message.toLowerCase().contains('unwrap key failed') ||
          message.toLowerCase().contains('keystore')) {
        log('Secure storage warmup detected keystore error; clearing store');
        await _storage.deleteAll();
      } else {
        log('Secure storage warmup error: $message');
      }
    }
  }

  // Password storage
  Future<void> savePassword({
    required String key,
    required String value,
  }) async {
    await _guard(() => _storage.write(key: key, value: value));
  }

  Future<String?> readPassword(String key) async {
    return await _guard(() => _storage.read(key: key));
  }

  Future<void> deletePassword(String key) async {
    await _guard(() => _storage.delete(key: key));
  }

  Future<List<String>> getAllKeys() async {
    final data = await _guard(() => _storage.readAll()) ?? {};
    return data.keys.where((key) => !_reservedKeys.contains(key)).toList();
  }

  Future<Map<String, String>> getAllPasswords() async {
    final data = await _guard(() => _storage.readAll()) ?? {};
    return Map.fromEntries(
      data.entries.where((entry) => !_reservedKeys.contains(entry.key)),
    );
  }

  // Email storage
  Future<void> saveEmail(String email) async {
    final emails = await getEmails();
    if (!emails.contains(email)) {
      final updated = [...emails, email];
      await _guard(
        () => _storage.write(key: _emailKey, value: updated.join(',')),
      );
    }
  }

  Future<List<String>> getEmails() async {
    final csv = await _guard(() => _storage.read(key: _emailKey));
    if (csv == null || csv.trim().isEmpty) return [];
    return csv
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  // PIN storage
  Future<void> setPin(String pin) async {
    await _guard(() => _storage.write(key: _pinKey, value: pin));
  }

  Future<bool> verifyPin(String inputPin) async {
    final storedPin = await _guard(() => _storage.read(key: _pinKey));
    if (storedPin == null) return false;

    // Some older versions stored plain text, others used JSON encoding.
    try {
      final decoded = jsonDecode(storedPin);
      return decoded.toString() == inputPin;
    } catch (_) {
      return storedPin == inputPin;
    }
  }

  Future<bool> isPinSet() async {
    final storedPin = await _guard(() => _storage.read(key: _pinKey));
    return storedPin != null;
  }

  Future<void> clearPin() async {
    await _guard(() => _storage.delete(key: _pinKey));
  }

  // Encryption key storage
  Future<void> saveEncryptionKey(String encodedKey) async {
    await _guard(
      () => _storage.write(key: encryptionKeyStorageKey, value: encodedKey),
    );
  }

  Future<String?> readEncryptionKey() async {
    return _guard(() => _storage.read(key: encryptionKeyStorageKey));
  }
}
