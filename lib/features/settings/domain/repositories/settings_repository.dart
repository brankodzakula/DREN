import 'package:flutter/material.dart';

import '../entities/user_settings.dart';

/// Repository interface for settings-related operations
abstract class SettingsRepository {
  /// Get current user settings
  Future<UserSettings?> getUserSettings();

  /// Update user profile
  Future<void> updateProfile({
    double? weightKg,
    double? targetWeightKg,
    double? heightCm,
    String? activityLevel,
    String? fitnessLevel,
    TimeOfDay? wakeTime,
  });

  /// Update longevity ambition (protocol intensity)
  Future<void> updateAmbition(String ambition);

  /// Get notification preferences
  Future<NotificationPreferences> getNotificationPreferences();

  /// Update notification preferences
  Future<void> updateNotificationPreferences(NotificationPreferences prefs);

  /// Clear all user data (factory reset)
  Future<void> clearAllData();

  /// Export user data as JSON
  Future<Map<String, dynamic>> exportUserData();
}
