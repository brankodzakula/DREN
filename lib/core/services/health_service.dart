import 'dart:io';
import 'dart:math';

import 'package:health/health.dart';
import 'package:injectable/injectable.dart';

/// Result wrapper for health operations
class HealthResult<T> {
  final T? data;
  final HealthError? error;

  const HealthResult.success(this.data) : error = null;
  const HealthResult.failure(this.error) : data = null;

  bool get isSuccess => data != null && error == null;
  bool get isFailure => error != null;
}

/// Error types for health operations
enum HealthError {
  notAvailable,
  permissionDenied,
  noData,
  syncFailed,
  unknown,
}

/// Aggregated sleep data from health platform
class HealthSleepData {
  final DateTime? bedTime;
  final DateTime? wakeTime;
  final int deepSleepMinutes;
  final int lightSleepMinutes;
  final int remSleepMinutes;
  final int awakeMinutes;

  const HealthSleepData({
    this.bedTime,
    this.wakeTime,
    this.deepSleepMinutes = 0,
    this.lightSleepMinutes = 0,
    this.remSleepMinutes = 0,
    this.awakeMinutes = 0,
  });

  int get totalSleepMinutes =>
      deepSleepMinutes + lightSleepMinutes + remSleepMinutes;

  int get totalMinutes => totalSleepMinutes + awakeMinutes;
}

/// Workout data from health platform
class HealthWorkoutData {
  final String id;
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final int durationMinutes;
  final int caloriesBurned;
  final String category;

  const HealthWorkoutData({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.durationMinutes,
    required this.caloriesBurned,
    required this.category,
  });
}

/// Daily health summary
class HealthDailySummary {
  final int steps;
  final int activeCalories;
  final int basalCalories;
  final int? restingHeartRate;
  final double? hrv;

  const HealthDailySummary({
    this.steps = 0,
    this.activeCalories = 0,
    this.basalCalories = 0,
    this.restingHeartRate,
    this.hrv,
  });

  int get totalCaloriesBurned => activeCalories + basalCalories;
}

/// Service for interacting with health platforms (HealthKit / Health Connect)
@lazySingleton
class HealthService {
  final Health _health = Health();

  /// Data types to read from health platform
  static const _readTypes = [
    HealthDataType.HEART_RATE,
    HealthDataType.RESTING_HEART_RATE,
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_REM,
    HealthDataType.WORKOUT,
    HealthDataType.HEART_RATE_VARIABILITY_SDNN,
  ];

  /// Data types to write to health platform
  static const _writeTypes = [
    HealthDataType.WORKOUT,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.DIETARY_ENERGY_CONSUMED,
    HealthDataType.DIETARY_PROTEIN_CONSUMED,
    HealthDataType.DIETARY_CARBS_CONSUMED,
    HealthDataType.DIETARY_FATS_CONSUMED,
  ];

  /// Check if health platform is available
  Future<bool> isAvailable() async {
    try {
      if (Platform.isAndroid) {
        return await Health().isHealthConnectAvailable();
      }
      // iOS always has HealthKit available
      return Platform.isIOS;
    } catch (e) {
      return false;
    }
  }

  /// Request all required permissions
  /// Returns true if all permissions were granted
  Future<HealthResult<bool>> requestPermissions() async {
    try {
      final available = await isAvailable();
      if (!available) {
        return const HealthResult.failure(HealthError.notAvailable);
      }

      // Configure health package
      await _health.configure();

      // Build permissions list
      final types = <HealthDataType>[];
      final permissions = <HealthDataAccess>[];

      for (final type in _readTypes) {
        types.add(type);
        permissions.add(HealthDataAccess.READ);
      }

      for (final type in _writeTypes) {
        if (!types.contains(type)) {
          types.add(type);
          permissions.add(HealthDataAccess.READ_WRITE);
        }
      }

      final granted = await _health.requestAuthorization(
        types,
        permissions: permissions,
      );

      if (granted) {
        return const HealthResult.success(true);
      } else {
        return const HealthResult.failure(HealthError.permissionDenied);
      }
    } catch (e) {
      return const HealthResult.failure(HealthError.unknown);
    }
  }

  /// Check if we have necessary permissions
  Future<bool> hasPermissions() async {
    try {
      final available = await isAvailable();
      if (!available) return false;

      // Try to read a small amount of data to verify permissions
      final now = DateTime.now();
      final yesterday = now.subtract(const Duration(days: 1));

      final hasStepsPermission = await _health.hasPermissions(
        [HealthDataType.STEPS],
        permissions: [HealthDataAccess.READ],
      );

      return hasStepsPermission ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Get today's health summary (steps, calories, heart rate)
  Future<HealthResult<HealthDailySummary>> getTodaysSummary() async {
    try {
      final now = DateTime.now();
      final midnight = DateTime(now.year, now.month, now.day);

      int steps = 0;
      int activeCalories = 0;
      int basalCalories = 0;
      int? restingHeartRate;
      double? hrv;

      // Fetch steps
      final stepsData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.STEPS],
        startTime: midnight,
        endTime: now,
      );
      for (final point in stepsData) {
        if (point.value is NumericHealthValue) {
          steps += (point.value as NumericHealthValue).numericValue.toInt();
        }
      }

      // Fetch active calories
      final activeCalData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: midnight,
        endTime: now,
      );
      for (final point in activeCalData) {
        if (point.value is NumericHealthValue) {
          activeCalories +=
              (point.value as NumericHealthValue).numericValue.toInt();
        }
      }

      // Fetch basal calories
      final basalCalData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.BASAL_ENERGY_BURNED],
        startTime: midnight,
        endTime: now,
      );
      for (final point in basalCalData) {
        if (point.value is NumericHealthValue) {
          basalCalories +=
              (point.value as NumericHealthValue).numericValue.toInt();
        }
      }

      // Fetch resting heart rate (latest value)
      final hrData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.RESTING_HEART_RATE],
        startTime: midnight,
        endTime: now,
      );
      if (hrData.isNotEmpty) {
        final latest = hrData.last;
        if (latest.value is NumericHealthValue) {
          restingHeartRate =
              (latest.value as NumericHealthValue).numericValue.toInt();
        }
      }

      // Fetch HRV (latest value)
      final hrvData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.HEART_RATE_VARIABILITY_SDNN],
        startTime: midnight,
        endTime: now,
      );
      if (hrvData.isNotEmpty) {
        final latest = hrvData.last;
        if (latest.value is NumericHealthValue) {
          hrv = (latest.value as NumericHealthValue).numericValue.toDouble();
        }
      }

      return HealthResult.success(HealthDailySummary(
        steps: steps,
        activeCalories: activeCalories,
        basalCalories: basalCalories,
        restingHeartRate: restingHeartRate,
        hrv: hrv,
      ));
    } catch (e) {
      return const HealthResult.failure(HealthError.unknown);
    }
  }

  /// Get last night's sleep data
  Future<HealthResult<HealthSleepData>> getLastNightSleep() async {
    try {
      final now = DateTime.now();
      final yesterday = now.subtract(const Duration(days: 1));

      // Sleep window: 6 PM yesterday to 12 PM today
      final sleepStart =
          DateTime(yesterday.year, yesterday.month, yesterday.day, 18, 0);
      final sleepEnd = DateTime(now.year, now.month, now.day, 12, 0);

      final sleepData = await _health.getHealthDataFromTypes(
        types: [
          HealthDataType.SLEEP_ASLEEP,
          HealthDataType.SLEEP_AWAKE,
          HealthDataType.SLEEP_DEEP,
          HealthDataType.SLEEP_LIGHT,
          HealthDataType.SLEEP_REM,
        ],
        startTime: sleepStart,
        endTime: sleepEnd,
      );

      if (sleepData.isEmpty) {
        return const HealthResult.failure(HealthError.noData);
      }

      // Aggregate sleep data
      int deepMinutes = 0;
      int lightMinutes = 0;
      int remMinutes = 0;
      int awakeMinutes = 0;
      DateTime? bedTime;
      DateTime? wakeTime;

      for (final point in sleepData) {
        final duration = point.dateTo.difference(point.dateFrom).inMinutes;

        // Track earliest and latest times
        if (bedTime == null || point.dateFrom.isBefore(bedTime)) {
          bedTime = point.dateFrom;
        }
        if (wakeTime == null || point.dateTo.isAfter(wakeTime)) {
          wakeTime = point.dateTo;
        }

        switch (point.type) {
          case HealthDataType.SLEEP_DEEP:
            deepMinutes += duration;
            break;
          case HealthDataType.SLEEP_LIGHT:
          case HealthDataType.SLEEP_ASLEEP:
            lightMinutes += duration;
            break;
          case HealthDataType.SLEEP_REM:
            remMinutes += duration;
            break;
          case HealthDataType.SLEEP_AWAKE:
            awakeMinutes += duration;
            break;
          default:
            break;
        }
      }

      return HealthResult.success(HealthSleepData(
        bedTime: bedTime,
        wakeTime: wakeTime,
        deepSleepMinutes: deepMinutes,
        lightSleepMinutes: lightMinutes,
        remSleepMinutes: remMinutes,
        awakeMinutes: awakeMinutes,
      ));
    } catch (e) {
      return const HealthResult.failure(HealthError.unknown);
    }
  }

  /// Get external workouts for a given date
  Future<HealthResult<List<HealthWorkoutData>>> getWorkoutsForDate(
    DateTime date,
  ) async {
    try {
      final start = DateTime(date.year, date.month, date.day);
      final end = start.add(const Duration(days: 1));

      final workoutData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.WORKOUT],
        startTime: start,
        endTime: end,
      );

      final workouts = <HealthWorkoutData>[];

      for (final point in workoutData) {
        if (point.value is WorkoutHealthValue) {
          final workout = point.value as WorkoutHealthValue;
          final duration = point.dateTo.difference(point.dateFrom).inMinutes;

          workouts.add(HealthWorkoutData(
            id: '${point.dateFrom.millisecondsSinceEpoch}',
            name: _workoutTypeName(workout.workoutActivityType),
            startTime: point.dateFrom,
            endTime: point.dateTo,
            durationMinutes: duration,
            caloriesBurned: workout.totalEnergyBurned?.toInt() ?? 0,
            category: _workoutCategory(workout.workoutActivityType),
          ));
        }
      }

      return HealthResult.success(workouts);
    } catch (e) {
      return const HealthResult.failure(HealthError.unknown);
    }
  }

  /// Save a completed workout to health platform
  Future<HealthResult<bool>> saveWorkout({
    required DateTime startTime,
    required DateTime endTime,
    required int caloriesBurned,
    required String category,
  }) async {
    try {
      final activityType = _categoryToWorkoutType(category);

      final success = await _health.writeWorkoutData(
        activityType: activityType,
        start: startTime,
        end: endTime,
        totalEnergyBurned: caloriesBurned,
        totalEnergyBurnedUnit: HealthDataUnit.KILOCALORIE,
      );

      if (success) {
        return const HealthResult.success(true);
      } else {
        return const HealthResult.failure(HealthError.syncFailed);
      }
    } catch (e) {
      return const HealthResult.failure(HealthError.unknown);
    }
  }

  /// Save a meal to health platform
  Future<HealthResult<bool>> saveMeal({
    required DateTime timestamp,
    required int calories,
    required double proteinGrams,
    required double carbsGrams,
    required double fatGrams,
  }) async {
    try {
      // Save calories
      var success = await _health.writeHealthData(
        value: calories.toDouble(),
        type: HealthDataType.DIETARY_ENERGY_CONSUMED,
        startTime: timestamp,
        endTime: timestamp,
        unit: HealthDataUnit.KILOCALORIE,
      );

      if (!success) {
        return const HealthResult.failure(HealthError.syncFailed);
      }

      // Save protein
      await _health.writeHealthData(
        value: proteinGrams,
        type: HealthDataType.DIETARY_PROTEIN_CONSUMED,
        startTime: timestamp,
        endTime: timestamp,
        unit: HealthDataUnit.GRAM,
      );

      // Save carbs
      await _health.writeHealthData(
        value: carbsGrams,
        type: HealthDataType.DIETARY_CARBS_CONSUMED,
        startTime: timestamp,
        endTime: timestamp,
        unit: HealthDataUnit.GRAM,
      );

      // Save fat
      await _health.writeHealthData(
        value: fatGrams,
        type: HealthDataType.DIETARY_FATS_CONSUMED,
        startTime: timestamp,
        endTime: timestamp,
        unit: HealthDataUnit.GRAM,
      );

      return const HealthResult.success(true);
    } catch (e) {
      return const HealthResult.failure(HealthError.unknown);
    }
  }

  /// Check if a workout might be a duplicate of an existing one
  bool isDuplicateWorkout(
    HealthWorkoutData external,
    DateTime localStart,
    DateTime localEnd,
  ) {
    // Check if times overlap significantly
    final overlapStart = external.startTime.isAfter(localStart)
        ? external.startTime
        : localStart;
    final overlapEnd =
        external.endTime.isBefore(localEnd) ? external.endTime : localEnd;
    final overlapMinutes = overlapEnd.difference(overlapStart).inMinutes;

    if (overlapMinutes <= 0) return false;

    final externalDuration = external.durationMinutes;
    final localDuration = localEnd.difference(localStart).inMinutes;

    // If >50% overlap, consider duplicate
    return overlapMinutes > (min(externalDuration, localDuration) * 0.5);
  }

  String _workoutTypeName(HealthWorkoutActivityType type) {
    switch (type) {
      case HealthWorkoutActivityType.RUNNING:
        return 'Running';
      case HealthWorkoutActivityType.WALKING:
        return 'Walking';
      case HealthWorkoutActivityType.BIKING:
        return 'Cycling';
      case HealthWorkoutActivityType.SWIMMING:
        return 'Swimming';
      case HealthWorkoutActivityType.YOGA:
        return 'Yoga';
      case HealthWorkoutActivityType.STRENGTH_TRAINING:
        return 'Strength Training';
      case HealthWorkoutActivityType.HIGH_INTENSITY_INTERVAL_TRAINING:
        return 'HIIT';
      case HealthWorkoutActivityType.FUNCTIONAL_STRENGTH_TRAINING:
        return 'Functional Training';
      case HealthWorkoutActivityType.CORE_TRAINING:
        return 'Core Training';
      case HealthWorkoutActivityType.FLEXIBILITY:
        return 'Flexibility';
      case HealthWorkoutActivityType.PILATES:
        return 'Pilates';
      case HealthWorkoutActivityType.ELLIPTICAL:
        return 'Elliptical';
      case HealthWorkoutActivityType.ROWING:
        return 'Rowing';
      case HealthWorkoutActivityType.STAIR_CLIMBING:
        return 'Stair Climbing';
      default:
        return 'Workout';
    }
  }

  String _workoutCategory(HealthWorkoutActivityType type) {
    switch (type) {
      case HealthWorkoutActivityType.RUNNING:
      case HealthWorkoutActivityType.WALKING:
      case HealthWorkoutActivityType.BIKING:
      case HealthWorkoutActivityType.SWIMMING:
      case HealthWorkoutActivityType.ELLIPTICAL:
      case HealthWorkoutActivityType.ROWING:
      case HealthWorkoutActivityType.STAIR_CLIMBING:
        return 'cardio';
      case HealthWorkoutActivityType.STRENGTH_TRAINING:
      case HealthWorkoutActivityType.FUNCTIONAL_STRENGTH_TRAINING:
      case HealthWorkoutActivityType.CORE_TRAINING:
        return 'strength';
      case HealthWorkoutActivityType.HIGH_INTENSITY_INTERVAL_TRAINING:
        return 'hiit';
      case HealthWorkoutActivityType.YOGA:
      case HealthWorkoutActivityType.FLEXIBILITY:
      case HealthWorkoutActivityType.PILATES:
        return 'flexibility';
      default:
        return 'other';
    }
  }

  HealthWorkoutActivityType _categoryToWorkoutType(String category) {
    switch (category.toLowerCase()) {
      case 'running':
        return HealthWorkoutActivityType.RUNNING;
      case 'walking':
        return HealthWorkoutActivityType.WALKING;
      case 'cycling':
        return HealthWorkoutActivityType.BIKING;
      case 'swimming':
        return HealthWorkoutActivityType.SWIMMING;
      case 'yoga':
        return HealthWorkoutActivityType.YOGA;
      case 'strength':
      case 'strength_training':
      case 'upper_body':
      case 'lower_body':
      case 'full_body':
        return HealthWorkoutActivityType.STRENGTH_TRAINING;
      case 'hiit':
        return HealthWorkoutActivityType.HIGH_INTENSITY_INTERVAL_TRAINING;
      case 'core':
        return HealthWorkoutActivityType.CORE_TRAINING;
      case 'flexibility':
        return HealthWorkoutActivityType.FLEXIBILITY;
      case 'pilates':
        return HealthWorkoutActivityType.PILATES;
      case 'cardio':
        return HealthWorkoutActivityType.ELLIPTICAL;
      default:
        return HealthWorkoutActivityType.OTHER;
    }
  }
}
