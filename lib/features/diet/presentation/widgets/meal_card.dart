import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/meal_entry.dart';

/// Card widget displaying a logged meal entry
class MealCard extends StatelessWidget {
  final MealEntry meal;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const MealCard({
    super.key,
    required this.meal,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DrenSpacing.md),
        decoration: BoxDecoration(
          color: DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                // Meal type icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getMealTypeColor().withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
                  ),
                  child: Icon(
                    _getMealTypeIcon(),
                    color: _getMealTypeColor(),
                    size: 20,
                  ),
                ),
                const SizedBox(width: DrenSpacing.sm),

                // Meal info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.mealTypeDisplay,
                        style: DrenTypography.headline.copyWith(
                          color: DrenColors.textPrimary,
                        ),
                      ),
                      Text(
                        meal.displayTime,
                        style: DrenTypography.caption1.copyWith(
                          color: DrenColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                // Calories
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${meal.totalCalories}',
                      style: DrenTypography.title3.copyWith(
                        color: DrenColors.primary,
                      ),
                    ),
                    Text(
                      'kcal',
                      style: DrenTypography.caption2.copyWith(
                        color: DrenColors.textSecondary,
                      ),
                    ),
                  ],
                ),

                // Delete button
                if (onDelete != null) ...[
                  const SizedBox(width: DrenSpacing.xs),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: DrenColors.textTertiary,
                      size: 20,
                    ),
                    onPressed: () => _showDeleteConfirmation(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                ],
              ],
            ),

            // Divider
            if (meal.items.isNotEmpty) ...[
              const SizedBox(height: DrenSpacing.sm),
              Divider(
                color: DrenColors.surfaceTertiary,
                height: 1,
              ),
              const SizedBox(height: DrenSpacing.sm),
            ],

            // Food items list
            ...meal.items.take(3).map((item) => Padding(
              padding: const EdgeInsets.only(bottom: DrenSpacing.xs),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.displayName,
                      style: DrenTypography.footnote.copyWith(
                        color: DrenColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${item.calories} kcal',
                    style: DrenTypography.caption2.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )),

            // Show more indicator
            if (meal.items.length > 3)
              Text(
                '+${meal.items.length - 3} more items',
                style: DrenTypography.caption2.copyWith(
                  color: DrenColors.primary,
                ),
              ),

            // Macros summary
            const SizedBox(height: DrenSpacing.sm),
            Row(
              children: [
                _MacroBadge(
                  label: 'P',
                  value: meal.totalProtein,
                  color: DrenColors.proteinColor,
                ),
                const SizedBox(width: DrenSpacing.xs),
                _MacroBadge(
                  label: 'C',
                  value: meal.totalCarbs,
                  color: DrenColors.carbsColor,
                ),
                const SizedBox(width: DrenSpacing.xs),
                _MacroBadge(
                  label: 'F',
                  value: meal.totalFat,
                  color: DrenColors.fatColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getMealTypeIcon() {
    switch (meal.mealType) {
      case MealType.breakfast:
        return Icons.wb_sunny_outlined;
      case MealType.lunch:
        return Icons.wb_cloudy_outlined;
      case MealType.dinner:
        return Icons.nightlight_outlined;
      case MealType.snack:
        return Icons.cookie_outlined;
      default:
        return Icons.restaurant_outlined;
    }
  }

  Color _getMealTypeColor() {
    switch (meal.mealType) {
      case MealType.breakfast:
        return DrenColors.warning;
      case MealType.lunch:
        return DrenColors.info;
      case MealType.dinner:
        return DrenColors.sleepRing;
      case MealType.snack:
        return DrenColors.success;
      default:
        return DrenColors.primary;
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: DrenColors.surfacePrimary,
        title: Text(
          'Delete Meal',
          style: DrenTypography.title3.copyWith(
            color: DrenColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to delete this ${meal.mealTypeDisplay.toLowerCase()}?',
          style: DrenTypography.body.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Cancel',
              style: DrenTypography.body.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              onDelete?.call();
            },
            child: Text(
              'Delete',
              style: DrenTypography.body.copyWith(
                color: DrenColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small badge showing macro value
class _MacroBadge extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _MacroBadge({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DrenSpacing.xs,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
      ),
      child: Text(
        '$label: ${value.round()}g',
        style: DrenTypography.caption2.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
