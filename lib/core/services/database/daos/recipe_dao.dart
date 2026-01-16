import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(tables: [Recipes, FavoriteFoods, RecentFoods])
class RecipeDao extends DatabaseAccessor<AppDatabase> with _$RecipeDaoMixin {
  RecipeDao(super.db);

  // Recipe methods

  /// Get all recipes
  Future<List<Recipe>> getAllRecipes() async {
    return select(recipes).get();
  }

  /// Get Blueprint recipes only
  Future<List<Recipe>> getBlueprintRecipes() async {
    return (select(recipes)..where((t) => t.isBlueprintRecipe.equals(true)))
        .get();
  }

  /// Get recipe by ID
  Future<Recipe?> getRecipeById(String id) async {
    return (select(recipes)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Insert recipe
  Future<void> insertRecipe(RecipesCompanion recipe) async {
    await into(recipes).insert(recipe);
  }

  /// Insert multiple recipes
  Future<void> insertRecipes(List<RecipesCompanion> recipeList) async {
    await batch((batch) {
      batch.insertAll(recipes, recipeList, mode: InsertMode.insertOrReplace);
    });
  }

  /// Search recipes by name
  Future<List<Recipe>> searchRecipes(String query) async {
    return (select(recipes)
          ..where((t) => t.name.like('%$query%'))
          ..limit(20))
        .get();
  }

  // Favorite Foods methods

  /// Get all favorite foods
  Future<List<FavoriteFood>> getFavoriteFoods() async {
    return (select(favoriteFoods)
          ..orderBy([(t) => OrderingTerm.desc(t.addedAt)]))
        .get();
  }

  /// Add to favorites
  Future<void> addFavoriteFood(FavoriteFoodsCompanion food) async {
    await into(favoriteFoods).insertOnConflictUpdate(food);
  }

  /// Remove from favorites
  Future<void> removeFavoriteFood(String foodId) async {
    await (delete(favoriteFoods)..where((t) => t.foodId.equals(foodId))).go();
  }

  /// Check if food is favorite
  Future<bool> isFavorite(String foodId) async {
    final existing = await (select(favoriteFoods)
          ..where((t) => t.foodId.equals(foodId)))
        .getSingleOrNull();
    return existing != null;
  }

  // Recent Foods methods

  /// Get recent foods (last 20)
  Future<List<RecentFood>> getRecentFoods() async {
    return (select(recentFoods)
          ..orderBy([(t) => OrderingTerm.desc(t.usedAt)])
          ..limit(20))
        .get();
  }

  /// Add to recent foods
  Future<void> addRecentFood(RecentFoodsCompanion food) async {
    await into(recentFoods).insertOnConflictUpdate(food);
  }

  /// Clear recent foods
  Future<void> clearRecentFoods() async {
    await delete(recentFoods).go();
  }

  /// Prune old recent foods (keep last 50)
  Future<void> pruneRecentFoods() async {
    final allRecent = await (select(recentFoods)
          ..orderBy([(t) => OrderingTerm.desc(t.usedAt)]))
        .get();

    if (allRecent.length > 50) {
      final toDelete = allRecent.skip(50).map((f) => f.foodId).toList();
      await (delete(recentFoods)..where((t) => t.foodId.isIn(toDelete))).go();
    }
  }
}
