import 'dart:convert';
import 'dart:developer';

import 'package:pass_vault/model/password_entry.dart';
import 'package:pass_vault/services/encryption_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseVaultRemote {
  const SupabaseVaultRemote({
    required SupabaseClient client,
    required EncryptionService encryptionService,
  })  : _client = client,
        _encryptionService = encryptionService;

  final SupabaseClient _client;
  final EncryptionService _encryptionService;

  static const String _table = 'vault_entries';

  Future<List<PasswordEntry>> fetchEntries() async {
    try {
      final userId = _client.auth.currentUser?.id;
      final query = _client.from(_table).select();
      final rows = userId != null ? await query.eq('user_id', userId) : await query;
      final entries = <PasswordEntry>[];

      for (final row in rows) {
        final payload = row['payload'] as String?;
        final entryKey = row['entry_key'] as String?;
        if (payload == null || payload.isEmpty) continue;

        try {
          final decodedJson = jsonDecode(
            await _encryptionService.decrypt(payload),
          );
          if (decodedJson is Map<String, dynamic>) {
            entries.add(PasswordEntry.fromJson(decodedJson));
          }
        } catch (e) {
          log('Skipping remote row due to decrypt/parse error: $e');
          if (entryKey != null && entryKey.isNotEmpty) {
            await _deleteSilently(entryKey);
          }
        }
      }

      return entries;
    } catch (e) {
      log('Supabase fetch failed: $e');
      return [];
    }
  }

  Future<void> upsertEntry(PasswordEntry entry) async {
    try {
      final userId = _client.auth.currentUser?.id;
      final encrypted =
          await _encryptionService.encrypt(jsonEncode(entry.toJson()));

      await _client.from(_table).upsert({
        if (userId != null) 'user_id': userId,
        'entry_key': entry.title, // stable key for updates/deletes
        'title': entry.title,
        'email': entry.email,
        'payload': encrypted,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      });
    } catch (e) {
      log('Supabase upsert failed for ${entry.title}: $e');
    }
  }

  Future<void> deleteEntry(String title) async {
    try {
      final userId = _client.auth.currentUser?.id;
      final query = _client.from(_table).delete().eq('entry_key', title);
      if (userId != null) {
        await query.eq('user_id', userId);
      } else {
        await query;
      }
    } catch (e) {
      log('Supabase delete failed for $title: $e');
    }
  }

  Future<void> updateEntry({
    required String oldKey,
    required PasswordEntry entry,
  }) async {
    try {
      final userId = _client.auth.currentUser?.id;
      final encrypted =
          await _encryptionService.encrypt(jsonEncode(entry.toJson()));

      var query = _client.from(_table).update({
        'entry_key': entry.title,
        'title': entry.title,
        'email': entry.email,
        'payload': encrypted,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      }).eq('entry_key', oldKey);

      if (userId != null) {
        query = query.eq('user_id', userId);
      }

      final result = await query.select();
      if (result.isEmpty) {
        await upsertEntry(entry);
      }
    } catch (e) {
      log('Supabase update failed for ${entry.title}: $e');
    }
  }

  Future<void> _deleteSilently(String title) async {
    try {
      await _client.from(_table).delete().eq('entry_key', title);
    } catch (_) {
      // silent
    }
  }
}
