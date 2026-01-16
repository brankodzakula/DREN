import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Service for securely storing sensitive data
/// Uses platform-specific secure storage (Keychain on iOS, EncryptedSharedPreferences on Android)
@singleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService()
      : _storage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
          iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device,
          ),
        );

  // Keys for stored data
  static const String _keyOnboardingComplete = 'onboarding_complete';
  static const String _keyDatabaseKey = 'database_encryption_key';
  static const String _keyHealthPermissionsGranted = 'health_permissions_granted';
  static const String _keyLastSyncTime = 'last_sync_time';

  /// Check if onboarding is complete
  Future<bool> isOnboardingComplete() async {
    final value = await _storage.read(key: _keyOnboardingComplete);
    return value == 'true';
  }

  /// Set onboarding complete status
  Future<void> setOnboardingComplete(bool complete) async {
    await _storage.write(
      key: _keyOnboardingComplete,
      value: complete.toString(),
    );
  }

  /// Get or generate database encryption key
  Future<String> getDatabaseEncryptionKey() async {
    var key = await _storage.read(key: _keyDatabaseKey);
    if (key == null) {
      // Generate a new key - in production, use a proper key generation method
      key = DateTime.now().millisecondsSinceEpoch.toRadixString(36) +
          DateTime.now().microsecondsSinceEpoch.toRadixString(36);
      await _storage.write(key: _keyDatabaseKey, value: key);
    }
    return key;
  }

  /// Check if health permissions have been granted
  Future<bool> areHealthPermissionsGranted() async {
    final value = await _storage.read(key: _keyHealthPermissionsGranted);
    return value == 'true';
  }

  /// Set health permissions granted status
  Future<void> setHealthPermissionsGranted(bool granted) async {
    await _storage.write(
      key: _keyHealthPermissionsGranted,
      value: granted.toString(),
    );
  }

  /// Get last sync time for health data
  Future<DateTime?> getLastSyncTime() async {
    final value = await _storage.read(key: _keyLastSyncTime);
    if (value == null) return null;
    return DateTime.tryParse(value);
  }

  /// Set last sync time
  Future<void> setLastSyncTime(DateTime time) async {
    await _storage.write(
      key: _keyLastSyncTime,
      value: time.toIso8601String(),
    );
  }

  /// Store a custom secure value
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read a custom secure value
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete a secure value
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Clear all secure storage (for logout/reset)
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
