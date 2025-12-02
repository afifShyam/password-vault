import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseKeyRemote {
  const SupabaseKeyRemote(this._client);

  final SupabaseClient _client;

  static const String _table = 'vault_keys';
  static const String _singletonId = 'primary';

  Future<String?> fetchKey() async {
    try {
      final rows = await _client
          .from(_table)
          .select('encoded_key')
          .eq('id', _singletonId)
          .limit(1);
      if (rows.isEmpty) return null;
      final value = rows.first['encoded_key'] as String?;
      return value;
    } catch (e) {
      log('Supabase key fetch failed: $e');
      return null;
    }
  }

  Future<void> saveKey(String encodedKey) async {
    try {
      await _client.from(_table).upsert({
        'id': _singletonId,
        'encoded_key': encodedKey,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      });
    } catch (e) {
      log('Supabase key save failed: $e');
    }
  }
}
