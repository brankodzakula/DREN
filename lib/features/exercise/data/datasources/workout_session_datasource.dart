import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/database/app_database.dart';
import '../../../../core/services/database/daos/workout_session_dao.dart';
import '../../domain/entities/workout_session.dart' as domain;

/// Datasource for workout session database operations
abstract class WorkoutSessionDataSource {
  /// Get workout sessions for a specific date
  Future<List<domain.WorkoutSession>> getSessionsForDate(DateTime date);

  /// Get workout sessions in a date range
  Future<List<domain.WorkoutSession>> getSessionsInRange(
    DateTime start,
    DateTime end,
  );

  /// Get the most recent workout session
  Future<domain.WorkoutSession?> getLastSession();

  /// Insert a new workout session
  Future<void> insertSession(domain.WorkoutSession session);

  /// Delete a workout session
  Future<void> deleteSession(String id);

  /// Get total minutes for date
  Future<int> getTotalMinutesForDate(DateTime date);

  /// Get total calories for date
  Future<int> getTotalCaloriesForDate(DateTime date);
}

@LazySingleton(as: WorkoutSessionDataSource)
class WorkoutSessionDataSourceImpl implements WorkoutSessionDataSource {
  final WorkoutSessionDao _dao;

  WorkoutSessionDataSourceImpl(this._dao);

  @override
  Future<List<domain.WorkoutSession>> getSessionsForDate(DateTime date) async {
    final sessions = await _dao.getSessionsForDate(date);
    return sessions.map(_toDomain).toList();
  }

  @override
  Future<List<domain.WorkoutSession>> getSessionsInRange(
    DateTime start,
    DateTime end,
  ) async {
    final sessions = await _dao.getSessionsInRange(start, end);
    return sessions.map(_toDomain).toList();
  }

  @override
  Future<domain.WorkoutSession?> getLastSession() async {
    final sessions = await _dao.getSessionsInRange(
      DateTime.now().subtract(const Duration(days: 365)),
      DateTime.now(),
    );
    if (sessions.isEmpty) return null;
    return _toDomain(sessions.last);
  }

  @override
  Future<void> insertSession(domain.WorkoutSession session) async {
    await _dao.insertSession(
      WorkoutSessionsCompanion.insert(
        id: session.id,
        oderId: session.oderId,
        workoutId: Value(session.workoutId),
        startTime: session.startTime,
        endTime: session.endTime,
        durationMinutes: session.durationMinutes,
        caloriesBurned: session.caloriesBurned,
        category: session.category,
        averageHeartRate: Value(session.averageHeartRate),
        maxHeartRate: Value(session.maxHeartRate),
        distanceMeters: Value(session.distanceMeters),
        source: session.source,
        externalId: Value(session.externalId),
      ),
    );
  }

  @override
  Future<void> deleteSession(String id) async {
    await _dao.deleteSession(id);
  }

  @override
  Future<int> getTotalMinutesForDate(DateTime date) async {
    return _dao.getTotalMinutesForDate(date);
  }

  @override
  Future<int> getTotalCaloriesForDate(DateTime date) async {
    return _dao.getTotalCaloriesBurnedForDate(date);
  }

  domain.WorkoutSession _toDomain(WorkoutSession db) {
    return domain.WorkoutSession(
      id: db.id,
      oderId: db.oderId,
      workoutId: db.workoutId,
      startTime: db.startTime,
      endTime: db.endTime,
      durationMinutes: db.durationMinutes,
      caloriesBurned: db.caloriesBurned,
      category: db.category,
      averageHeartRate: db.averageHeartRate,
      maxHeartRate: db.maxHeartRate,
      distanceMeters: db.distanceMeters,
      source: db.source,
      externalId: db.externalId,
    );
  }
}
