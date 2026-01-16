import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/database/app_database.dart';
import '../../../../core/services/database/daos/daily_progress_dao.dart';
import '../../../../core/services/database/daos/daily_protocol_dao.dart';
import '../../domain/entities/daily_progress.dart' as domain;
import '../../domain/repositories/today_repository.dart';
import '../../../protocol_engine/domain/entities/daily_protocol.dart'
    as protocol_entity;

@LazySingleton(as: TodayRepository)
class TodayRepositoryImpl implements TodayRepository {
  final DailyProgressDao _progressDao;
  final DailyProtocolDao _protocolDao;

  TodayRepositoryImpl(this._progressDao, this._protocolDao);

  @override
  Future<domain.DailyProgress?> getProgressForDate(DateTime date) async {
    final entry = await _progressDao.getProgressForDate(date);
    return entry != null ? _mapEntryToProgress(entry) : null;
  }

  @override
  Future<domain.DailyProgress> getTodayProgress() async {
    final entry = await _progressDao.getTodayProgress();

    if (entry != null) {
      return _mapEntryToProgress(entry);
    }

    // Create and save a new empty progress for today
    final today = DateTime.now();
    final emptyProgress = domain.DailyProgress.empty(today);
    await saveProgress(emptyProgress);
    return emptyProgress;
  }

  @override
  Future<protocol_entity.DailyProtocol?> getProtocolForDate(
      DateTime date) async {
    final entry = await _protocolDao.getProtocolForDate(date);
    return entry != null ? _mapEntryToProtocol(entry) : null;
  }

  @override
  Future<protocol_entity.DailyProtocol?> getTodayProtocol() async {
    final entry = await _protocolDao.getTodayProtocol();
    return entry != null ? _mapEntryToProtocol(entry) : null;
  }

  @override
  Future<void> saveProgress(domain.DailyProgress progress) async {
    final companion = DailyProgressEntriesCompanion(
      id: Value(progress.id),
      date: Value(progress.date),
      caloriesConsumed: Value(progress.caloriesConsumed),
      caloriesBurned: Value(progress.caloriesBurned),
      exerciseMinutes: Value(progress.exerciseMinutes),
      sleepMinutes: Value(progress.sleepMinutes),
      proteinGrams: Value(progress.proteinGrams),
      carbsGrams: Value(progress.carbsGrams),
      fatGrams: Value(progress.fatGrams),
      stepsCount: Value(progress.stepsCount),
      weightKg: Value(progress.weightKg),
    );

    await _progressDao.upsertProgress(companion);
  }

  @override
  Future<void> saveProtocol(protocol_entity.DailyProtocol protocol) async {
    final id =
        'protocol_${protocol.date.toIso8601String().split('T').first}';

    final companion = DailyProtocolsCompanion(
      id: Value(id),
      date: Value(protocol.date),
      targetCalories: Value(protocol.targetCalories),
      targetProtein: Value(protocol.proteinGrams),
      targetCarbs: Value(protocol.carbsGrams),
      targetFat: Value(protocol.fatGrams),
      eatingWindowStart: Value(protocol.eatingWindowStart != null
          ? _formatTimeOfDay(protocol.eatingWindowStart!)
          : '08:00'),
      eatingWindowEnd: Value(protocol.eatingWindowEnd != null
          ? _formatTimeOfDay(protocol.eatingWindowEnd!)
          : '18:00'),
      exerciseTargetMinutes: Value(protocol.exerciseMinutes),
      scheduledWorkoutId: const Value.absent(),
      estimatedCaloriesBurn: Value(protocol.estimatedCaloriesBurn),
      isRestDay: Value(protocol.workoutType.toLowerCase() == 'rest'),
      targetBedtime: Value(_formatTimeOfDay(protocol.targetBedtime)),
      targetWakeTime: Value(_formatTimeOfDay(protocol.targetWakeTime)),
      targetSleepMinutes: const Value(480), // 8 hours
      windDownStart: Value(_formatTimeOfDay(protocol.windDownStart)),
      lastCaffeineCutoff: const Value('14:00'),
      lastMealCutoff: const Value('19:00'),
      supplements: Value(jsonEncode([])), // Empty for now
      generatedAt: Value(DateTime.now()),
    );

    await _protocolDao.upsertProtocol(companion);
  }

  @override
  Future<List<domain.DailyProgress>> getProgressHistory(int days) async {
    final entries = await _progressDao.getProgressInRange(
      DateTime.now().subtract(Duration(days: days)),
      DateTime.now(),
    );

    return entries.map(_mapEntryToProgress).toList();
  }

  @override
  Future<void> updateCaloriesConsumed(DateTime date, int calories) async {
    final progress = await getTodayProgress();
    final updated = domain.DailyProgress(
      id: progress.id,
      date: progress.date,
      caloriesConsumed: calories,
      caloriesBurned: progress.caloriesBurned,
      exerciseMinutes: progress.exerciseMinutes,
      sleepMinutes: progress.sleepMinutes,
      proteinGrams: progress.proteinGrams,
      carbsGrams: progress.carbsGrams,
      fatGrams: progress.fatGrams,
      stepsCount: progress.stepsCount,
      weightKg: progress.weightKg,
    );
    await saveProgress(updated);
  }

  @override
  Future<void> updateCaloriesBurned(DateTime date, int calories) async {
    final progress = await getTodayProgress();
    final updated = domain.DailyProgress(
      id: progress.id,
      date: progress.date,
      caloriesConsumed: progress.caloriesConsumed,
      caloriesBurned: calories,
      exerciseMinutes: progress.exerciseMinutes,
      sleepMinutes: progress.sleepMinutes,
      proteinGrams: progress.proteinGrams,
      carbsGrams: progress.carbsGrams,
      fatGrams: progress.fatGrams,
      stepsCount: progress.stepsCount,
      weightKg: progress.weightKg,
    );
    await saveProgress(updated);
  }

  @override
  Future<void> updateExerciseMinutes(DateTime date, int minutes) async {
    final progress = await getTodayProgress();
    final updated = domain.DailyProgress(
      id: progress.id,
      date: progress.date,
      caloriesConsumed: progress.caloriesConsumed,
      caloriesBurned: progress.caloriesBurned,
      exerciseMinutes: minutes,
      sleepMinutes: progress.sleepMinutes,
      proteinGrams: progress.proteinGrams,
      carbsGrams: progress.carbsGrams,
      fatGrams: progress.fatGrams,
      stepsCount: progress.stepsCount,
      weightKg: progress.weightKg,
    );
    await saveProgress(updated);
  }

  @override
  Future<void> updateSleepMinutes(DateTime date, int minutes) async {
    final progress = await getTodayProgress();
    final updated = domain.DailyProgress(
      id: progress.id,
      date: progress.date,
      caloriesConsumed: progress.caloriesConsumed,
      caloriesBurned: progress.caloriesBurned,
      exerciseMinutes: progress.exerciseMinutes,
      sleepMinutes: minutes,
      proteinGrams: progress.proteinGrams,
      carbsGrams: progress.carbsGrams,
      fatGrams: progress.fatGrams,
      stepsCount: progress.stepsCount,
      weightKg: progress.weightKg,
    );
    await saveProgress(updated);
  }

  @override
  Future<void> updateMacros(
      DateTime date, double protein, double carbs, double fat) async {
    final progress = await getTodayProgress();
    final updated = domain.DailyProgress(
      id: progress.id,
      date: progress.date,
      caloriesConsumed: progress.caloriesConsumed,
      caloriesBurned: progress.caloriesBurned,
      exerciseMinutes: progress.exerciseMinutes,
      sleepMinutes: progress.sleepMinutes,
      proteinGrams: protein,
      carbsGrams: carbs,
      fatGrams: fat,
      stepsCount: progress.stepsCount,
      weightKg: progress.weightKg,
    );
    await saveProgress(updated);
  }

  @override
  Future<void> updateSteps(DateTime date, int steps) async {
    final progress = await getTodayProgress();
    final updated = domain.DailyProgress(
      id: progress.id,
      date: progress.date,
      caloriesConsumed: progress.caloriesConsumed,
      caloriesBurned: progress.caloriesBurned,
      exerciseMinutes: progress.exerciseMinutes,
      sleepMinutes: progress.sleepMinutes,
      proteinGrams: progress.proteinGrams,
      carbsGrams: progress.carbsGrams,
      fatGrams: progress.fatGrams,
      stepsCount: steps,
      weightKg: progress.weightKg,
    );
    await saveProgress(updated);
  }

  @override
  Future<void> updateWeight(DateTime date, double? weightKg) async {
    final progress = await getTodayProgress();
    final updated = domain.DailyProgress(
      id: progress.id,
      date: progress.date,
      caloriesConsumed: progress.caloriesConsumed,
      caloriesBurned: progress.caloriesBurned,
      exerciseMinutes: progress.exerciseMinutes,
      sleepMinutes: progress.sleepMinutes,
      proteinGrams: progress.proteinGrams,
      carbsGrams: progress.carbsGrams,
      fatGrams: progress.fatGrams,
      stepsCount: progress.stepsCount,
      weightKg: weightKg,
    );
    await saveProgress(updated);
  }

  // Helper methods

  domain.DailyProgress _mapEntryToProgress(DailyProgressEntry entry) {
    return domain.DailyProgress(
      id: entry.id,
      date: entry.date,
      caloriesConsumed: entry.caloriesConsumed,
      caloriesBurned: entry.caloriesBurned,
      exerciseMinutes: entry.exerciseMinutes,
      sleepMinutes: entry.sleepMinutes,
      proteinGrams: entry.proteinGrams,
      carbsGrams: entry.carbsGrams,
      fatGrams: entry.fatGrams,
      stepsCount: entry.stepsCount,
      weightKg: entry.weightKg,
    );
  }

  protocol_entity.DailyProtocol _mapEntryToProtocol(DailyProtocol entry) {
    return protocol_entity.DailyProtocol(
      date: entry.date,
      targetCalories: entry.targetCalories,
      proteinGrams: entry.targetProtein,
      carbsGrams: entry.targetCarbs,
      fatGrams: entry.targetFat,
      exerciseMinutes: entry.exerciseTargetMinutes,
      workoutType: entry.isRestDay ? 'Rest' : 'Workout',
      estimatedCaloriesBurn: entry.estimatedCaloriesBurn,
      targetBedtime: _parseTimeOfDay(entry.targetBedtime),
      targetWakeTime: _parseTimeOfDay(entry.targetWakeTime),
      windDownStart: _parseTimeOfDay(entry.windDownStart),
      eatingWindowStart: _parseTimeOfDay(entry.eatingWindowStart),
      eatingWindowEnd: _parseTimeOfDay(entry.eatingWindowEnd),
      ambitionLevel: 'moderate',
      fitnessLevel: 'intermediate',
    );
  }

  TimeOfDay _parseTimeOfDay(String time) {
    final parts = time.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  String _formatTimeOfDay(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
