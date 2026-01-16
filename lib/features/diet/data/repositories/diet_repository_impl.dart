import 'package:injectable/injectable.dart';

import '../../domain/entities/food_item.dart';
import '../../domain/entities/meal_entry.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/repositories/diet_repository.dart';
import '../datasources/food_cache.dart';
import '../datasources/local_food_datasource.dart';
import '../datasources/open_food_facts_datasource.dart';
import '../datasources/usda_datasource.dart';

/// Implementation of DietRepository that coordinates multiple data sources
@LazySingleton(as: DietRepository)
class DietRepositoryImpl implements DietRepository {
  final UsdaDataSource _usdaDataSource;
  final OpenFoodFactsDataSource _openFoodFactsDataSource;
  final LocalFoodDataSource _localDataSource;
  final FoodCache _cache;

  DietRepositoryImpl(
    this._usdaDataSource,
    this._openFoodFactsDataSource,
    this._localDataSource,
    this._cache,
  );

  // ============ Food Search ============

  @override
  Future<List<FoodItem>> searchFood(String query, {int limit = 20}) async {
    if (query.trim().isEmpty) return [];

    final normalizedQuery = query.trim().toLowerCase();

    // Check in-memory cache first
    final cachedResults = _cache.getCachedSearch(normalizedQuery);
    if (cachedResults != null) {
      return cachedResults.take(limit).toList();
    }

    // Search local cache/custom foods first
    final localResults = await _localDataSource.searchCachedFoods(query);

    // Search remote APIs
    List<FoodItem> remoteResults = [];
    try {
      remoteResults = await _usdaDataSource.searchFoods(query, pageSize: limit);
    } catch (e) {
      // Silently fail on network errors, use cached data
    }

    // Merge results, prioritizing local (recently used) items
    final allResults = _mergeSearchResults(localResults, remoteResults, limit);

    // Cache results
    _cache.cacheSearch(normalizedQuery, allResults);

    // Also persist remote results to local cache
    for (final food in remoteResults) {
      await _localDataSource.cacheFoodItem(food);
    }

    return allResults;
  }

  @override
  Future<FoodItem?> searchFoodByBarcode(String barcode) async {
    if (barcode.trim().isEmpty) return null;

    // Check in-memory cache
    final cached = _cache.getCachedBarcode(barcode);
    if (cached != null) return cached;

    // Check local database cache
    final localCached = await _localDataSource.getCachedFoodByBarcode(barcode);
    if (localCached != null) {
      _cache.cacheBarcode(barcode, localCached);
      return localCached;
    }

    // Try Open Food Facts API
    try {
      final result = await _openFoodFactsDataSource.getProductByBarcode(barcode);
      if (result != null) {
        _cache.cacheBarcode(barcode, result);
        await _localDataSource.cacheFoodItem(result);
        return result;
      }
    } catch (e) {
      // Silently fail on network errors
    }

    return null;
  }

  @override
  Future<List<FoodItem>> getRecentFoods({int limit = 10}) async {
    return _localDataSource.getRecentFoods(limit: limit);
  }

  @override
  Future<List<FoodItem>> getFrequentFoods({int limit = 10}) async {
    return _localDataSource.getFrequentFoods(limit: limit);
  }

  // ============ Meal Logging ============

  @override
  Future<MealEntry> logMeal(MealEntry meal) async {
    await _localDataSource.saveMealEntry(meal);
    return meal;
  }

  @override
  Future<MealEntry> updateMeal(MealEntry meal) async {
    await _localDataSource.updateMealEntry(meal);
    return meal;
  }

  @override
  Future<void> deleteMeal(String mealId) async {
    await _localDataSource.deleteMealEntry(mealId);
  }

  @override
  Future<List<MealEntry>> getMealsForDate(DateTime date) async {
    return _localDataSource.getMealsForDate(date);
  }

  @override
  Future<MealEntry?> getMealById(String mealId) async {
    return _localDataSource.getMealById(mealId);
  }

  // ============ Daily Totals ============

  @override
  Future<DailyNutritionSummary> getDailyNutritionSummary(DateTime date) async {
    final meals = await getMealsForDate(date);

    if (meals.isEmpty) {
      return DailyNutritionSummary.empty(date);
    }

    return DailyNutritionSummary(
      date: date,
      totalCalories: meals.fold(0, (sum, m) => sum + m.totalCalories),
      totalProtein: meals.fold(0.0, (sum, m) => sum + m.totalProtein),
      totalCarbs: meals.fold(0.0, (sum, m) => sum + m.totalCarbs),
      totalFat: meals.fold(0.0, (sum, m) => sum + m.totalFat),
      totalFiber: _sumOptionalNutrient(meals, (m) => m.items.fold<double?>(
          null, (sum, item) => (sum ?? 0) + (item.fiber ?? 0))),
      totalSugar: _sumOptionalNutrient(meals, (m) => m.items.fold<double?>(
          null, (sum, item) => (sum ?? 0) + (item.sugar ?? 0))),
      mealCount: meals.length,
    );
  }

  @override
  Future<List<DailyNutritionSummary>> getNutritionSummaryRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final summaries = <DailyNutritionSummary>[];
    var currentDate = startDate;

    while (!currentDate.isAfter(endDate)) {
      summaries.add(await getDailyNutritionSummary(currentDate));
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return summaries;
  }

  // ============ Recipes ============

  @override
  Future<List<Recipe>> getAllRecipes() async {
    // TODO: Implement recipe loading from local assets/database
    return _getBlueprintRecipesData();
  }

  @override
  Future<List<Recipe>> getBlueprintRecipes() async {
    final recipes = await getAllRecipes();
    return recipes.where((r) => r.isBlueprintRecipe).toList();
  }

  @override
  Future<List<Recipe>> getRecipesByDietaryTags(List<String> tags) async {
    final recipes = await getAllRecipes();
    return recipes
        .where((r) => tags.every((tag) => r.dietaryTags.contains(tag)))
        .toList();
  }

  @override
  Future<List<Recipe>> searchRecipes(String query) async {
    final recipes = await getAllRecipes();
    final normalizedQuery = query.toLowerCase();
    return recipes
        .where((r) => r.name.toLowerCase().contains(normalizedQuery) ||
            r.description.toLowerCase().contains(normalizedQuery))
        .toList();
  }

  @override
  Future<Recipe?> getRecipeById(String recipeId) async {
    final recipes = await getAllRecipes();
    try {
      return recipes.firstWhere((r) => r.id == recipeId);
    } catch (_) {
      return null;
    }
  }

  // ============ Food Item Management ============

  @override
  Future<FoodItem> saveCustomFood(FoodItem food) async {
    await _localDataSource.saveCustomFood(food);
    return food;
  }

  @override
  Future<void> cacheFoodItem(FoodItem food) async {
    await _localDataSource.cacheFoodItem(food);
  }

  // ============ Private Helpers ============

  /// Merge local and remote search results, prioritizing local
  List<FoodItem> _mergeSearchResults(
    List<FoodItem> local,
    List<FoodItem> remote,
    int limit,
  ) {
    final results = <FoodItem>[];
    final seenIds = <String>{};

    // Add local results first (higher priority)
    for (final item in local) {
      if (seenIds.add(item.id) && results.length < limit) {
        results.add(item);
      }
    }

    // Add remote results
    for (final item in remote) {
      if (seenIds.add(item.id) && results.length < limit) {
        results.add(item);
      }
    }

    return results;
  }

  /// Sum optional nutrient across meals
  double? _sumOptionalNutrient(
    List<MealEntry> meals,
    double? Function(MealEntry) getter,
  ) {
    double? sum;
    for (final meal in meals) {
      final value = getter(meal);
      if (value != null) {
        sum = (sum ?? 0) + value;
      }
    }
    return sum;
  }

  /// Get hardcoded Blueprint recipes
  List<Recipe> _getBlueprintRecipesData() {
    return [
      Recipe(
        id: 'super_veggie',
        name: 'Super Veggie',
        description: 'The foundation meal of the Blueprint protocol - nutrient-dense vegetables and legumes',
        prepTimeMinutes: 15,
        cookTimeMinutes: 30,
        servings: 2,
        ingredients: [
          const RecipeIngredient(name: 'Black Lentils', amount: 150, unit: 'g'),
          const RecipeIngredient(name: 'Broccoli', amount: 200, unit: 'g'),
          const RecipeIngredient(name: 'Cauliflower', amount: 150, unit: 'g'),
          const RecipeIngredient(name: 'Mushrooms', amount: 100, unit: 'g'),
          const RecipeIngredient(name: 'Garlic', amount: 3, unit: 'cloves'),
          const RecipeIngredient(name: 'Ginger', amount: 1, unit: 'tbsp', notes: 'minced'),
        ],
        instructions: [
          'Cook black lentils according to package directions',
          'Steam broccoli and cauliflower until tender-crisp',
          'Sauté mushrooms with garlic and ginger',
          'Combine all vegetables with cooked lentils',
          'Season with cumin and apple cider vinegar',
        ],
        nutrition: const NutritionPerServing(
          calories: 380,
          protein: 26,
          carbs: 64,
          fat: 7,
          fiber: 18,
        ),
        dietaryTags: ['vegan', 'gluten_free'],
        allergens: [],
        longevityRationale: 'High fiber promotes gut health and satiety. Sulforaphane from cruciferous vegetables activates Nrf2 pathway.',
        isBlueprintRecipe: true,
      ),
      Recipe(
        id: 'nutty_pudding',
        name: 'Nutty Pudding',
        description: 'Nutrient-dense breakfast with healthy fats and plant protein',
        prepTimeMinutes: 10,
        cookTimeMinutes: 0,
        servings: 1,
        ingredients: [
          const RecipeIngredient(name: 'Macadamia Nuts', amount: 30, unit: 'g'),
          const RecipeIngredient(name: 'Walnuts', amount: 30, unit: 'g'),
          const RecipeIngredient(name: 'Mixed Berries', amount: 100, unit: 'g'),
          const RecipeIngredient(name: 'Pea Protein Powder', amount: 25, unit: 'g'),
          const RecipeIngredient(name: 'Unsweetened Cocoa', amount: 1, unit: 'tbsp'),
        ],
        instructions: [
          'Blend nuts until coarsely ground',
          'Add berries and protein powder',
          'Mix in cocoa, flaxseed, and lecithin',
          'Top with cinnamon',
          'Add water to desired consistency',
        ],
        nutrition: const NutritionPerServing(
          calories: 430,
          protein: 20,
          carbs: 30,
          fat: 32,
          fiber: 10,
        ),
        dietaryTags: ['vegan', 'gluten_free'],
        allergens: ['tree_nuts'],
        longevityRationale: 'Omega-3s from walnuts support brain health. Polyphenols from berries and cocoa provide antioxidant protection.',
        isBlueprintRecipe: true,
      ),
      Recipe(
        id: 'evoo_shot',
        name: 'EVOO Shot',
        description: 'Pure extra virgin olive oil for heart-healthy fats',
        prepTimeMinutes: 1,
        cookTimeMinutes: 0,
        servings: 1,
        ingredients: [
          const RecipeIngredient(name: 'Extra Virgin Olive Oil', amount: 3, unit: 'tbsp'),
        ],
        instructions: [
          'Pour 3 tablespoons of high-quality EVOO',
          'Consume directly or mix with lemon juice',
        ],
        nutrition: const NutritionPerServing(
          calories: 370,
          protein: 0,
          carbs: 0,
          fat: 42,
        ),
        dietaryTags: ['vegan', 'keto', 'gluten_free'],
        allergens: [],
        longevityRationale: 'Oleic acid and polyphenols in EVOO reduce inflammation and support cardiovascular health.',
        isBlueprintRecipe: true,
      ),
    ];
  }
}
