import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/onboarding_data.dart';

/// Goals selection step - multi-select chips
class GoalsStep extends StatelessWidget {
  final List<String> selectedGoals;
  final ValueChanged<String> onGoalToggled;

  const GoalsStep({
    super.key,
    required this.selectedGoals,
    required this.onGoalToggled,
  });

  IconData _getGoalIcon(String goal) {
    switch (goal) {
      case Goals.loseWeight:
        return Icons.trending_down_outlined;
      case Goals.buildMuscle:
        return Icons.fitness_center_outlined;
      case Goals.improveSleep:
        return Icons.bedtime_outlined;
      case Goals.increaseEnergy:
        return Icons.bolt_outlined;
      case Goals.longevity:
        return Icons.favorite_outline;
      case Goals.mentalClarity:
        return Icons.psychology_outlined;
      default:
        return Icons.star_outline;
    }
  }

  Color _getGoalColor(String goal) {
    switch (goal) {
      case Goals.loseWeight:
        return DrenColors.caloriesInRing;
      case Goals.buildMuscle:
        return DrenColors.exerciseRing;
      case Goals.improveSleep:
        return DrenColors.sleepRing;
      case Goals.increaseEnergy:
        return DrenColors.warning;
      case Goals.longevity:
        return DrenColors.error;
      case Goals.mentalClarity:
        return DrenColors.info;
      default:
        return DrenColors.primary;
    }
  }

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
            'What are your goals?',
            style: DrenTypography.title1.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Description
          Text(
            'Select all that apply. We\'ll personalize your protocol based on your priorities.',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),

          const SizedBox(height: DrenSpacing.xxxl),

          // Goals grid
          Wrap(
            spacing: DrenSpacing.sm,
            runSpacing: DrenSpacing.sm,
            children: Goals.values.map((goal) {
              final isSelected = selectedGoals.contains(goal);
              return _GoalChip(
                goal: goal,
                label: Goals.getDisplayName(goal),
                icon: _getGoalIcon(goal),
                color: _getGoalColor(goal),
                isSelected: isSelected,
                onTap: () => onGoalToggled(goal),
              );
            }).toList(),
          ),

          const SizedBox(height: DrenSpacing.xl),

          // Hint
          Container(
            padding: const EdgeInsets.all(DrenSpacing.md),
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: DrenColors.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: DrenSpacing.sm),
                Expanded(
                  child: Text(
                    selectedGoals.isEmpty
                        ? 'Tap to select your goals (optional)'
                        : '${selectedGoals.length} goal${selectedGoals.length == 1 ? '' : 's'} selected',
                    style: DrenTypography.caption1.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: DrenSpacing.xl),
        ],
      ),
    );
  }
}

class _GoalChip extends StatelessWidget {
  final String goal;
  final String label;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _GoalChip({
    required this.goal,
    required this.label,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: DrenSpacing.md,
          vertical: DrenSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.15)
              : DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
          border: Border.all(
            color: isSelected ? color : DrenColors.surfaceSecondary,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? color : DrenColors.textSecondary,
            ),
            const SizedBox(width: DrenSpacing.xs),
            Text(
              label,
              style: DrenTypography.subheadline.copyWith(
                color: isSelected ? color : DrenColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: DrenSpacing.xs),
              Icon(
                Icons.check,
                size: 16,
                color: color,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
