import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'meal_entry_dao.g.dart';

@DriftAccessor(tables: [MealEntries])
class MealEntryDao extends DatabaseAccessor<AppDatabase>
    with _$MealEntryDaoMixin {
  MealEntryDao(super.db);

  /// Get meals for a specific date
  Future<List<MealEntry>> getMealsForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(mealEntries)
          ..where((t) => t.timestamp.isBetweenValues(startOfDay, endOfDay))
          ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
        .get();
  }

  /// Get today's meals
  Future<List<MealEntry>> getTodayMeals() async {
    return getMealsForDate(DateTime.now());
  }

  /// Insert meal entry
  Future<void> insertMeal(MealEntriesCompanion meal) async {
    await into(mealEntries).insert(meal);
  }

  /// Update meal entry
  Future<void> updateMeal(MealEntriesCompanion meal) async {
    await into(mealEntries).insertOnConflictUpdate(meal);
  }

  /// Delete meal entry
  Future<void> deleteMeal(String id) async {
    await (delete(mealEntries)..where((t) => t.id.equals(id))).go();
  }

  /// Get total calories for date
  Future<int> getTotalCaloriesForDate(DateTime date) async {
    final meals = await getMealsForDate(date);
    return meals.fold<int>(0, (sum, meal) => sum + meal.totalCalories);
  }

  /// Get meals by type for date
  Future<List<MealEntry>> getMealsByTypeForDate(
      DateTime date, String mealType) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(mealEntries)
          ..where((t) =>
              t.timestamp.isBetweenValues(startOfDay, endOfDay) &
              t.mealType.equals(mealType))
          ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
        .get();
  }

  /// Get meals in date range
  Future<List<MealEntry>> getMealsInRange(DateTime start, DateTime end) async {
    return (select(mealEntries)
          ..where((t) => t.timestamp.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
        .get();
  }
}
