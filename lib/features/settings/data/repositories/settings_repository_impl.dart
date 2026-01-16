import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/database/app_database.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../domain/entities/user_settings.dart';
import '../../domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final AppDatabase _database;
  final SecureStorageService _secureStorage;

  static const _notificationPrefsKey = 'notification_preferences';

  SettingsRepositoryImpl(this._database, this._secureStorage);

  @override
  Future<UserSettings?> getUserSettings() async {
    final profile = await _database.userProfileDao.getUserProfile();
    if (profile == null) return null;

    // Parse wake time from string (HH:mm)
    final wakeTimeParts = profile.wakeTime.split(':');
    final wakeTime = TimeOfDay(
      hour: int.parse(wakeTimeParts[0]),
      minute: int.parse(wakeTimeParts[1]),
    );

    return UserSettings(
      id: profile.id,
      dateOfBirth: profile.dateOfBirth,
      sex: profile.sex,
      heightCm: profile.heightCm,
      weightKg: profile.weightKg,
      targetWeightKg: profile.targetWeightKg,
      activityLevel: profile.activityLevel,
      longevityAmbition: profile.longevityAmbition,
      fitnessLevel: profile.fitnessLevel,
      wakeTime: wakeTime,
      healthPermissionsGranted: profile.healthDisclaimerAccepted,
      createdAt: profile.createdAt,
      updatedAt: profile.updatedAt,
    );
  }

  @override
  Future<void> updateProfile({
    double? weightKg,
    double? targetWeightKg,
    double? heightCm,
    String? activityLevel,
    String? fitnessLevel,
    TimeOfDay? wakeTime,
  }) async {
    final profile = await _database.userProfileDao.getUserProfile();
    if (profile == null) return;

    final companion = UserProfilesCompanion(
      id: Value(profile.id),
      weightKg: weightKg != null ? Value(weightKg) : const Value.absent(),
      targetWeightKg: targetWeightKg != null
          ? Value(targetWeightKg)
          : const Value.absent(),
      heightCm: heightCm != null ? Value(heightCm) : const Value.absent(),
      activityLevel:
          activityLevel != null ? Value(activityLevel) : const Value.absent(),
      fitnessLevel:
          fitnessLevel != null ? Value(fitnessLevel) : const Value.absent(),
      wakeTime: wakeTime != null
          ? Value(_formatTimeOfDay(wakeTime))
          : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    );

    await _database.userProfileDao.upsertUserProfile(companion);
  }

  @override
  Future<void> updateAmbition(String ambition) async {
    final profile = await _database.userProfileDao.getUserProfile();
    if (profile == null) return;

    final companion = UserProfilesCompanion(
      id: Value(profile.id),
      longevityAmbition: Value(ambition),
      updatedAt: Value(DateTime.now()),
    );

    await _database.userProfileDao.upsertUserProfile(companion);
  }

  @override
  Future<NotificationPreferences> getNotificationPreferences() async {
    final stored = await _secureStorage.read(_notificationPrefsKey);
    if (stored == null) return const NotificationPreferences();

    // Parse stored JSON
    final parts = stored.split(',');
    return NotificationPreferences(
      mealReminders: parts.length > 0 && parts[0] == '1',
      workoutReminders: parts.length > 1 && parts[1] == '1',
      bedtimeReminders: parts.length > 2 && parts[2] == '1',
      supplementReminders: parts.length > 3 && parts[3] == '1',
      progressUpdates: parts.length > 4 && parts[4] == '1',
    );
  }

  @override
  Future<void> updateNotificationPreferences(
      NotificationPreferences prefs) async {
    // Store as comma-separated values for simplicity
    final value = [
      prefs.mealReminders ? '1' : '0',
      prefs.workoutReminders ? '1' : '0',
      prefs.bedtimeReminders ? '1' : '0',
      prefs.supplementReminders ? '1' : '0',
      prefs.progressUpdates ? '1' : '0',
    ].join(',');

    await _secureStorage.write(_notificationPrefsKey, value);
  }

  @override
  Future<void> clearAllData() async {
    // Clear all tables
    await _database.transaction(() async {
      // Delete in order respecting foreign key constraints
      await _database.delete(_database.mealItems).go();
      await _database.delete(_database.mealEntries).go();
      await _database.delete(_database.workoutSessions).go();
      await _database.delete(_database.sleepSessions).go();
      await _database.delete(_database.sleepHabitLogs).go();
      await _database.delete(_database.dailyProgressEntries).go();
      await _database.delete(_database.dailyProtocols).go();
      await _database.delete(_database.recentFoods).go();
      await _database.delete(_database.favoriteFoods).go();
      await _database.delete(_database.customFoods).go();
      await _database.delete(_database.cachedFoods).go();
      await _database.delete(_database.userProfiles).go();
    });

    // Clear secure storage
    await _secureStorage.clearAll();
  }

  @override
  Future<Map<String, dynamic>> exportUserData() async {
    final profile = await _database.userProfileDao.getUserProfile();
    final mealEntries = await _database.select(_database.mealEntries).get();
    final workoutSessions =
        await _database.select(_database.workoutSessions).get();
    final sleepSessions =
        await _database.select(_database.sleepSessions).get();
    final dailyProgress =
        await _database.select(_database.dailyProgressEntries).get();

    return {
      'exportedAt': DateTime.now().toIso8601String(),
      'version': '1.0',
      'profile': profile != null
          ? {
              'dateOfBirth': profile.dateOfBirth.toIso8601String(),
              'sex': profile.sex,
              'heightCm': profile.heightCm,
              'weightKg': profile.weightKg,
              'targetWeightKg': profile.targetWeightKg,
              'activityLevel': profile.activityLevel,
              'longevityAmbition': profile.longevityAmbition,
              'fitnessLevel': profile.fitnessLevel,
              'wakeTime': profile.wakeTime,
              'createdAt': profile.createdAt.toIso8601String(),
            }
          : null,
      'mealEntries': mealEntries
          .map((e) => {
                'id': e.id,
                'timestamp': e.timestamp.toIso8601String(),
                'mealType': e.mealType,
                'totalCalories': e.totalCalories,
                'totalProtein': e.totalProtein,
                'totalCarbs': e.totalCarbs,
                'totalFat': e.totalFat,
              })
          .toList(),
      'workoutSessions': workoutSessions
          .map((e) => {
                'id': e.id,
                'startTime': e.startTime.toIso8601String(),
                'endTime': e.endTime.toIso8601String(),
                'durationMinutes': e.durationMinutes,
                'caloriesBurned': e.caloriesBurned,
                'category': e.category,
              })
          .toList(),
      'sleepSessions': sleepSessions
          .map((e) => {
                'id': e.id,
                'bedTime': e.bedTime.toIso8601String(),
                'wakeTime': e.wakeTime.toIso8601String(),
                'totalMinutes': e.totalMinutes,
                'sleepScore': e.sleepScore,
              })
          .toList(),
      'dailyProgress': dailyProgress
          .map((e) => {
                'date': e.date.toIso8601String(),
                'caloriesConsumed': e.caloriesConsumed,
                'caloriesBurned': e.caloriesBurned,
                'exerciseMinutes': e.exerciseMinutes,
                'sleepMinutes': e.sleepMinutes,
                'stepsCount': e.stepsCount,
              })
          .toList(),
    };
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
