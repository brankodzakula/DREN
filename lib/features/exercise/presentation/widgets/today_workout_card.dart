import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/workout.dart';

/// Card displaying today's scheduled workout
class TodayWorkoutCard extends StatelessWidget {
  final Workout workout;
  final VoidCallback onStartWorkout;

  const TodayWorkoutCard({
    super.key,
    required this.workout,
    required this.onStartWorkout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.lg),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
        border: Border.all(
          color: DrenColors.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(DrenSpacing.xs),
                decoration: BoxDecoration(
                  color: DrenColors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
                ),
                child: const Icon(
                  Icons.fitness_center,
                  color: DrenColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: DrenSpacing.sm),
              Text(
                'Today',
                style: DrenTypography.footnote.copyWith(
                  color: DrenColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: DrenSpacing.md),

          // Workout Name
          Text(
            workout.name,
            style: DrenTypography.title2.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xs),

          // Workout Stats
          Row(
            children: [
              _buildStat(Icons.timer_outlined, '${workout.durationMinutes} min'),
              const SizedBox(width: DrenSpacing.md),
              _buildStat(Icons.local_fire_department_outlined,
                  '~${workout.estimatedCalories} kcal'),
              const SizedBox(width: DrenSpacing.md),
              _buildStat(Icons.speed_outlined, _capitalizeFirst(workout.difficulty)),
            ],
          ),
          const SizedBox(height: DrenSpacing.lg),

          // Start Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onStartWorkout,
              style: ElevatedButton.styleFrom(
                backgroundColor: DrenColors.primary,
                foregroundColor: DrenColors.background,
                padding: const EdgeInsets.symmetric(vertical: DrenSpacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                ),
              ),
              child: Text(
                'Start Workout',
                style: DrenTypography.body.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: DrenSpacing.sm),

          // External app button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // TODO: Open in external fitness app
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: DrenColors.textSecondary,
                side: const BorderSide(color: DrenColors.surfaceSecondary),
                padding: const EdgeInsets.symmetric(vertical: DrenSpacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                ),
              ),
              child: Text(
                'Start in Apple Fitness / Google Fit',
                style: DrenTypography.footnote.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: DrenColors.textSecondary,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: DrenTypography.footnote.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
      ],
    );
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
