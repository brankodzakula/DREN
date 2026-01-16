import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/database/app_database.dart';
import '../../domain/entities/onboarding_data.dart';

/// Data Transfer Object for mapping OnboardingData to/from database
class OnboardingDataModel {
  /// Converts OnboardingData domain entity to UserProfilesCompanion for database insert
  static UserProfilesCompanion toCompanion(
    OnboardingData data, {
    required String id,
  }) {
    return UserProfilesCompanion(
      id: Value(id),
      dateOfBirth: Value(data.dateOfBirth!),
      sex: Value(data.sex!),
      heightCm: Value(data.heightCm!),
      weightKg: Value(data.weightKg!),
      targetWeightKg: Value(data.targetWeightKg),
      activityLevel: Value(data.activityLevel!),
      longevityAmbition: Value(data.longevityAmbition!),
      fitnessLevel: Value(data.fitnessLevel),
      dietaryRestrictions: Value(jsonEncode(data.dietaryRestrictions)),
      medicalConditions: Value(jsonEncode(data.medicalConditions)),
      equipment: Value(jsonEncode(data.equipment)),
      preferredWorkoutMinutes: Value(data.preferredWorkoutMinutes),
      wakeTime: Value(_timeOfDayToString(data.wakeTime!)),
      healthDisclaimerAccepted: Value(data.disclaimerAccepted),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );
  }

  /// Converts UserProfile database row to OnboardingData domain entity
  static OnboardingData fromUserProfile(UserProfile profile) {
    return OnboardingData(
      dateOfBirth: profile.dateOfBirth,
      sex: profile.sex,
      heightCm: profile.heightCm,
      weightKg: profile.weightKg,
      targetWeightKg: profile.targetWeightKg,
      activityLevel: profile.activityLevel,
      longevityAmbition: profile.longevityAmbition,
      fitnessLevel: profile.fitnessLevel,
      dietaryRestrictions: _decodeJsonList(profile.dietaryRestrictions),
      medicalConditions: _decodeJsonList(profile.medicalConditions),
      equipment: _decodeJsonList(profile.equipment),
      preferredWorkoutMinutes: profile.preferredWorkoutMinutes,
      wakeTime: _stringToTimeOfDay(profile.wakeTime),
      disclaimerAccepted: profile.healthDisclaimerAccepted,
      healthPermissionsGranted: true, // Assumed if profile exists
    );
  }

  /// Converts TimeOfDay to string format "HH:mm"
  static String _timeOfDayToString(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Converts string "HH:mm" to TimeOfDay
  static TimeOfDay _stringToTimeOfDay(String timeString) {
    final parts = timeString.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  /// Safely decodes JSON array string to List<String>
  static List<String> _decodeJsonList(String jsonString) {
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is List) {
        return decoded.cast<String>();
      }
      return [];
    } catch (_) {
      return [];
    }
  }
}

/// Extension to help with partial onboarding data storage
/// Uses SharedPreferences or a temp table for in-progress onboarding
class OnboardingProgressModel {
  static const String _prefsKey = 'onboarding_progress';

  /// Converts OnboardingData to JSON map for temporary storage
  static Map<String, dynamic> toJson(OnboardingData data) {
    return {
      'dateOfBirth': data.dateOfBirth?.toIso8601String(),
      'sex': data.sex,
      'heightCm': data.heightCm,
      'weightKg': data.weightKg,
      'targetWeightKg': data.targetWeightKg,
      'activityLevel': data.activityLevel,
      'goals': data.goals,
      'wakeTime': data.wakeTime != null
          ? {'hour': data.wakeTime!.hour, 'minute': data.wakeTime!.minute}
          : null,
      'longevityAmbition': data.longevityAmbition,
      'healthPermissionsGranted': data.healthPermissionsGranted,
      'disclaimerAccepted': data.disclaimerAccepted,
      'fitnessLevel': data.fitnessLevel,
      'dietaryRestrictions': data.dietaryRestrictions,
      'medicalConditions': data.medicalConditions,
      'equipment': data.equipment,
      'preferredWorkoutMinutes': data.preferredWorkoutMinutes,
    };
  }

  /// Converts JSON map to OnboardingData
  static OnboardingData fromJson(Map<String, dynamic> json) {
    return OnboardingData(
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'] as String)
          : null,
      sex: json['sex'] as String?,
      heightCm: (json['heightCm'] as num?)?.toDouble(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      targetWeightKg: (json['targetWeightKg'] as num?)?.toDouble(),
      activityLevel: json['activityLevel'] as String?,
      goals: (json['goals'] as List<dynamic>?)?.cast<String>() ?? [],
      wakeTime: json['wakeTime'] != null
          ? TimeOfDay(
              hour: json['wakeTime']['hour'] as int,
              minute: json['wakeTime']['minute'] as int,
            )
          : null,
      longevityAmbition: json['longevityAmbition'] as String?,
      healthPermissionsGranted: json['healthPermissionsGranted'] as bool? ?? false,
      disclaimerAccepted: json['disclaimerAccepted'] as bool? ?? false,
      fitnessLevel: json['fitnessLevel'] as String? ?? 'intermediate',
      dietaryRestrictions:
          (json['dietaryRestrictions'] as List<dynamic>?)?.cast<String>() ?? [],
      medicalConditions:
          (json['medicalConditions'] as List<dynamic>?)?.cast<String>() ?? [],
      equipment: (json['equipment'] as List<dynamic>?)?.cast<String>() ?? [],
      preferredWorkoutMinutes: json['preferredWorkoutMinutes'] as int? ?? 45,
    );
  }

  /// Key for storing progress in secure storage
  static String get storageKey => _prefsKey;
}
