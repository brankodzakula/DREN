import '../entities/food_item.dart';
import '../entities/meal_entry.dart';
import '../entities/recipe.dart';

/// Repository interface for diet-related operations
abstract class DietRepository {
  // ============ Food Search ============

  /// Search for food items by name
  /// Returns results from local cache first, then remote APIs
  Future<List<FoodItem>> searchFood(String query, {int limit = 20});

  /// Search food by barcode (UPC/EAN)
  Future<FoodItem?> searchFoodByBarcode(String barcode);

  /// Get recently used food items for quick access
  Future<List<FoodItem>> getRecentFoods({int limit = 10});

  /// Get frequently used food items
  Future<List<FoodItem>> getFrequentFoods({int limit = 10});

  // ============ Meal Logging ============

  /// Log a new meal entry
  Future<MealEntry> logMeal(MealEntry meal);

  /// Update an existing meal entry
  Future<MealEntry> updateMeal(MealEntry meal);

  /// Delete a meal entry
  Future<void> deleteMeal(String mealId);

  /// Get meals for a specific date
  Future<List<MealEntry>> getMealsForDate(DateTime date);

  /// Get meal by ID
  Future<MealEntry?> getMealById(String mealId);

  // ============ Daily Totals ============

  /// Get daily nutrition totals for a date
  Future<DailyNutritionSummary> getDailyNutritionSummary(DateTime date);

  /// Get nutrition totals for a date range
  Future<List<DailyNutritionSummary>> getNutritionSummaryRange(
    DateTime startDate,
    DateTime endDate,
  );

  // ============ Recipes ============

  /// Get all available recipes
  Future<List<Recipe>> getAllRecipes();

  /// Get Blueprint core recipes
  Future<List<Recipe>> getBlueprintRecipes();

  /// Get recipes filtered by dietary restrictions
  Future<List<Recipe>> getRecipesByDietaryTags(List<String> tags);

  /// Search recipes by name
  Future<List<Recipe>> searchRecipes(String query);

  /// Get recipe by ID
  Future<Recipe?> getRecipeById(String recipeId);

  // ============ Food Item Management ============

  /// Save a custom food item
  Future<FoodItem> saveCustomFood(FoodItem food);

  /// Cache a food item from remote search
  Future<void> cacheFoodItem(FoodItem food);
}

/// Summary of daily nutrition intake
class DailyNutritionSummary {
  final DateTime date;
  final int totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFat;
  final double? totalFiber;
  final double? totalSugar;
  final int mealCount;

  const DailyNutritionSummary({
    required this.date,
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFat,
    this.totalFiber,
    this.totalSugar,
    required this.mealCount,
  });

  /// Create an empty summary for a date with no logged meals
  factory DailyNutritionSummary.empty(DateTime date) {
    return DailyNutritionSummary(
      date: date,
      totalCalories: 0,
      totalProtein: 0,
      totalCarbs: 0,
      totalFat: 0,
      totalFiber: 0,
      totalSugar: 0,
      mealCount: 0,
    );
  }

  /// Get macros summary string
  String get macrosSummary =>
      '${totalProtein.round()}p · ${totalCarbs.round()}c · ${totalFat.round()}f';
}
