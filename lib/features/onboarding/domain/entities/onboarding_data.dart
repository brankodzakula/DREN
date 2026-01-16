import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_data.freezed.dart';
part 'onboarding_data.g.dart';

/// Represents the data collected during onboarding flow
/// This is converted to UserProfile once onboarding is complete
@freezed
class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    // Step 2: Birth date
    DateTime? dateOfBirth,

    // Step 3: Sex selection
    String? sex, // 'male' or 'female'

    // Step 4: Measurements
    double? heightCm,
    double? weightKg,

    // Step 5: Target weight
    double? targetWeightKg, // null = maintain current weight

    // Step 6: Activity level
    String? activityLevel, // sedentary, lightly_active, moderately_active, very_active, extra_active

    // Step 7: Goals
    @Default([]) List<String> goals,

    // Step 8: Wake time
    @TimeOfDayConverter() TimeOfDay? wakeTime,

    // Step 9: Ambition level
    String? longevityAmbition, // moderate, aggressive

    // Step 10: Health permissions granted
    @Default(false) bool healthPermissionsGranted,

    // Step 11: Disclaimer accepted
    @Default(false) bool disclaimerAccepted,

    // Additional data that can be set
    @Default('intermediate') String fitnessLevel, // beginner, intermediate, advanced
    @Default([]) List<String> dietaryRestrictions,
    @Default([]) List<String> medicalConditions,
    @Default([]) List<String> equipment,
    @Default(45) int preferredWorkoutMinutes,
  }) = _OnboardingData;

  factory OnboardingData.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDataFromJson(json);
}

/// JSON converter for TimeOfDay
class TimeOfDayConverter implements JsonConverter<TimeOfDay?, Map<String, dynamic>?> {
  const TimeOfDayConverter();

  @override
  TimeOfDay? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return TimeOfDay(
      hour: json['hour'] as int,
      minute: json['minute'] as int,
    );
  }

  @override
  Map<String, dynamic>? toJson(TimeOfDay? time) {
    if (time == null) return null;
    return {
      'hour': time.hour,
      'minute': time.minute,
    };
  }
}

/// Extension to check if onboarding data is complete
extension OnboardingDataValidation on OnboardingData {
  /// Returns true if all required fields for onboarding are filled
  bool get isComplete {
    return dateOfBirth != null &&
        sex != null &&
        heightCm != null &&
        weightKg != null &&
        activityLevel != null &&
        wakeTime != null &&
        longevityAmbition != null &&
        disclaimerAccepted;
  }

  /// Returns the current step index based on filled data (0-indexed)
  int get currentStep {
    if (dateOfBirth == null) return 1; // Step 2 (after welcome)
    if (sex == null) return 2; // Step 3
    if (heightCm == null || weightKg == null) return 3; // Step 4
    // Step 5 (target weight) can be skipped
    if (activityLevel == null) return 5; // Step 6
    // Step 7 (goals) can be skipped
    if (wakeTime == null) return 7; // Step 8
    if (longevityAmbition == null) return 8; // Step 9
    // Step 10 (health permissions) can be skipped
    if (!disclaimerAccepted) return 10; // Step 11
    return 11; // Complete
  }

  /// Calculate age from date of birth
  int? get age {
    if (dateOfBirth == null) return null;
    final now = DateTime.now();
    int age = now.year - dateOfBirth!.year;
    if (now.month < dateOfBirth!.month ||
        (now.month == dateOfBirth!.month && now.day < dateOfBirth!.day)) {
      age--;
    }
    return age;
  }
}

/// Activity level options
class ActivityLevel {
  static const sedentary = 'sedentary';
  static const lightlyActive = 'lightly_active';
  static const moderatelyActive = 'moderately_active';
  static const veryActive = 'very_active';
  static const extraActive = 'extra_active';

  static const List<String> values = [
    sedentary,
    lightlyActive,
    moderatelyActive,
    veryActive,
    extraActive,
  ];

  static String getDisplayName(String level) {
    switch (level) {
      case sedentary:
        return 'Sedentary';
      case lightlyActive:
        return 'Lightly Active';
      case moderatelyActive:
        return 'Moderately Active';
      case veryActive:
        return 'Very Active';
      case extraActive:
        return 'Extra Active';
      default:
        return level;
    }
  }

  static String getDescription(String level) {
    switch (level) {
      case sedentary:
        return 'Desk job, little/no exercise';
      case lightlyActive:
        return 'Light exercise 1-3 days/week';
      case moderatelyActive:
        return 'Moderate exercise 3-5 days/week';
      case veryActive:
        return 'Hard exercise 6-7 days/week';
      case extraActive:
        return 'Physical job + intense training';
      default:
        return '';
    }
  }

  static double getMultiplier(String level) {
    switch (level) {
      case sedentary:
        return 1.2;
      case lightlyActive:
        return 1.375;
      case moderatelyActive:
        return 1.55;
      case veryActive:
        return 1.725;
      case extraActive:
        return 1.9;
      default:
        return 1.2;
    }
  }
}

/// Longevity ambition options
class LongevityAmbition {
  static const moderate = 'moderate';
  static const aggressive = 'aggressive';

  static const List<String> values = [moderate, aggressive];

  static String getDisplayName(String ambition) {
    switch (ambition) {
      case moderate:
        return 'Moderate';
      case aggressive:
        return 'Aggressive';
      default:
        return ambition;
    }
  }

  static String getDescription(String ambition) {
    switch (ambition) {
      case moderate:
        return 'Balanced approach with sustainable changes';
      case aggressive:
        return 'Maximum optimization for longevity results';
      default:
        return '';
    }
  }
}

/// Sex options
class Sex {
  static const male = 'male';
  static const female = 'female';

  static const List<String> values = [male, female];
}

/// Goal options
class Goals {
  static const loseWeight = 'lose_weight';
  static const buildMuscle = 'build_muscle';
  static const improveSleep = 'improve_sleep';
  static const increaseEnergy = 'increase_energy';
  static const longevity = 'longevity';
  static const mentalClarity = 'mental_clarity';

  static const List<String> values = [
    loseWeight,
    buildMuscle,
    improveSleep,
    increaseEnergy,
    longevity,
    mentalClarity,
  ];

  static String getDisplayName(String goal) {
    switch (goal) {
      case loseWeight:
        return 'Lose Weight';
      case buildMuscle:
        return 'Build Muscle';
      case improveSleep:
        return 'Improve Sleep';
      case increaseEnergy:
        return 'Increase Energy';
      case longevity:
        return 'Longevity';
      case mentalClarity:
        return 'Mental Clarity';
      default:
        return goal;
    }
  }
}
