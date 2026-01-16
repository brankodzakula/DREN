import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Base card for protocol summary items
class _ProtocolSummaryCardBase extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? content;
  final VoidCallback? onTap;

  const _ProtocolSummaryCardBase({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.trailing,
    this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DrenSpacing.md),
        decoration: BoxDecoration(
          color: DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: DrenSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: DrenTypography.headline.copyWith(
                          color: DrenColors.textPrimary,
                          fontSize: 16,
                        ),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: DrenTypography.caption1.copyWith(
                            color: DrenColors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
                if (trailing != null) trailing!,
                if (onTap != null)
                  const Icon(
                    Icons.chevron_right,
                    color: DrenColors.textTertiary,
                  ),
              ],
            ),
            if (content != null) ...[
              const SizedBox(height: DrenSpacing.sm),
              content!,
            ],
          ],
        ),
      ),
    );
  }
}

/// Card showing meals summary
class MealsSummaryCard extends StatelessWidget {
  final int caloriesRemaining;
  final int proteinRemaining;
  final int mealsLogged;

  const MealsSummaryCard({
    super.key,
    required this.caloriesRemaining,
    required this.proteinRemaining,
    this.mealsLogged = 0,
  });

  @override
  Widget build(BuildContext context) {
    final mealsRemainingText = caloriesRemaining > 0
        ? 'Meals Remaining: ${_estimateMealsRemaining()}'
        : 'Calorie target reached';

    return _ProtocolSummaryCardBase(
      icon: Icons.restaurant,
      iconColor: DrenColors.caloriesInRing,
      title: mealsRemainingText,
      subtitle: caloriesRemaining > 0
          ? '$caloriesRemaining kcal \u2022 ${proteinRemaining}g protein to go'
          : 'Great job!',
      content: caloriesRemaining > 200
          ? Text(
              'Suggested: Super Veggie (380 kcal)',
              style: DrenTypography.caption1.copyWith(
                color: DrenColors.textSecondary,
              ),
            )
          : null,
      onTap: () {
        // Navigate to diet tab
      },
    );
  }

  int _estimateMealsRemaining() {
    if (caloriesRemaining <= 0) return 0;
    if (caloriesRemaining < 400) return 1;
    if (caloriesRemaining < 800) return 2;
    return 3;
  }
}

/// Card showing workout summary
class WorkoutSummaryCard extends StatelessWidget {
  final String workoutType;
  final int durationMinutes;
  final int estimatedCalories;
  final bool isCompleted;
  final int minutesCompleted;

  const WorkoutSummaryCard({
    super.key,
    required this.workoutType,
    required this.durationMinutes,
    required this.estimatedCalories,
    this.isCompleted = false,
    this.minutesCompleted = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isRestDay = workoutType.toLowerCase() == 'rest' ||
        workoutType.toLowerCase() == 'rest day';

    return Container(
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: isRestDay
            ? DrenColors.surfacePrimary
            : DrenColors.workoutCardGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: DrenColors.exerciseRing.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isRestDay ? Icons.self_improvement : Icons.fitness_center,
                  color: DrenColors.exerciseRing,
                  size: 20,
                ),
              ),
              const SizedBox(width: DrenSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isRestDay ? 'Rest Day' : 'Today: $workoutType',
                      style: DrenTypography.headline.copyWith(
                        color: DrenColors.textPrimary,
                        fontSize: 16,
                      ),
                    ),
                    if (!isRestDay)
                      Text(
                        '$durationMinutes min \u2022 ~$estimatedCalories kcal',
                        style: DrenTypography.caption1.copyWith(
                          color: DrenColors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DrenSpacing.sm,
                    vertical: DrenSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: DrenColors.success.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: DrenColors.success,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Done',
                        style: DrenTypography.caption1.copyWith(
                          color: DrenColors.success,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              const Icon(
                Icons.chevron_right,
                color: DrenColors.textTertiary,
              ),
            ],
          ),
          if (!isRestDay && !isCompleted) ...[
            const SizedBox(height: DrenSpacing.md),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Start workout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: DrenColors.primary,
                  foregroundColor: DrenColors.background,
                  padding: const EdgeInsets.symmetric(vertical: DrenSpacing.sm),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Start Workout',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Card showing sleep summary
class SleepSummaryCard extends StatelessWidget {
  final TimeOfDay? targetBedtime;
  final TimeOfDay? windDownStart;
  final int sleepMinutesLastNight;

  const SleepSummaryCard({
    super.key,
    this.targetBedtime,
    this.windDownStart,
    this.sleepMinutesLastNight = 0,
  });

  @override
  Widget build(BuildContext context) {
    final windDownText = _getWindDownText();

    return _ProtocolSummaryCardBase(
      icon: Icons.bedtime,
      iconColor: DrenColors.sleepRing,
      title: windDownText,
      subtitle: targetBedtime != null
          ? 'Target bedtime: ${_formatTime(targetBedtime!)}'
          : 'Set your sleep schedule',
      content: sleepMinutesLastNight > 0
          ? _buildLastNightSummary()
          : null,
      onTap: () {
        // Navigate to sleep tab
      },
    );
  }

  String _getWindDownText() {
    if (windDownStart == null) return 'Sleep Schedule';

    final now = TimeOfDay.now();
    final nowMinutes = now.hour * 60 + now.minute;
    final windDownMinutes = windDownStart!.hour * 60 + windDownStart!.minute;

    var diff = windDownMinutes - nowMinutes;
    if (diff < 0) diff += 24 * 60; // Next day

    if (diff <= 0) {
      return 'Wind-Down Time!';
    } else if (diff < 60) {
      return 'Wind-Down in ${diff}m';
    } else {
      final hours = diff ~/ 60;
      final mins = diff % 60;
      return 'Wind-Down in ${hours}h ${mins}m';
    }
  }

  Widget _buildLastNightSummary() {
    final hours = sleepMinutesLastNight ~/ 60;
    final mins = sleepMinutesLastNight % 60;
    return Row(
      children: [
        Icon(
          Icons.nights_stay,
          color: DrenColors.sleepRing.withValues(alpha: 0.7),
          size: 16,
        ),
        const SizedBox(width: DrenSpacing.xs),
        Text(
          'Last night: ${hours}h ${mins}m',
          style: DrenTypography.caption1.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
      ],
    );
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
