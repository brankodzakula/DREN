import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/database/app_database.dart';
import '../../domain/entities/food_item.dart';
import '../../domain/entities/meal_entry.dart' as domain;

/// Local data source for food items, meals, and favorites
/// Handles local database operations for diet feature
@injectable
class LocalFoodDataSource {
  final AppDatabase _database;

  LocalFoodDataSource(this._database);

  // ============ Food Item Cache ============

  /// Cache a food item from remote search
  Future<void> cacheFoodItem(FoodItem food) async {
    await _database.into(_database.cachedFoods).insertOnConflictUpdate(
          CachedFoodsCompanion.insert(
            id: food.id,
            name: food.name,
            brand: Value(food.brand),
            servingSize: food.servingSize,
            servingUnit: food.servingUnit,
            calories: food.calories,
            protein: food.protein,
            carbs: food.carbs,
            fat: food.fat,
            fiber: Value(food.fiber),
            sugar: Value(food.sugar),
            sodium: Value(food.sodium),
            barcode: Value(food.barcode),
            databaseSource: food.databaseSource,
            cachedAt: DateTime.now(),
          ),
        );
  }

  /// Get cached food item by ID
  Future<FoodItem?> getCachedFoodById(String id) async {
    final query = _database.select(_database.cachedFoods)
      ..where((t) => t.id.equals(id));
    final result = await query.getSingleOrNull();
    return result != null ? _mapCachedFoodToEntity(result) : null;
  }

  /// Get cached food item by barcode
  Future<FoodItem?> getCachedFoodByBarcode(String barcode) async {
    final query = _database.select(_database.cachedFoods)
      ..where((t) => t.barcode.equals(barcode));
    final result = await query.getSingleOrNull();
    return result != null ? _mapCachedFoodToEntity(result) : null;
  }

  /// Search cached foods by name
  Future<List<FoodItem>> searchCachedFoods(String query) async {
    final searchQuery = '%${query.toLowerCase()}%';
    final results = await (_database.select(_database.cachedFoods)
          ..where((t) => t.name.lower().like(searchQuery))
          ..limit(20))
        .get();
    return results.map(_mapCachedFoodToEntity).toList();
  }

  // ============ Recent Foods ============

  /// Add food to recent foods (track usage)
  Future<void> addToRecentFoods(String foodId) async {
    // First check if exists
    final existing = await (_database.select(_database.recentFoods)
          ..where((t) => t.foodId.equals(foodId)))
        .getSingleOrNull();

    if (existing != null) {
      // Update existing entry
      await (_database.update(_database.recentFoods)
            ..where((t) => t.foodId.equals(foodId)))
          .write(
        RecentFoodsCompanion(
          usedAt: Value(DateTime.now()),
          useCount: Value(existing.useCount + 1),
        ),
      );
    } else {
      // Insert new entry
      await _database.into(_database.recentFoods).insert(
            RecentFoodsCompanion.insert(
              foodId: foodId,
              usedAt: DateTime.now(),
            ),
          );
    }
  }

  /// Get recently used foods
  Future<List<FoodItem>> getRecentFoods({int limit = 10}) async {
    final recentQuery = await (_database.select(_database.recentFoods)
          ..orderBy([(t) => OrderingTerm.desc(t.usedAt)])
          ..limit(limit))
        .get();

    final foods = <FoodItem>[];
    for (final recent in recentQuery) {
      final food = await getCachedFoodById(recent.foodId);
      if (food != null) {
        foods.add(food);
      }
    }
    return foods;
  }

  /// Get frequently used foods
  Future<List<FoodItem>> getFrequentFoods({int limit = 10}) async {
    final frequentQuery = await (_database.select(_database.recentFoods)
          ..orderBy([(t) => OrderingTerm.desc(t.useCount)])
          ..limit(limit))
        .get();

    final foods = <FoodItem>[];
    for (final frequent in frequentQuery) {
      final food = await getCachedFoodById(frequent.foodId);
      if (food != null) {
        foods.add(food);
      }
    }
    return foods;
  }

  // ============ Meal Entries ============

  /// Save a meal entry
  Future<void> saveMealEntry(domain.MealEntry meal) async {
    // Serialize food items to JSON
    final itemsJson = jsonEncode(meal.items.map((item) => item.toJson()).toList());

    // Save the meal entry
    await _database.into(_database.mealEntries).insertOnConflictUpdate(
          MealEntriesCompanion.insert(
            id: meal.id,
            oderId: meal.oderId,
            timestamp: meal.timestamp,
            mealType: meal.mealType,
            itemsJson: itemsJson,
            totalCalories: meal.totalCalories,
            totalProtein: meal.totalProtein,
            totalCarbs: meal.totalCarbs,
            totalFat: meal.totalFat,
            source: meal.source,
          ),
        );

    // Also save meal items for relational queries
    for (final item in meal.items) {
      await _database.into(_database.mealItems).insert(
            MealItemsCompanion.insert(
              mealId: meal.id,
              foodId: item.id,
              quantity: item.servingSize,
              calories: item.calories,
              protein: item.protein,
              carbs: item.carbs,
              fat: item.fat,
            ),
          );

      // Cache the food item
      await cacheFoodItem(item);

      // Track as recently used
      await addToRecentFoods(item.id);
    }
  }

  /// Get meals for a specific date
  Future<List<domain.MealEntry>> getMealsForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final mealRows = await (_database.select(_database.mealEntries)
          ..where((t) =>
              t.timestamp.isBiggerOrEqualValue(startOfDay) &
              t.timestamp.isSmallerThanValue(endOfDay))
          ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
        .get();

    return mealRows.map(_mapMealRowToEntity).toList();
  }

  /// Get meal by ID
  Future<domain.MealEntry?> getMealById(String mealId) async {
    final query = _database.select(_database.mealEntries)
      ..where((t) => t.id.equals(mealId));
    final mealRow = await query.getSingleOrNull();

    if (mealRow == null) return null;
    return _mapMealRowToEntity(mealRow);
  }

  /// Update a meal entry
  Future<void> updateMealEntry(domain.MealEntry meal) async {
    // Delete existing meal items
    await (_database.delete(_database.mealItems)
          ..where((t) => t.mealId.equals(meal.id)))
        .go();

    // Re-save the meal
    await saveMealEntry(meal);
  }

  /// Delete a meal entry
  Future<void> deleteMealEntry(String mealId) async {
    // Delete meal items first
    await (_database.delete(_database.mealItems)
          ..where((t) => t.mealId.equals(mealId)))
        .go();

    // Delete the meal entry
    await (_database.delete(_database.mealEntries)
          ..where((t) => t.id.equals(mealId)))
        .go();
  }

  // ============ Custom Foods ============

  /// Save a custom (manually entered) food item
  Future<void> saveCustomFood(FoodItem food) async {
    await _database.into(_database.customFoods).insertOnConflictUpdate(
          CustomFoodsCompanion.insert(
            id: food.id,
            name: food.name,
            brand: Value(food.brand),
            servingSize: food.servingSize,
            servingUnit: food.servingUnit,
            calories: food.calories,
            protein: food.protein,
            carbs: food.carbs,
            fat: food.fat,
            fiber: Value(food.fiber),
            sugar: Value(food.sugar),
            sodium: Value(food.sodium),
            createdAt: DateTime.now(),
          ),
        );

    // Also add to cache for unified search
    await cacheFoodItem(food);
  }

  /// Get all custom foods
  Future<List<FoodItem>> getCustomFoods() async {
    final results = await _database.select(_database.customFoods).get();
    return results.map(_mapCustomFoodToEntity).toList();
  }

  // ============ Private Helper Methods ============

  FoodItem _mapCachedFoodToEntity(CachedFood row) {
    return FoodItem(
      id: row.id,
      name: row.name,
      brand: row.brand,
      servingSize: row.servingSize,
      servingUnit: row.servingUnit,
      calories: row.calories,
      protein: row.protein,
      carbs: row.carbs,
      fat: row.fat,
      fiber: row.fiber,
      sugar: row.sugar,
      sodium: row.sodium,
      barcode: row.barcode,
      databaseSource: row.databaseSource,
    );
  }

  FoodItem _mapCustomFoodToEntity(CustomFood row) {
    return FoodItem(
      id: row.id,
      name: row.name,
      brand: row.brand,
      servingSize: row.servingSize,
      servingUnit: row.servingUnit,
      calories: row.calories,
      protein: row.protein,
      carbs: row.carbs,
      fat: row.fat,
      fiber: row.fiber,
      sugar: row.sugar,
      sodium: row.sodium,
      barcode: null,
      databaseSource: FoodDatabaseSource.manual,
    );
  }

  domain.MealEntry _mapMealRowToEntity(MealEntry row) {
    // Parse food items from JSON
    final itemsJson = jsonDecode(row.itemsJson) as List;
    final items = itemsJson
        .map((j) => FoodItem.fromJson(j as Map<String, dynamic>))
        .toList();

    return domain.MealEntry(
      id: row.id,
      oderId: row.oderId,
      timestamp: row.timestamp,
      mealType: row.mealType,
      items: items,
      totalCalories: row.totalCalories,
      totalProtein: row.totalProtein,
      totalCarbs: row.totalCarbs,
      totalFat: row.totalFat,
      source: row.source,
    );
  }
}
