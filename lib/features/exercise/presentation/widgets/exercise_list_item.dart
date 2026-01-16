import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/exercise.dart';

/// List item for displaying an exercise in a workout
class ExerciseListItem extends StatelessWidget {
  final Exercise exercise;
  final int index;
  final VoidCallback? onSwap;
  final bool showSwap;

  const ExerciseListItem({
    super.key,
    required this.exercise,
    required this.index,
    this.onSwap,
    this.showSwap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: DrenSpacing.sm),
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
      ),
      child: Row(
        children: [
          // Index number
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: DrenColors.surfaceSecondary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
            ),
            child: Center(
              child: Text(
                '$index',
                style: DrenTypography.footnote.copyWith(
                  color: DrenColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: DrenSpacing.md),

          // Exercise info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: DrenTypography.body.copyWith(
                    color: DrenColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _getMuscleGroupLabel(exercise.muscleGroup),
                  style: DrenTypography.caption1.copyWith(
                    color: DrenColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Sets x Reps
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _getSetsRepsLabel(),
                style: DrenTypography.subheadline.copyWith(
                  color: DrenColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (exercise.restSeconds > 0)
                Text(
                  '${exercise.restSeconds}s rest',
                  style: DrenTypography.caption1.copyWith(
                    color: DrenColors.textTertiary,
                  ),
                ),
            ],
          ),

          // Swap button
          if (showSwap && onSwap != null) ...[
            const SizedBox(width: DrenSpacing.sm),
            IconButton(
              onPressed: onSwap,
              icon: const Icon(
                Icons.swap_horiz,
                color: DrenColors.textSecondary,
              ),
              tooltip: 'Swap exercise',
              visualDensity: VisualDensity.compact,
            ),
          ],
        ],
      ),
    );
  }

  String _getSetsRepsLabel() {
    if (exercise.reps > 0) {
      return '${exercise.sets} × ${exercise.reps}';
    } else if (exercise.durationSeconds != null && exercise.durationSeconds! > 0) {
      return '${exercise.sets} × ${exercise.durationSeconds}s';
    }
    return '${exercise.sets} sets';
  }

  String _getMuscleGroupLabel(String muscleGroup) {
    switch (muscleGroup.toLowerCase()) {
      case 'chest':
        return 'Chest, Shoulders, Triceps';
      case 'back':
        return 'Back, Biceps';
      case 'shoulders':
        return 'Shoulders, Triceps';
      case 'arms':
        return 'Arms, Triceps';
      case 'legs':
        return 'Legs, Glutes';
      case 'core':
        return 'Core, Abs';
      case 'full_body':
        return 'Full Body';
      default:
        return _capitalizeFirst(muscleGroup);
    }
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).replaceAll('_', ' ');
  }
}
