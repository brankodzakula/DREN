import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/database/app_database.dart';
import '../../../../core/services/database/daos/sleep_session_dao.dart';
import '../../domain/entities/sleep_session.dart' as domain;
import '../../domain/entities/sleep_habit_log.dart' as domain;

/// Local datasource for sleep data operations using Drift
@lazySingleton
class SleepLocalDataSource {
  final SleepSessionDao _sleepSessionDao;

  SleepLocalDataSource(this._sleepSessionDao);

  /// Get last night's sleep session
  Future<domain.SleepSession?> getLastNightSleep() async {
    final session = await _sleepSessionDao.getLastNightSleep();
    return session != null ? _mapToSleepSessionEntity(session) : null;
  }

  /// Get sleep session for a specific date
  Future<domain.SleepSession?> getSleepForDate(DateTime date) async {
    final session = await _sleepSessionDao.getSleepForDate(date);
    return session != null ? _mapToSleepSessionEntity(session) : null;
  }

  /// Get sleep sessions in date range
  Future<List<domain.SleepSession>> getSessionsInRange(
    DateTime start,
    DateTime end,
  ) async {
    final sessions = await _sleepSessionDao.getSessionsInRange(start, end);
    return sessions.map(_mapToSleepSessionEntity).toList();
  }

  /// Save a sleep session
  Future<void> saveSleepSession(domain.SleepSession session) async {
    final companion = SleepSessionsCompanion(
      id: Value(session.id),
      oderId: Value(session.oderId),
      bedTime: Value(session.bedTime),
      wakeTime: Value(session.wakeTime),
      totalMinutes: Value(session.totalMinutes),
      deepSleepMinutes: Value(session.deepSleepMinutes),
      lightSleepMinutes: Value(session.lightSleepMinutes),
      remSleepMinutes: Value(session.remSleepMinutes),
      awakeMinutes: Value(session.awakeMinutes),
      efficiency: Value(session.efficiency),
      latencyMinutes: Value(session.latencyMinutes),
      sleepScore: Value(session.sleepScore),
      source: Value(session.source),
      externalId: Value(session.externalId),
    );
    await _sleepSessionDao.updateSession(companion);
  }

  /// Delete a sleep session
  Future<void> deleteSleepSession(String id) async {
    await _sleepSessionDao.deleteSession(id);
  }

  /// Get average sleep score for last N days
  Future<double> getAverageSleepScore(int days) async {
    return _sleepSessionDao.getAverageSleepScore(days);
  }

  /// Get average sleep hours for last N days
  Future<double> getAverageSleepHours(int days) async {
    return _sleepSessionDao.getAverageSleepHours(days);
  }

  /// Get habit log for date
  Future<domain.SleepHabitLog?> getHabitLogForDate(DateTime date) async {
    final log = await _sleepSessionDao.getHabitLogForDate(date);
    return log != null ? _mapToSleepHabitLogEntity(log) : null;
  }

  /// Get tonight's habit log
  Future<domain.SleepHabitLog?> getTonightHabitLog() async {
    final log = await _sleepSessionDao.getTonightHabitLog();
    return log != null ? _mapToSleepHabitLogEntity(log) : null;
  }

  /// Save or update habit log
  Future<void> saveHabitLog(domain.SleepHabitLog log) async {
    final companion = SleepHabitLogsCompanion(
      id: Value(log.id),
      oderId: Value(log.oderId),
      date: Value(log.date),
      noCaffeineAfterCutoff: Value(log.noCaffeineAfterCutoff),
      lastMealOnTime: Value(log.lastMealOnTime),
      screenFreeBeforeBed: Value(log.screenFreeBeforeBed),
      roomTempOptimal: Value(log.roomTempOptimal),
      meditationCompleted: Value(log.meditationCompleted),
      notes: Value(log.notes),
    );
    await _sleepSessionDao.upsertHabitLog(companion);
  }

  /// Map Drift SleepSession to domain entity
  domain.SleepSession _mapToSleepSessionEntity(SleepSession session) {
    return domain.SleepSession(
      id: session.id,
      oderId: session.oderId,
      bedTime: session.bedTime,
      wakeTime: session.wakeTime,
      totalMinutes: session.totalMinutes,
      deepSleepMinutes: session.deepSleepMinutes,
      lightSleepMinutes: session.lightSleepMinutes,
      remSleepMinutes: session.remSleepMinutes,
      awakeMinutes: session.awakeMinutes,
      efficiency: session.efficiency,
      latencyMinutes: session.latencyMinutes,
      sleepScore: session.sleepScore,
      source: session.source,
      externalId: session.externalId,
    );
  }

  /// Map Drift SleepHabitLog to domain entity
  domain.SleepHabitLog _mapToSleepHabitLogEntity(SleepHabitLog log) {
    return domain.SleepHabitLog(
      id: log.id,
      oderId: log.oderId,
      date: log.date,
      noCaffeineAfterCutoff: log.noCaffeineAfterCutoff,
      lastMealOnTime: log.lastMealOnTime,
      screenFreeBeforeBed: log.screenFreeBeforeBed,
      roomTempOptimal: log.roomTempOptimal,
      meditationCompleted: log.meditationCompleted,
      notes: log.notes,
    );
  }
}
