import 'dart:convert';

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

  static const String _pinKey = 'user_pin';
  static const String _emailKey = 'saved_emails';

  // Password storage
  Future<void> savePassword({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readPassword(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deletePassword(String key) async {
    await _storage.delete(key: key);
  }

  Future<List<String>> getAllKeys() async {
    return await _storage.readAll().then((data) => data.keys.toList());
  }

  Future<Map<String, String>> getAllPasswords() async {
    return await _storage.readAll();
  }

  // Email storage
  Future<void> saveEmail(String email) async {
    final emails = await getEmails();
    if (!emails.contains(email)) {
      final updated = [...emails, email];
      await _storage.write(key: _emailKey, value: updated.join(','));
    }
  }

  Future<List<String>> getEmails() async {
    final csv = await _storage.read(key: _emailKey);
    if (csv == null || csv.trim().isEmpty) return [];
    return csv
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  // PIN storage
  Future<void> setPin(String pin) async {
    await _storage.write(key: _pinKey, value: pin);
  }

  Future<bool> verifyPin(String inputPin) async {
    final storedPin = await _storage.read(key: _pinKey);
    final decodedPin = jsonDecode(storedPin ?? '');

    return storedPin != null && decodedPin['password'] == inputPin;
  }

  Future<bool> isPinSet() async {
    final storedPin = await _storage.read(key: _pinKey);
    return storedPin != null;
  }

  Future<void> clearPin() async {
    await _storage.delete(key: _pinKey);
  }
}
