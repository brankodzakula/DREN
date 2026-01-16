import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/food_item.dart';
import '../../domain/entities/recipe.dart';

/// Section showing Blueprint recipes and recent foods for quick logging
class QuickLogSection extends StatelessWidget {
  final List<Recipe> recipes;
  final List<FoodItem> recentFoods;
  final void Function(Recipe) onRecipeTap;
  final void Function(FoodItem) onFoodTap;

  const QuickLogSection({
    super.key,
    required this.recipes,
    required this.recentFoods,
    required this.onRecipeTap,
    required this.onFoodTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Blueprint Recipes
        if (recipes.isNotEmpty) ...[
          Text(
            'Blueprint Meals',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              separatorBuilder: (_, __) => const SizedBox(width: DrenSpacing.sm),
              itemBuilder: (context, index) {
                return _BlueprintRecipeCard(
                  recipe: recipes[index],
                  onTap: () => onRecipeTap(recipes[index]),
                );
              },
            ),
          ),
        ],

        // Recent Foods
        if (recentFoods.isNotEmpty) ...[
          const SizedBox(height: DrenSpacing.md),
          Text(
            'Recent Foods',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recentFoods.length,
              separatorBuilder: (_, __) => const SizedBox(width: DrenSpacing.sm),
              itemBuilder: (context, index) {
                return _RecentFoodChip(
                  food: recentFoods[index],
                  onTap: () => onFoodTap(recentFoods[index]),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}

/// Card for Blueprint recipe
class _BlueprintRecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;

  const _BlueprintRecipeCard({
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(DrenSpacing.sm),
        decoration: BoxDecoration(
          color: DrenColors.workoutCardGreen,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          border: Border.all(
            color: DrenColors.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blueprint badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DrenSpacing.xs,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: DrenColors.primary,
                borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
              ),
              child: Text(
                'BLUEPRINT',
                style: DrenTypography.caption2.copyWith(
                  color: DrenColors.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                ),
              ),
            ),
            const SizedBox(height: DrenSpacing.xs),

            // Recipe name
            Expanded(
              child: Text(
                recipe.name,
                style: DrenTypography.headline.copyWith(
                  color: DrenColors.textPrimary,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Nutrition info
            Text(
              '${recipe.nutrition.calories} kcal',
              style: DrenTypography.caption1.copyWith(
                color: DrenColors.primary,
              ),
            ),
            Text(
              recipe.nutrition.macrosSummary,
              style: DrenTypography.caption2.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Chip for recent food item
class _RecentFoodChip extends StatelessWidget {
  final FoodItem food;
  final VoidCallback onTap;

  const _RecentFoodChip({
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(DrenSpacing.sm),
        decoration: BoxDecoration(
          color: DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              food.name,
              style: DrenTypography.footnote.copyWith(
                color: DrenColors.textPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: DrenSpacing.xxs),
            Text(
              '${food.calories} kcal',
              style: DrenTypography.caption2.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 14,
                  color: DrenColors.primary,
                ),
                const SizedBox(width: 2),
                Text(
                  'Quick add',
                  style: DrenTypography.caption2.copyWith(
                    color: DrenColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
