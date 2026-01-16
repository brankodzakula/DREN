import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../../../shared/widgets/rings/four_rings_widget.dart';
import '../../domain/entities/ring_summary.dart' as domain;

/// Card displaying the four protocol rings with labels
class ProtocolRingsCard extends StatelessWidget {
  final domain.RingSummary rings;

  const ProtocolRingsCard({
    super.key,
    required this.rings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Protocol Rings',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.md),
          FourRingsWithLabels(
            caloriesIn: _toWidgetRingData(rings.caloriesIn),
            caloriesOut: _toWidgetRingData(rings.caloriesOut),
            exercise: _toWidgetRingData(rings.exercise),
            sleep: _toSleepRingData(rings.sleep),
            ringSize: 160,
          ),
        ],
      ),
    );
  }

  RingData _toWidgetRingData(domain.RingData data) {
    return RingData(
      current: data.current.toDouble(),
      target: data.target.toDouble(),
      label: data.label,
      unit: data.unit.toUpperCase(),
    );
  }

  /// Convert sleep from minutes to hours for display
  RingData _toSleepRingData(domain.RingData data) {
    final currentHours = data.current / 60;
    final targetHours = data.target / 60;
    return RingData(
      current: currentHours,
      target: targetHours,
      label: data.label,
      unit: 'HRS',
    );
  }
}

/// Alternative compact version of rings card
class ProtocolRingsCardCompact extends StatelessWidget {
  final domain.RingSummary rings;

  const ProtocolRingsCardCompact({
    super.key,
    required this.rings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Rings
          SizedBox(
            width: 120,
            height: 120,
            child: FourRingsWidget(
              caloriesIn: RingData(
                current: rings.caloriesIn.current.toDouble(),
                target: rings.caloriesIn.target.toDouble(),
                label: 'Cal In',
                unit: 'kcal',
              ),
              caloriesOut: RingData(
                current: rings.caloriesOut.current.toDouble(),
                target: rings.caloriesOut.target.toDouble(),
                label: 'Cal Out',
                unit: 'kcal',
              ),
              exercise: RingData(
                current: rings.exercise.current.toDouble(),
                target: rings.exercise.target.toDouble(),
                label: 'Exercise',
                unit: 'min',
              ),
              sleep: RingData(
                current: rings.sleep.current.toDouble(),
                target: rings.sleep.target.toDouble(),
                label: 'Sleep',
                unit: 'min',
              ),
              size: 120,
            ),
          ),
          const SizedBox(width: DrenSpacing.md),
          // Progress percentage
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${(rings.overallProgress * 100).toInt()}%',
                  style: DrenTypography.largeTitle.copyWith(
                    color: DrenColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Daily Progress',
                  style: DrenTypography.caption1.copyWith(
                    color: DrenColors.textSecondary,
                  ),
                ),
                const SizedBox(height: DrenSpacing.sm),
                Text(
                  '${rings.completedRings}/4 rings complete',
                  style: DrenTypography.subheadline.copyWith(
                    color: DrenColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
