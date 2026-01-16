import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/food_item.dart';

/// Tile widget for displaying a food search result
class SearchResultTile extends StatelessWidget {
  final FoodItem food;
  final VoidCallback onTap;
  final VoidCallback? onQuickAdd;
  final VoidCallback? onFavorite;
  final bool isFavorite;

  const SearchResultTile({
    super.key,
    required this.food,
    required this.onTap,
    this.onQuickAdd,
    this.onFavorite,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: DrenSpacing.sm),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          child: Padding(
            padding: const EdgeInsets.all(DrenSpacing.md),
            child: Row(
              children: [
                // Food info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        food.name,
                        style: DrenTypography.body.copyWith(
                          color: DrenColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),

                      // Brand if available
                      if (food.brand != null) ...[
                        Text(
                          food.brand!,
                          style: DrenTypography.caption1.copyWith(
                            color: DrenColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                      ],

                      // Serving info
                      Row(
                        children: [
                          Text(
                            food.servingInfo,
                            style: DrenTypography.caption2.copyWith(
                              color: DrenColors.textTertiary,
                            ),
                          ),
                          const SizedBox(width: DrenSpacing.sm),
                          _SourceBadge(source: food.databaseSource),
                        ],
                      ),
                    ],
                  ),
                ),

                // Nutrition summary
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${food.calories}',
                      style: DrenTypography.headline.copyWith(
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

                const SizedBox(width: DrenSpacing.sm),

                // Actions
                Column(
                  children: [
                    // Quick add button
                    if (onQuickAdd != null)
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle,
                          color: DrenColors.primary,
                        ),
                        onPressed: onQuickAdd,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                        tooltip: 'Quick add',
                      ),

                    // Favorite button
                    if (onFavorite != null)
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite
                              ? DrenColors.error
                              : DrenColors.textTertiary,
                          size: 20,
                        ),
                        onPressed: onFavorite,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                        tooltip: isFavorite
                            ? 'Remove from favorites'
                            : 'Add to favorites',
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Badge showing the data source
class _SourceBadge extends StatelessWidget {
  final String source;

  const _SourceBadge({required this.source});

  @override
  Widget build(BuildContext context) {
    String label;
    Color color;

    switch (source) {
      case 'usda':
        label = 'USDA';
        color = DrenColors.info;
        break;
      case 'open_food_facts':
        label = 'OFF';
        color = DrenColors.success;
        break;
      case 'manual':
        label = 'Custom';
        color = DrenColors.warning;
        break;
      case 'recipe':
        label = 'Recipe';
        color = DrenColors.primary;
        break;
      default:
        label = source.toUpperCase();
        color = DrenColors.textTertiary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: DrenTypography.caption2.copyWith(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
