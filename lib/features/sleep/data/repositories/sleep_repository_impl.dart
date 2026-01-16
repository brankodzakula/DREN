import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/database/daos/daily_protocol_dao.dart';
import '../../domain/entities/meditation.dart';
import '../../domain/entities/sleep_habit_log.dart';
import '../../domain/entities/sleep_schedule.dart';
import '../../domain/entities/sleep_session.dart';
import '../../domain/repositories/sleep_repository.dart';
import '../datasources/meditation_datasource.dart';
import '../datasources/sleep_local_datasource.dart';

@LazySingleton(as: SleepRepository)
class SleepRepositoryImpl implements SleepRepository {
  final SleepLocalDataSource _sleepDataSource;
  final MeditationDataSource _meditationDataSource;
  final DailyProtocolDao _dailyProtocolDao;

  SleepRepositoryImpl(
    this._sleepDataSource,
    this._meditationDataSource,
    this._dailyProtocolDao,
  );

  @override
  Future<SleepSession?> getLastNightSleep() async {
    return _sleepDataSource.getLastNightSleep();
  }

  @override
  Future<List<SleepSession>> getSleepSessions({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return _sleepDataSource.getSessionsInRange(startDate, endDate);
  }

  @override
  Future<SleepSession?> getSleepSessionForDate(DateTime date) async {
    return _sleepDataSource.getSleepForDate(date);
  }

  @override
  Future<void> saveSleepSession(SleepSession session) async {
    return _sleepDataSource.saveSleepSession(session);
  }

  @override
  Future<void> deleteSleepSession(String id) async {
    return _sleepDataSource.deleteSleepSession(id);
  }

  @override
  Future<SleepSchedule> getSleepSchedule() async {
    final protocol = await _dailyProtocolDao.getTodayProtocol();

    if (protocol != null) {
      return SleepSchedule(
        targetBedtime: _parseTimeOfDay(protocol.targetBedtime),
        targetWakeTime: _parseTimeOfDay(protocol.targetWakeTime),
        targetSleepMinutes: protocol.targetSleepMinutes,
        windDownStart: _parseTimeOfDay(protocol.windDownStart),
        lastCaffeineCutoff: _parseTimeOfDay(protocol.lastCaffeineCutoff),
        lastMealCutoff: _parseTimeOfDay(protocol.lastMealCutoff),
      );
    }

    // Default schedule if no protocol exists
    return const SleepSchedule(
      targetBedtime: TimeOfDay(hour: 22, minute: 0),
      targetWakeTime: TimeOfDay(hour: 6, minute: 0),
      targetSleepMinutes: 480,
      windDownStart: TimeOfDay(hour: 21, minute: 0),
      lastCaffeineCutoff: TimeOfDay(hour: 14, minute: 0),
      lastMealCutoff: TimeOfDay(hour: 18, minute: 0),
    );
  }

  @override
  Future<SleepHabitLog?> getSleepHabitLog(DateTime date) async {
    return _sleepDataSource.getHabitLogForDate(date);
  }

  @override
  Future<void> saveSleepHabitLog(SleepHabitLog log) async {
    return _sleepDataSource.saveHabitLog(log);
  }

  @override
  Future<SleepHabitLog> toggleHabit({
    required DateTime date,
    required String habitName,
    required bool value,
  }) async {
    var log = await _sleepDataSource.getHabitLogForDate(date);

    if (log == null) {
      // Create new log with default values
      log = SleepHabitLog(
        id: const Uuid().v4(),
        oderId: DateTime.now().toIso8601String(),
        date: date,
        noCaffeineAfterCutoff: false,
        lastMealOnTime: false,
        screenFreeBeforeBed: false,
        roomTempOptimal: false,
        meditationCompleted: false,
      );
    }

    // Update the specific habit
    final updatedLog = _updateHabitInLog(log, habitName, value);
    await _sleepDataSource.saveHabitLog(updatedLog);
    return updatedLog;
  }

  @override
  Future<List<Meditation>> getMeditations() async {
    return _meditationDataSource.getMeditations();
  }

  @override
  Future<List<Meditation>> getMeditationsByCategory(String category) async {
    return _meditationDataSource.getMeditationsByCategory(category);
  }

  @override
  Future<Meditation?> getMeditationById(String id) async {
    return _meditationDataSource.getMeditationById(id);
  }

  @override
  Future<void> markMeditationDownloaded(String id, bool downloaded) async {
    return _meditationDataSource.markMeditationDownloaded(id, downloaded);
  }

  @override
  Future<WeeklySleepStats> getWeeklySleepStats(DateTime weekStart) async {
    final weekEnd = weekStart.add(const Duration(days: 7));
    final sessions = await _sleepDataSource.getSessionsInRange(weekStart, weekEnd);

    if (sessions.isEmpty) {
      return WeeklySleepStats(
        weekStart: weekStart,
        avgSleepHours: 0,
        avgSleepScore: 0,
        totalSleepSessions: 0,
        avgEfficiency: 0,
        avgDeepSleepMinutes: 0,
        avgRemSleepMinutes: 0,
      );
    }

    final totalMinutes = sessions.fold<int>(0, (sum, s) => sum + s.totalMinutes);
    final totalScore = sessions.fold<int>(0, (sum, s) => sum + s.sleepScore);
    final totalEfficiency = sessions.fold<double>(0, (sum, s) => sum + s.efficiency);
    final totalDeep = sessions.fold<int>(0, (sum, s) => sum + s.deepSleepMinutes);
    final totalRem = sessions.fold<int>(0, (sum, s) => sum + s.remSleepMinutes);

    return WeeklySleepStats(
      weekStart: weekStart,
      avgSleepHours: (totalMinutes / sessions.length) / 60,
      avgSleepScore: totalScore / sessions.length,
      totalSleepSessions: sessions.length,
      avgEfficiency: totalEfficiency / sessions.length,
      avgDeepSleepMinutes: totalDeep ~/ sessions.length,
      avgRemSleepMinutes: totalRem ~/ sessions.length,
    );
  }

  @override
  Future<double> getAverageSleepScore(int days) async {
    return _sleepDataSource.getAverageSleepScore(days);
  }

  /// Parse time string (HH:mm) to TimeOfDay
  TimeOfDay _parseTimeOfDay(String timeString) {
    final parts = timeString.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  /// Update a specific habit in the log
  SleepHabitLog _updateHabitInLog(SleepHabitLog log, String habitName, bool value) {
    switch (habitName) {
      case 'noCaffeineAfterCutoff':
        return log.copyWith(noCaffeineAfterCutoff: value);
      case 'lastMealOnTime':
        return log.copyWith(lastMealOnTime: value);
      case 'screenFreeBeforeBed':
        return log.copyWith(screenFreeBeforeBed: value);
      case 'roomTempOptimal':
        return log.copyWith(roomTempOptimal: value);
      case 'meditationCompleted':
        return log.copyWith(meditationCompleted: value);
      default:
        return log;
    }
  }
}
