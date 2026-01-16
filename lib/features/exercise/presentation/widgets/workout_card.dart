import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/workout.dart';

/// Card for displaying a workout in the library grid
class WorkoutCard extends StatelessWidget {
  final Workout workout;
  final VoidCallback? onTap;
  final VoidCallback? onStart;

  const WorkoutCard({
    super.key,
    required this.workout,
    this.onTap,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _getCategoryColor(workout.category),
          borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
        ),
        child: Stack(
          children: [
            // Content
            Padding(
              padding: const EdgeInsets.all(DrenSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DrenSpacing.sm,
                      vertical: DrenSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
                    ),
                    child: Text(
                      _getCategoryLabel(workout.category),
                      style: DrenTypography.caption1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),

                  // Workout Name
                  Text(
                    workout.name,
                    style: DrenTypography.headline.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: DrenSpacing.xs),

                  // Stats Row
                  Row(
                    children: [
                      Text(
                        '${workout.durationMinutes} min',
                        style: DrenTypography.caption1.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(width: DrenSpacing.sm),
                      Text(
                        '•',
                        style: DrenTypography.caption1.copyWith(
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(width: DrenSpacing.sm),
                      Text(
                        _capitalizeFirst(workout.difficulty),
                        style: DrenTypography.caption1.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Play Button
            Positioned(
              right: DrenSpacing.sm,
              bottom: DrenSpacing.sm,
              child: GestureDetector(
                onTap: onStart,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: DrenColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: DrenColors.background,
                    size: 28,
                  ),
                ),
              ),
            ),

            // Equipment indicator
            if (workout.equipmentRequired.isNotEmpty)
              Positioned(
                top: DrenSpacing.sm,
                right: DrenSpacing.sm,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getEquipmentIcon(workout.equipmentRequired),
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'strength':
        return const Color(0xFF1C3D1C); // Dark green
      case 'hiit':
        return const Color(0xFF3D1C1C); // Dark red
      case 'yoga':
        return const Color(0xFF1C1C3D); // Dark blue
      case 'core':
        return const Color(0xFF3D3D1C); // Dark yellow
      case 'running':
        return const Color(0xFF1C3D3D); // Dark cyan
      case 'cycling':
        return const Color(0xFF3D1C3D); // Dark purple
      case 'swimming':
        return const Color(0xFF1C2D3D); // Dark ocean
      default:
        return DrenColors.surfaceSecondary;
    }
  }

  String _getCategoryLabel(String category) {
    return category.toUpperCase();
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  IconData _getEquipmentIcon(List<String> equipment) {
    if (equipment.contains('dumbbells')) return Icons.fitness_center;
    if (equipment.contains('kettlebell')) return Icons.fitness_center;
    if (equipment.contains('resistance_bands')) return Icons.linear_scale;
    if (equipment.contains('pull_up_bar')) return Icons.horizontal_rule;
    return Icons.construction;
  }
}
