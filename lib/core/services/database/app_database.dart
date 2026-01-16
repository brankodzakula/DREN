import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:injectable/injectable.dart';

import 'tables.dart';
import 'daos/user_profile_dao.dart';
import 'daos/daily_protocol_dao.dart';
import 'daos/meal_entry_dao.dart';
import 'daos/workout_session_dao.dart';
import 'daos/sleep_session_dao.dart';
import 'daos/recipe_dao.dart';
import 'daos/workout_dao.dart';
import 'daos/daily_progress_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    UserProfiles,
    DailyProtocols,
    MealEntries,
    WorkoutSessions,
    SleepSessions,
    SleepHabitLogs,
    DailyProgressEntries,
    Recipes,
    Workouts,
    CachedFoods,
    CustomFoods,
    MealItems,
    RecentFoods,
    FavoriteFoods,
  ],
  daos: [
    UserProfileDao,
    DailyProtocolDao,
    MealEntryDao,
    WorkoutSessionDao,
    SleepSessionDao,
    RecipeDao,
    WorkoutDao,
    DailyProgressDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Constructor for testing with in-memory database
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Migration from version 1 to 2: Add diet feature tables
        if (from < 2) {
          await m.createTable(cachedFoods);
          await m.createTable(customFoods);
          await m.createTable(mealItems);
          // Recreate RecentFoods and FavoriteFoods with new schema
          await m.deleteTable('recent_foods');
          await m.deleteTable('favorite_foods');
          await m.createTable(recentFoods);
          await m.createTable(favoriteFoods);
        }
      },
      beforeOpen: (details) async {
        // Enable foreign keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  /// Clear all data (for logout/reset)
  Future<void> clearAllData() async {
    await transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dren.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

/// Module for registering database in DI
@module
abstract class DatabaseModule {
  @singleton
  AppDatabase get database => AppDatabase();

  @singleton
  UserProfileDao userProfileDao(AppDatabase db) => db.userProfileDao;

  @singleton
  DailyProtocolDao dailyProtocolDao(AppDatabase db) => db.dailyProtocolDao;

  @singleton
  MealEntryDao mealEntryDao(AppDatabase db) => db.mealEntryDao;

  @singleton
  WorkoutSessionDao workoutSessionDao(AppDatabase db) => db.workoutSessionDao;

  @singleton
  SleepSessionDao sleepSessionDao(AppDatabase db) => db.sleepSessionDao;

  @singleton
  RecipeDao recipeDao(AppDatabase db) => db.recipeDao;

  @singleton
  WorkoutDao workoutDao(AppDatabase db) => db.workoutDao;

  @singleton
  DailyProgressDao dailyProgressDao(AppDatabase db) => db.dailyProgressDao;
}
