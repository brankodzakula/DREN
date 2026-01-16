import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/onboarding_data.dart';

/// Activity level selection step - 5 options
class ActivityLevelStep extends StatelessWidget {
  final String? selectedActivityLevel;
  final ValueChanged<String> onActivityLevelSelected;

  const ActivityLevelStep({
    super.key,
    required this.selectedActivityLevel,
    required this.onActivityLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: DrenSpacing.xl),

          // Title
          Text(
            'How active are you?',
            style: DrenTypography.title1.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Description
          Text(
            'This helps us calculate your daily calorie needs and exercise recommendations.',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),

          const SizedBox(height: DrenSpacing.xl),

          // Activity level options
          ...ActivityLevel.values.map((level) {
            final isSelected = selectedActivityLevel == level;
            return Padding(
              padding: const EdgeInsets.only(bottom: DrenSpacing.sm),
              child: _ActivityLevelOption(
                level: level,
                isSelected: isSelected,
                onTap: () => onActivityLevelSelected(level),
              ),
            );
          }),

          const SizedBox(height: DrenSpacing.xl),
        ],
      ),
    );
  }
}

class _ActivityLevelOption extends StatelessWidget {
  final String level;
  final bool isSelected;
  final VoidCallback onTap;

  const _ActivityLevelOption({
    required this.level,
    required this.isSelected,
    required this.onTap,
  });

  IconData _getIcon() {
    switch (level) {
      case ActivityLevel.sedentary:
        return Icons.weekend_outlined;
      case ActivityLevel.lightlyActive:
        return Icons.directions_walk_outlined;
      case ActivityLevel.moderatelyActive:
        return Icons.directions_run_outlined;
      case ActivityLevel.veryActive:
        return Icons.fitness_center_outlined;
      case ActivityLevel.extraActive:
        return Icons.sports_gymnastics_outlined;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(DrenSpacing.md),
        decoration: BoxDecoration(
          color: isSelected
              ? DrenColors.primary.withValues(alpha: 0.1)
              : DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          border: Border.all(
            color: isSelected ? DrenColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected
                    ? DrenColors.primary.withValues(alpha: 0.2)
                    : DrenColors.surfaceSecondary,
                borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
              ),
              child: Icon(
                _getIcon(),
                color: isSelected ? DrenColors.primary : DrenColors.textSecondary,
                size: 24,
              ),
            ),
            const SizedBox(width: DrenSpacing.md),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ActivityLevel.getDisplayName(level),
                    style: DrenTypography.headline.copyWith(
                      color: isSelected
                          ? DrenColors.primary
                          : DrenColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: DrenSpacing.xxs),
                  Text(
                    ActivityLevel.getDescription(level),
                    style: DrenTypography.caption1.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            // Checkmark
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: DrenColors.primary,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
