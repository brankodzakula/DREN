import 'package:injectable/injectable.dart';

import '../../features/exercise/domain/entities/entities.dart';
import '../../features/sleep/domain/entities/sleep_session.dart';
import '../../features/today/domain/entities/daily_progress.dart';
import 'health_service.dart';

/// Result of a health sync operation
class HealthSyncResult {
  final bool success;
  final String? errorMessage;
  final HealthSyncData? data;

  const HealthSyncResult.success(this.data)
      : success = true,
        errorMessage = null;
  const HealthSyncResult.failure(this.errorMessage)
      : success = false,
        data = null;
}

/// Aggregated health data from sync
class HealthSyncData {
  final int steps;
  final int activeCaloriesBurned;
  final int totalCaloriesBurned;
  final int? restingHeartRate;
  final double? hrv;
  final HealthSleepData? sleepData;
  final List<HealthWorkoutData> externalWorkouts;

  const HealthSyncData({
    this.steps = 0,
    this.activeCaloriesBurned = 0,
    this.totalCaloriesBurned = 0,
    this.restingHeartRate,
    this.hrv,
    this.sleepData,
    this.externalWorkouts = const [],
  });
}

/// Service for coordinating health data sync across the app
@lazySingleton
class HealthSyncService {
  final HealthService _healthService;

  HealthSyncService(this._healthService);

  /// Check if health platform is available and we have permissions
  Future<bool> isHealthAvailable() async {
    return await _healthService.isAvailable();
  }

  /// Request health permissions
  Future<bool> requestPermissions() async {
    final result = await _healthService.requestPermissions();
    return result.isSuccess;
  }

  /// Check if we have health permissions
  Future<bool> hasPermissions() async {
    return await _healthService.hasPermissions();
  }

  /// Perform a full health sync - returns all available health data
  Future<HealthSyncResult> syncAll() async {
    try {
      final hasPerms = await _healthService.hasPermissions();
      if (!hasPerms) {
        return const HealthSyncResult.failure('Health permissions not granted');
      }

      // Fetch all data in parallel
      final results = await Future.wait([
        _healthService.getTodaysSummary(),
        _healthService.getLastNightSleep(),
        _healthService.getWorkoutsForDate(DateTime.now()),
      ]);

      final summaryResult = results[0] as HealthResult<HealthDailySummary>;
      final sleepResult = results[1] as HealthResult<HealthSleepData>;
      final workoutsResult = results[2] as HealthResult<List<HealthWorkoutData>>;

      final summary = summaryResult.data;
      final sleepData = sleepResult.data;
      final workouts = workoutsResult.data ?? [];

      return HealthSyncResult.success(HealthSyncData(
        steps: summary?.steps ?? 0,
        activeCaloriesBurned: summary?.activeCalories ?? 0,
        totalCaloriesBurned: summary?.totalCaloriesBurned ?? 0,
        restingHeartRate: summary?.restingHeartRate,
        hrv: summary?.hrv,
        sleepData: sleepData,
        externalWorkouts: workouts,
      ));
    } catch (e) {
      return HealthSyncResult.failure('Sync failed: ${e.toString()}');
    }
  }

  /// Sync just today's activity data (steps, calories)
  Future<HealthResult<HealthDailySummary>> syncTodayActivity() async {
    return await _healthService.getTodaysSummary();
  }

  /// Sync last night's sleep data
  Future<HealthResult<HealthSleepData>> syncSleep() async {
    return await _healthService.getLastNightSleep();
  }

  /// Sync external workouts for today
  Future<HealthResult<List<HealthWorkoutData>>> syncWorkouts() async {
    return await _healthService.getWorkoutsForDate(DateTime.now());
  }

  /// Save a workout to health platform
  Future<bool> saveWorkout(WorkoutSession session) async {
    final result = await _healthService.saveWorkout(
      startTime: session.startTime,
      endTime: session.endTime,
      caloriesBurned: session.caloriesBurned,
      category: session.category,
    );
    return result.isSuccess;
  }

  /// Save a meal to health platform
  Future<bool> saveMeal({
    required DateTime timestamp,
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
  }) async {
    final result = await _healthService.saveMeal(
      timestamp: timestamp,
      calories: calories,
      proteinGrams: protein,
      carbsGrams: carbs,
      fatGrams: fat,
    );
    return result.isSuccess;
  }

  /// Check if an external workout is a duplicate of a local one
  bool isDuplicateWorkout(
    HealthWorkoutData externalWorkout,
    List<WorkoutSession> localWorkouts,
  ) {
    for (final local in localWorkouts) {
      if (_healthService.isDuplicateWorkout(
        externalWorkout,
        local.startTime,
        local.endTime,
      )) {
        return true;
      }
    }
    return false;
  }

  /// Filter out duplicate workouts from external list
  List<HealthWorkoutData> filterDuplicates(
    List<HealthWorkoutData> externalWorkouts,
    List<WorkoutSession> localWorkouts,
  ) {
    return externalWorkouts
        .where((external) => !isDuplicateWorkout(external, localWorkouts))
        .toList();
  }

  /// Convert health sleep data to app sleep session
  SleepSession? convertToSleepSession(HealthSleepData healthSleep, String oderId) {
    if (healthSleep.bedTime == null || healthSleep.wakeTime == null) {
      return null;
    }

    final totalMinutes = healthSleep.totalMinutes;
    if (totalMinutes <= 0) return null;

    // Calculate efficiency (time asleep / time in bed)
    final efficiency = totalMinutes > 0
        ? healthSleep.totalSleepMinutes / totalMinutes
        : 0.0;

    // Calculate sleep score (simplified version)
    final sleepScore = _calculateSleepScore(healthSleep);

    return SleepSession(
      id: 'health_${healthSleep.bedTime!.millisecondsSinceEpoch}',
      oderId: oderId,
      bedTime: healthSleep.bedTime!,
      wakeTime: healthSleep.wakeTime!,
      totalMinutes: healthSleep.totalSleepMinutes,
      deepSleepMinutes: healthSleep.deepSleepMinutes,
      lightSleepMinutes: healthSleep.lightSleepMinutes,
      remSleepMinutes: healthSleep.remSleepMinutes,
      awakeMinutes: healthSleep.awakeMinutes,
      sleepScore: sleepScore,
      efficiency: efficiency,
      latencyMinutes: 0, // Not available from health data
      source: 'health_platform',
    );
  }

  int _calculateSleepScore(HealthSleepData sleep) {
    // Simple sleep score calculation
    // Based on duration, deep sleep %, REM %, and awake time
    int score = 50; // Base score

    final totalMinutes = sleep.totalSleepMinutes;
    if (totalMinutes <= 0) return 0;

    // Duration score (max 25 points)
    // Optimal: 7-9 hours (420-540 min)
    if (totalMinutes >= 420 && totalMinutes <= 540) {
      score += 25;
    } else if (totalMinutes >= 360 && totalMinutes < 420) {
      score += 20;
    } else if (totalMinutes >= 300 && totalMinutes < 360) {
      score += 15;
    } else if (totalMinutes >= 240) {
      score += 10;
    }

    // Deep sleep score (max 15 points)
    // Optimal: 15-25% of total sleep
    final deepPercent = sleep.deepSleepMinutes / totalMinutes * 100;
    if (deepPercent >= 15 && deepPercent <= 25) {
      score += 15;
    } else if (deepPercent >= 10) {
      score += 10;
    } else if (deepPercent >= 5) {
      score += 5;
    }

    // REM score (max 10 points)
    // Optimal: 20-25% of total sleep
    final remPercent = sleep.remSleepMinutes / totalMinutes * 100;
    if (remPercent >= 20 && remPercent <= 25) {
      score += 10;
    } else if (remPercent >= 15) {
      score += 7;
    } else if (remPercent >= 10) {
      score += 4;
    }

    // Awake penalty (max -10 points)
    // Penalty for time spent awake
    final awakePercent = sleep.awakeMinutes / (totalMinutes + sleep.awakeMinutes) * 100;
    if (awakePercent > 15) {
      score -= 10;
    } else if (awakePercent > 10) {
      score -= 7;
    } else if (awakePercent > 5) {
      score -= 3;
    }

    return score.clamp(0, 100);
  }
}
