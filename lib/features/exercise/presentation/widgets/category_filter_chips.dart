import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Horizontal scrolling category filter chips
class CategoryFilterChips extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final Function(String?) onCategorySelected;

  const CategoryFilterChips({
    super.key,
    required this.categories,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1, // +1 for "All" option
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildChip(
              label: 'All',
              isSelected: selectedCategory == null,
              onTap: () => onCategorySelected(null),
            );
          }

          final category = categories[index - 1];
          return _buildChip(
            label: _getCategoryLabel(category),
            isSelected: selectedCategory == category,
            onTap: () => onCategorySelected(category),
            icon: _getCategoryIcon(category),
          );
        },
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: DrenSpacing.sm),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DrenSpacing.md,
            vertical: DrenSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isSelected ? DrenColors.primary : DrenColors.surfacePrimary,
            borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
            border: Border.all(
              color: isSelected
                  ? DrenColors.primary
                  : DrenColors.surfaceSecondary,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16,
                  color: isSelected
                      ? DrenColors.background
                      : DrenColors.textSecondary,
                ),
                const SizedBox(width: DrenSpacing.xs),
              ],
              Text(
                label,
                style: DrenTypography.footnote.copyWith(
                  color: isSelected
                      ? DrenColors.background
                      : DrenColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getCategoryLabel(String category) {
    switch (category.toLowerCase()) {
      case 'strength':
        return 'Strength';
      case 'hiit':
        return 'HIIT';
      case 'yoga':
        return 'Yoga';
      case 'core':
        return 'Core';
      case 'running':
        return 'Running';
      case 'cycling':
        return 'Cycling';
      case 'swimming':
        return 'Swimming';
      default:
        return category[0].toUpperCase() + category.substring(1);
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'strength':
        return Icons.fitness_center;
      case 'hiit':
        return Icons.flash_on;
      case 'yoga':
        return Icons.self_improvement;
      case 'core':
        return Icons.sports_gymnastics;
      case 'running':
        return Icons.directions_run;
      case 'cycling':
        return Icons.directions_bike;
      case 'swimming':
        return Icons.pool;
      default:
        return Icons.sports;
    }
  }
}
