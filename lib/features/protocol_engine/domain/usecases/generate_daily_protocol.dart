import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/calculators/bmr_calculator.dart';
import '../../../../core/utils/calculators/macro_calculator.dart';
import '../../../../core/utils/calculators/tdee_calculator.dart';
import '../../../onboarding/domain/entities/onboarding_data.dart';
import '../entities/daily_protocol.dart';
import 'generate_sleep_schedule.dart';

/// Input parameters for generating a daily protocol
class GenerateProtocolParams {
  final double weightKg;
  final double heightCm;
  final int ageYears;
  final String sex;
  final String activityLevel;
  final String ambitionLevel;
  final String fitnessLevel;
  final TimeOfDay wakeTime;
  final DateTime date;

  const GenerateProtocolParams({
    required this.weightKg,
    required this.heightCm,
    required this.ageYears,
    required this.sex,
    required this.activityLevel,
    required this.ambitionLevel,
    required this.fitnessLevel,
    required this.wakeTime,
    required this.date,
  });

  /// Create from OnboardingData
  factory GenerateProtocolParams.fromOnboardingData(
    OnboardingData data, {
    DateTime? date,
  }) {
    final age = data.age;
    if (age == null) {
      throw ArgumentError('Date of birth is required');
    }
    if (data.weightKg == null) {
      throw ArgumentError('Weight is required');
    }
    if (data.heightCm == null) {
      throw ArgumentError('Height is required');
    }
    if (data.sex == null) {
      throw ArgumentError('Sex is required');
    }
    if (data.activityLevel == null) {
      throw ArgumentError('Activity level is required');
    }
    if (data.longevityAmbition == null) {
      throw ArgumentError('Ambition level is required');
    }
    if (data.wakeTime == null) {
      throw ArgumentError('Wake time is required');
    }

    return GenerateProtocolParams(
      weightKg: data.weightKg!,
      heightCm: data.heightCm!,
      ageYears: age,
      sex: data.sex!,
      activityLevel: data.activityLevel!,
      ambitionLevel: data.longevityAmbition!,
      fitnessLevel: data.fitnessLevel,
      wakeTime: data.wakeTime!,
      date: date ?? DateTime.now(),
    );
  }
}

/// Use case for generating a complete daily protocol
@injectable
class GenerateDailyProtocol {
  final GenerateSleepSchedule _generateSleepSchedule;

  GenerateDailyProtocol(this._generateSleepSchedule);

  /// Generate a complete daily protocol based on user parameters
  DailyProtocol call(GenerateProtocolParams params) {
    // Step 1: Calculate BMR
    final bmr = BmrCalculator.calculate(
      weightKg: params.weightKg,
      heightCm: params.heightCm,
      ageYears: params.ageYears,
      sex: params.sex,
    );

    // Step 2: Calculate TDEE
    final tdee = TdeeCalculator.calculate(
      bmr: bmr,
      activityLevel: params.activityLevel,
    );

    // Step 3: Apply longevity deficit for target calories
    final targetCalories = TdeeCalculator.calculateTargetCalories(
      tdee: tdee,
      ambition: params.ambitionLevel,
    );

    // Step 4: Calculate macro targets
    final macros = MacroCalculator.calculate(
      targetCalories: targetCalories,
      weightKg: params.weightKg,
    );

    // Step 5: Generate sleep schedule
    final sleepSchedule = _generateSleepSchedule(params.wakeTime);

    // Step 6: Determine exercise targets
    final exerciseMinutes = _getExerciseMinutes(
      params.fitnessLevel,
      params.ambitionLevel,
    );
    final workoutType = _getWorkoutTypeForDay(
      params.date,
      params.fitnessLevel,
    );
    final estimatedCaloriesBurn = _estimateCaloriesBurn(
      workoutType,
      exerciseMinutes,
      params.weightKg,
    );

    // Step 7: Calculate eating window (16:8 intermittent fasting)
    final eatingWindowStart = params.wakeTime;
    final eatingWindowEnd = TimeOfDay(
      hour: (params.wakeTime.hour + 8) % 24,
      minute: params.wakeTime.minute,
    );

    return DailyProtocol(
      date: params.date,
      targetCalories: targetCalories,
      proteinGrams: macros.protein,
      carbsGrams: macros.carbs,
      fatGrams: macros.fat,
      exerciseMinutes: exerciseMinutes,
      workoutType: workoutType,
      estimatedCaloriesBurn: estimatedCaloriesBurn,
      targetBedtime: sleepSchedule.targetBedtime,
      targetWakeTime: sleepSchedule.targetWakeTime,
      windDownStart: sleepSchedule.windDownStart,
      eatingWindowStart: eatingWindowStart,
      eatingWindowEnd: eatingWindowEnd,
      ambitionLevel: params.ambitionLevel,
      fitnessLevel: params.fitnessLevel,
    );
  }

  /// Get exercise duration target based on fitness level and ambition
  int _getExerciseMinutes(String fitnessLevel, String ambition) {
    final targets = {
      'beginner': {
        LongevityAmbition.moderate: 30,
        LongevityAmbition.aggressive: 45,
      },
      'intermediate': {
        LongevityAmbition.moderate: 45,
        LongevityAmbition.aggressive: 60,
      },
      'advanced': {
        LongevityAmbition.moderate: 60,
        LongevityAmbition.aggressive: 90,
      },
    };

    return targets[fitnessLevel]?[ambition] ?? 45;
  }

  /// Get workout type for the day based on weekly schedule
  String _getWorkoutTypeForDay(DateTime date, String fitnessLevel) {
    final weekday = date.weekday; // 1 = Monday, 7 = Sunday

    if (fitnessLevel == 'beginner') {
      switch (weekday) {
        case 1:
          return 'full_body_strength';
        case 3:
          return 'zone2_cardio';
        case 5:
          return 'yoga';
        default:
          return 'rest';
      }
    }

    if (fitnessLevel == 'intermediate') {
      switch (weekday) {
        case 1:
          return 'upper_strength';
        case 2:
          return 'zone2_cardio';
        case 3:
          return 'lower_strength';
        case 4:
          return 'yoga';
        case 5:
          return 'hiit';
        case 6:
          return 'zone2_cardio';
        default:
          return 'rest';
      }
    }

    // Advanced / Blueprint-aligned
    switch (weekday) {
      case 1:
        return 'push';
      case 2:
        return 'hiit';
      case 3:
        return 'pull';
      case 4:
        return 'zone2_cardio';
      case 5:
        return 'legs';
      case 6:
        return 'hiit';
      case 7:
        return 'yoga';
      default:
        return 'rest';
    }
  }

  /// Estimate calories burned for a workout
  int _estimateCaloriesBurn(String workoutType, int minutes, double weightKg) {
    // MET values (Metabolic Equivalent of Task)
    final metValues = {
      'strength': 5.0,
      'full_body_strength': 5.0,
      'upper_strength': 5.0,
      'lower_strength': 5.0,
      'push': 5.0,
      'pull': 5.0,
      'legs': 5.0,
      'hiit': 8.0,
      'running': 7.0,
      'yoga': 3.0,
      'core': 4.0,
      'cycling': 6.0,
      'swimming': 6.0,
      'zone2_cardio': 5.0,
      'rest': 1.0,
    };

    final met = metValues[workoutType] ?? 5.0;
    // Calories = MET × weight(kg) × duration(hours)
    return (met * weightKg * (minutes / 60)).round();
  }
}
