import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Dashboard widget showing calories progress bar and macro rings
class NutritionDashboard extends StatelessWidget {
  final int caloriesConsumed;
  final int caloriesTarget;
  final double proteinConsumed;
  final double proteinTarget;
  final double carbsConsumed;
  final double carbsTarget;
  final double fatConsumed;
  final double fatTarget;

  const NutritionDashboard({
    super.key,
    required this.caloriesConsumed,
    required this.caloriesTarget,
    required this.proteinConsumed,
    required this.proteinTarget,
    required this.carbsConsumed,
    required this.carbsTarget,
    required this.fatConsumed,
    required this.fatTarget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Calories Progress
          _CaloriesProgress(
            consumed: caloriesConsumed,
            target: caloriesTarget,
          ),
          const SizedBox(height: DrenSpacing.md),

          // Macros Row
          Row(
            children: [
              Expanded(
                child: _MacroRing(
                  label: 'Protein',
                  consumed: proteinConsumed,
                  target: proteinTarget,
                  color: DrenColors.proteinColor,
                  unit: 'g',
                ),
              ),
              Expanded(
                child: _MacroRing(
                  label: 'Carbs',
                  consumed: carbsConsumed,
                  target: carbsTarget,
                  color: DrenColors.carbsColor,
                  unit: 'g',
                ),
              ),
              Expanded(
                child: _MacroRing(
                  label: 'Fat',
                  consumed: fatConsumed,
                  target: fatTarget,
                  color: DrenColors.fatColor,
                  unit: 'g',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Calories progress bar with text
class _CaloriesProgress extends StatelessWidget {
  final int consumed;
  final int target;

  const _CaloriesProgress({
    required this.consumed,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    final progress = target > 0 ? (consumed / target).clamp(0.0, 1.0) : 0.0;
    final remaining = target - consumed;
    final percentage = (progress * 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Calories',
              style: DrenTypography.headline.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),
            Text(
              '$percentage%',
              style: DrenTypography.headline.copyWith(
                color: DrenColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: DrenSpacing.xs),

        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: DrenColors.surfaceTertiary,
            valueColor: AlwaysStoppedAnimation<Color>(
              consumed > target ? DrenColors.warning : DrenColors.caloriesInRing,
            ),
          ),
        ),
        const SizedBox(height: DrenSpacing.xs),

        // Stats row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$consumed',
                    style: DrenTypography.title3.copyWith(
                      color: DrenColors.textPrimary,
                    ),
                  ),
                  TextSpan(
                    text: ' / $target kcal',
                    style: DrenTypography.body.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              remaining >= 0 ? '$remaining left' : '${-remaining} over',
              style: DrenTypography.footnote.copyWith(
                color: remaining >= 0 ? DrenColors.textSecondary : DrenColors.warning,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Individual macro ring widget
class _MacroRing extends StatelessWidget {
  final String label;
  final double consumed;
  final double target;
  final Color color;
  final String unit;

  const _MacroRing({
    required this.label,
    required this.consumed,
    required this.target,
    required this.color,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final progress = target > 0 ? (consumed / target).clamp(0.0, 1.0) : 0.0;

    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background ring
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: 6,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    DrenColors.surfaceTertiary,
                  ),
                ),
              ),
              // Progress ring
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 6,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              // Center text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${consumed.round()}',
                    style: DrenTypography.headline.copyWith(
                      color: DrenColors.textPrimary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: DrenSpacing.xs),
        Text(
          label,
          style: DrenTypography.caption1.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
        Text(
          '${consumed.round()}/${target.round()}$unit',
          style: DrenTypography.caption2.copyWith(
            color: DrenColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
