import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/food_item.dart';
import '../../domain/entities/meal_entry.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/repositories/diet_repository.dart';

part 'diet_state.freezed.dart';

/// State for the Diet feature
@freezed
class DietState with _$DietState {
  /// Initial state before any data is loaded
  const factory DietState.initial() = DietInitial;

  /// Loading state while fetching data
  const factory DietState.loading() = DietLoading;

  /// Main loaded state with all diet data
  const factory DietState.loaded({
    required DateTime date,
    required List<MealEntry> meals,
    required DailyNutritionSummary nutritionSummary,
    required NutritionTargets targets,
    required List<Recipe> quickLogRecipes,
    required List<FoodItem> recentFoods,
  }) = DietLoaded;

  /// Searching state while food search is in progress
  const factory DietState.searching({
    required DietLoaded previousState,
    required String query,
  }) = DietSearching;

  /// Search results state
  const factory DietState.searchResults({
    required DietLoaded previousState,
    required String query,
    required List<FoodItem> results,
  }) = DietSearchResults;

  /// Error state
  const factory DietState.error({
    required String message,
    DietLoaded? previousState,
  }) = DietError;
}

/// Nutrition targets from protocol
class NutritionTargets {
  final int targetCalories;
  final int targetProtein;
  final int targetCarbs;
  final int targetFat;
  final String? eatingWindowStart;
  final String? eatingWindowEnd;

  const NutritionTargets({
    required this.targetCalories,
    required this.targetProtein,
    required this.targetCarbs,
    required this.targetFat,
    this.eatingWindowStart,
    this.eatingWindowEnd,
  });

  /// Create default targets
  factory NutritionTargets.defaults() {
    return const NutritionTargets(
      targetCalories: 2000,
      targetProtein: 150,
      targetCarbs: 200,
      targetFat: 65,
      eatingWindowStart: '08:00',
      eatingWindowEnd: '18:00',
    );
  }

  /// Calculate remaining calories
  int remainingCalories(int consumed) => targetCalories - consumed;

  /// Calculate remaining protein
  int remainingProtein(double consumed) => targetProtein - consumed.toInt();

  /// Check if within eating window
  bool isWithinEatingWindow(DateTime time) {
    if (eatingWindowStart == null || eatingWindowEnd == null) return true;

    final startParts = eatingWindowStart!.split(':');
    final endParts = eatingWindowEnd!.split(':');

    final startMinutes = int.parse(startParts[0]) * 60 + int.parse(startParts[1]);
    final endMinutes = int.parse(endParts[0]) * 60 + int.parse(endParts[1]);
    final currentMinutes = time.hour * 60 + time.minute;

    return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
  }
}

/// Extension to get macros progress
extension DietLoadedExtensions on DietLoaded {
  /// Get calories consumed
  int get caloriesConsumed => nutritionSummary.totalCalories;

  /// Get calories remaining
  int get caloriesRemaining => targets.targetCalories - caloriesConsumed;

  /// Get protein consumed
  double get proteinConsumed => nutritionSummary.totalProtein;

  /// Get carbs consumed
  double get carbsConsumed => nutritionSummary.totalCarbs;

  /// Get fat consumed
  double get fatConsumed => nutritionSummary.totalFat;

  /// Get calories progress (0.0 to 1.0+)
  double get caloriesProgress => caloriesConsumed / targets.targetCalories;

  /// Get protein progress (0.0 to 1.0+)
  double get proteinProgress => proteinConsumed / targets.targetProtein;

  /// Get carbs progress (0.0 to 1.0+)
  double get carbsProgress => carbsConsumed / targets.targetCarbs;

  /// Get fat progress (0.0 to 1.0+)
  double get fatProgress => fatConsumed / targets.targetFat;

  /// Check if within eating window
  bool get isWithinEatingWindow => targets.isWithinEatingWindow(DateTime.now());
}
