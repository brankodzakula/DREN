import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/sleep_habit_log.dart';

/// Wind-down checklist widget showing sleep hygiene habits
class WindDownChecklist extends StatelessWidget {
  final SleepHabitLog? habits;
  final void Function(String habitName, bool value) onToggle;
  final VoidCallback? onEdit;

  const WindDownChecklist({
    super.key,
    required this.habits,
    required this.onToggle,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wind-Down Checklist',
                style: DrenTypography.headline.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              if (onEdit != null)
                GestureDetector(
                  onTap: onEdit,
                  child: Text(
                    'Edit',
                    style: DrenTypography.subheadline.copyWith(
                      color: DrenColors.primary,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: DrenSpacing.md),

          // Checklist items
          _ChecklistItem(
            icon: Icons.restaurant_outlined,
            label: 'Last meal finished (8+ hrs before bed)',
            isChecked: habits?.lastMealOnTime ?? false,
            onTap: () => onToggle(
              'lastMealOnTime',
              !(habits?.lastMealOnTime ?? false),
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),

          _ChecklistItem(
            icon: Icons.coffee_outlined,
            label: 'No caffeine after cutoff',
            isChecked: habits?.noCaffeineAfterCutoff ?? false,
            onTap: () => onToggle(
              'noCaffeineAfterCutoff',
              !(habits?.noCaffeineAfterCutoff ?? false),
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),

          _ChecklistItem(
            icon: Icons.thermostat_outlined,
            label: 'Room temperature set (60-67°F)',
            isChecked: habits?.roomTempOptimal ?? false,
            onTap: () => onToggle(
              'roomTempOptimal',
              !(habits?.roomTempOptimal ?? false),
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),

          _ChecklistItem(
            icon: Icons.phone_android_outlined,
            label: 'Screens away',
            isChecked: habits?.screenFreeBeforeBed ?? false,
            onTap: () => onToggle(
              'screenFreeBeforeBed',
              !(habits?.screenFreeBeforeBed ?? false),
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),

          _ChecklistItem(
            icon: Icons.self_improvement_outlined,
            label: '10-min meditation completed',
            isChecked: habits?.meditationCompleted ?? false,
            onTap: () => onToggle(
              'meditationCompleted',
              !(habits?.meditationCompleted ?? false),
            ),
          ),

          // Progress indicator
          const SizedBox(height: DrenSpacing.lg),
          _ProgressIndicator(
            completed: _countCompleted(),
            total: 5,
          ),
        ],
      ),
    );
  }

  int _countCompleted() {
    if (habits == null) return 0;
    int count = 0;
    if (habits!.lastMealOnTime) count++;
    if (habits!.noCaffeineAfterCutoff) count++;
    if (habits!.roomTempOptimal) count++;
    if (habits!.screenFreeBeforeBed) count++;
    if (habits!.meditationCompleted) count++;
    return count;
  }
}

class _ChecklistItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isChecked;
  final VoidCallback onTap;

  const _ChecklistItem({
    required this.icon,
    required this.label,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          // Checkbox
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isChecked
                  ? DrenColors.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isChecked
                    ? DrenColors.primary
                    : DrenColors.textTertiary,
                width: 2,
              ),
            ),
            child: isChecked
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: DrenColors.background,
                  )
                : null,
          ),
          const SizedBox(width: DrenSpacing.sm),

          // Icon
          Icon(
            icon,
            size: 20,
            color: isChecked
                ? DrenColors.textSecondary
                : DrenColors.textTertiary,
          ),
          const SizedBox(width: DrenSpacing.sm),

          // Label
          Expanded(
            child: Text(
              label,
              style: DrenTypography.body.copyWith(
                color: isChecked
                    ? DrenColors.textSecondary
                    : DrenColors.textPrimary,
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  final int completed;
  final int total;

  const _ProgressIndicator({
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? completed / total : 0.0;
    final isComplete = completed == total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress bar
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: DrenColors.surfaceSecondary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: isComplete ? DrenColors.success : DrenColors.sleepRing,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: DrenSpacing.xs),

        // Label
        Text(
          isComplete
              ? 'All habits completed!'
              : '$completed of $total habits completed',
          style: DrenTypography.caption1.copyWith(
            color: isComplete ? DrenColors.success : DrenColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
