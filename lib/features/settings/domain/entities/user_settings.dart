import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';

/// User settings entity combining profile and app settings
@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    required String id,
    required DateTime dateOfBirth,
    required String sex,
    required double heightCm,
    required double weightKg,
    double? targetWeightKg,
    required String activityLevel,
    required String longevityAmbition,
    required String fitnessLevel,
    required TimeOfDay wakeTime,
    required bool healthPermissionsGranted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserSettings;

  const UserSettings._();

  /// Calculate age from date of birth
  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  /// Get formatted height in feet and inches
  String get heightFormatted {
    final inches = heightCm / 2.54;
    final feet = (inches / 12).floor();
    final remainingInches = (inches % 12).round();
    return '$feet\'$remainingInches"';
  }

  /// Get formatted weight in lbs
  String get weightFormatted {
    final lbs = weightKg * 2.205;
    return '${lbs.round()} lbs';
  }

  /// Get activity level display name
  String get activityLevelDisplay {
    switch (activityLevel) {
      case 'sedentary':
        return 'Sedentary';
      case 'lightly_active':
        return 'Lightly Active';
      case 'moderately_active':
        return 'Moderately Active';
      case 'very_active':
        return 'Very Active';
      case 'extremely_active':
        return 'Extremely Active';
      default:
        return activityLevel;
    }
  }

  /// Get longevity ambition display name
  String get ambitionDisplay {
    switch (longevityAmbition) {
      case 'moderate':
        return 'Moderate';
      case 'aggressive':
        return 'Aggressive';
      default:
        return longevityAmbition;
    }
  }
}

/// Health platform connection status
@freezed
class HealthConnectionStatus with _$HealthConnectionStatus {
  const factory HealthConnectionStatus({
    required bool isConnected,
    required bool hasPermissions,
    required String platformName,
    DateTime? lastSyncTime,
    String? errorMessage,
  }) = _HealthConnectionStatus;

  const HealthConnectionStatus._();

  /// Get connection status text
  String get statusText {
    if (!isConnected) return 'Not Connected';
    if (!hasPermissions) return 'Permissions Required';
    return 'Connected';
  }

  /// Get last sync formatted
  String? get lastSyncFormatted {
    if (lastSyncTime == null) return null;
    final now = DateTime.now();
    final diff = now.difference(lastSyncTime!);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

/// Notification preferences
@freezed
class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    @Default(true) bool mealReminders,
    @Default(true) bool workoutReminders,
    @Default(true) bool bedtimeReminders,
    @Default(true) bool supplementReminders,
    @Default(true) bool progressUpdates,
  }) = _NotificationPreferences;
}
