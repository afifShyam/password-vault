import 'dart:convert';
import 'dart:developer';

import 'package:cryptography/cryptography.dart';

import 'secure_storage_service.dart';
import 'supabase_key_remote.dart';

/// A secure AES-256-GCM encryption/decryption service.
///
/// Features:
/// - AES-GCM with 256-bit key.
/// - Automatic secure key generation.
/// - Stores key in secure storage (Key is never hardcoded).
/// - Versioned payload (future-proof for algorithm changes).
/// - Strong error handling.
/// - Clear JSON format:
///
///   {
///     "v": 1,               // payload version
///     "nonce": "...",       // base64
///     "cipherText": "...",  // base64
///     "mac": "..."          // base64
///   }
///
class EncryptionService {
  EncryptionService(
    this._storageService, {
    SupabaseKeyRemote? keyRemote,
  })  : _cipher = AesGcm.with256bits(),
        _keyRemote = keyRemote;

  final SecureStorageService _storageService;
  final AesGcm _cipher;
  final SupabaseKeyRemote? _keyRemote;

  // Payload version: increment if you change formats/algorithms in future
  static const int _version = 1;

  /// Encrypts plaintext into a JSON payload.
  Future<String> encrypt(String plaintext) async {
    if (plaintext.isEmpty) {
      throw ArgumentError('Plaintext cannot be empty');
    }

    final secretKey = await _getOrCreateKey();
    final nonce = _cipher.newNonce(); // 12 bytes for GCM

    final secretBox = await _cipher.encrypt(
      utf8.encode(plaintext),
      secretKey: secretKey,
      nonce: nonce,
    );

    final payload = {
      'v': _version,
      'nonce': base64Encode(secretBox.nonce),
      'cipherText': base64Encode(secretBox.cipherText),
      'mac': base64Encode(secretBox.mac.bytes),
    };

    return jsonEncode(payload);
  }

  /// Decrypts the JSON payload back into plaintext.
  Future<String> decrypt(String payload) async {
    final data = _parsePayload(payload);

    // Future-proof: You can implement migration logic based on version
    final version = data['v'];
    if (version != _version) {
      throw UnsupportedError(
        'Unsupported payload version: $version (expected $_version)',
      );
    }

    final secretKey = await _getOrCreateKey();

    final secretBox = SecretBox(
      base64Decode(data['cipherText']!),
      nonce: base64Decode(data['nonce']!),
      mac: Mac(base64Decode(data['mac']!)),
    );

    try {
      final clearBytes = await _cipher.decrypt(secretBox, secretKey: secretKey);
      return utf8.decode(clearBytes);
    } catch (e) {
      throw StateError('Failed to decrypt payload: $e');
    }
  }

  /// Retrieves or generates a secure 256-bit key.
  Future<SecretKey> _getOrCreateKey() async {
    final stored = await _storageService.readEncryptionKey();

    if (stored != null && stored.isNotEmpty) {
      return SecretKey(base64Decode(stored));
    }

    final fetched = await _keyRemote?.fetchKey();
    if (fetched != null && fetched.isNotEmpty) {
      await _storageService.saveEncryptionKey(fetched);
      return SecretKey(base64Decode(fetched));
    }

    final newKey = await _cipher.newSecretKey();
    final keyBytes = await newKey.extractBytes();
    final encoded = base64Encode(keyBytes);

    await _storageService.saveEncryptionKey(encoded);
    try {
      await _keyRemote?.saveKey(encoded);
    } catch (e) {
      log('Remote key save failed: $e');
    }
    return newKey;
  }

  /// Parses, validates, and returns the payload values.
  Map<String, dynamic> _parsePayload(String raw) {
    try {
      final decoded = jsonDecode(raw);

      if (decoded is! Map<String, dynamic>) {
        throw const FormatException('Payload must be a JSON object');
      }

      final version = decoded['v'];
      final nonce = decoded['nonce'];
      final cipherText = decoded['cipherText'];
      final mac = decoded['mac'];

      if (version is! int) {
        throw const FormatException('Invalid or missing version');
      }
      if (nonce is! String || nonce.isEmpty) {
        throw const FormatException('Missing nonce');
      }
      if (cipherText is! String || cipherText.isEmpty) {
        throw const FormatException('Missing cipherText');
      }
      if (mac is! String || mac.isEmpty) {
        throw const FormatException('Missing mac');
      }

      return {
        'v': version,
        'nonce': nonce,
        'cipherText': cipherText,
        'mac': mac,
      };
    } catch (e) {
      throw FormatException('Invalid encrypted payload: $e');
    }
  }
}
