import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> savePassword({required String key, required String value}) async {
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

  Future<void> saveEmail(String email) async {
    final emails = await getEmails();
    if (!emails.contains(email)) {
      final updated = [...emails, email];
      await _storage.write(key: 'saved_emails', value: updated.join(','));
    }
  }

  Future<List<String>> getEmails() async {
    final csv = await _storage.read(key: 'saved_emails');
    if (csv == null || csv.trim().isEmpty) return [];
    return csv.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }
}
