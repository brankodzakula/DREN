import 'package:injectable/injectable.dart';

import '../entities/recipe.dart';
import '../repositories/diet_repository.dart';

/// Use case for retrieving recipes
@injectable
class GetRecipes {
  final DietRepository _repository;

  GetRecipes(this._repository);

  /// Get all available recipes
  Future<List<Recipe>> call() async {
    return _repository.getAllRecipes();
  }

  /// Get only Blueprint core recipes
  Future<List<Recipe>> blueprintOnly() async {
    return _repository.getBlueprintRecipes();
  }

  /// Get recipes filtered by dietary restrictions
  Future<List<Recipe>> byDietaryTags(List<String> tags) async {
    if (tags.isEmpty) {
      return call();
    }
    return _repository.getRecipesByDietaryTags(tags);
  }

  /// Search recipes by name
  Future<List<Recipe>> search(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }
    return _repository.searchRecipes(query.trim());
  }

  /// Get a specific recipe by ID
  Future<Recipe?> getById(String recipeId) async {
    return _repository.getRecipeById(recipeId);
  }

  /// Get recipes excluding those with certain allergens
  Future<List<Recipe>> excludingAllergens(List<String> allergens) async {
    final allRecipes = await call();
    return allRecipes
        .where((recipe) => !recipe.allergens.any((a) => allergens.contains(a)))
        .toList();
  }
}
