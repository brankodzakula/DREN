import 'package:injectable/injectable.dart';

import '../entities/meal_entry.dart';
import '../repositories/diet_repository.dart';

/// Use case for retrieving meals for a specific date
@injectable
class GetMealsForDate {
  final DietRepository _repository;

  GetMealsForDate(this._repository);

  /// Get all meals for a specific date, sorted by time
  Future<List<MealEntry>> call(DateTime date) async {
    final meals = await _repository.getMealsForDate(date);
    // Sort by timestamp
    meals.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return meals;
  }

  /// Get meals grouped by meal type
  Future<Map<String, List<MealEntry>>> grouped(DateTime date) async {
    final meals = await call(date);
    final grouped = <String, List<MealEntry>>{};

    for (final type in MealType.all) {
      grouped[type] = meals.where((m) => m.mealType == type).toList();
    }

    return grouped;
  }

  /// Get daily nutrition summary
  Future<DailyNutritionSummary> getSummary(DateTime date) async {
    return _repository.getDailyNutritionSummary(date);
  }

  /// Get nutrition summary for a date range
  Future<List<DailyNutritionSummary>> getSummaryRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return _repository.getNutritionSummaryRange(startDate, endDate);
  }
}
