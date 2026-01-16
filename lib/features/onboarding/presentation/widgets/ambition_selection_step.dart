import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/onboarding_data.dart';

/// Ambition selection step - moderate vs aggressive protocol
class AmbitionSelectionStep extends StatelessWidget {
  final String? selectedAmbition;
  final ValueChanged<String> onAmbitionSelected;

  const AmbitionSelectionStep({
    super.key,
    required this.selectedAmbition,
    required this.onAmbitionSelected,
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
            'Choose Your Protocol',
            style: DrenTypography.title1.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Description
          Text(
            'Select the intensity level that matches your commitment and lifestyle.',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),

          const SizedBox(height: DrenSpacing.xxxl),

          // Moderate option
          _AmbitionCard(
            ambition: LongevityAmbition.moderate,
            title: 'MODERATE',
            icon: Icons.eco_outlined,
            iconColor: DrenColors.success,
            features: const [
              '6% caloric deficit',
              '45-60 min exercise/day',
              'Sustainable, lower friction',
            ],
            bestFor: 'Building habits, beginners',
            isSelected: selectedAmbition == LongevityAmbition.moderate,
            onTap: () => onAmbitionSelected(LongevityAmbition.moderate),
          ),

          const SizedBox(height: DrenSpacing.md),

          // Aggressive option
          _AmbitionCard(
            ambition: LongevityAmbition.aggressive,
            title: 'AGGRESSIVE',
            subtitle: 'Blueprint-Aligned',
            icon: Icons.local_fire_department_outlined,
            iconColor: DrenColors.error,
            features: const [
              '12% caloric deficit',
              '60-90 min exercise/day',
              'Maximum longevity optimization',
            ],
            bestFor: 'Committed biohackers',
            isSelected: selectedAmbition == LongevityAmbition.aggressive,
            onTap: () => onAmbitionSelected(LongevityAmbition.aggressive),
          ),

          const SizedBox(height: DrenSpacing.xl),

          // Note
          Container(
            padding: const EdgeInsets.all(DrenSpacing.md),
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.swap_horiz,
                  color: DrenColors.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: DrenSpacing.sm),
                Expanded(
                  child: Text(
                    'You can change your protocol intensity anytime in settings.',
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

class _AmbitionCard extends StatelessWidget {
  final String ambition;
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;
  final List<String> features;
  final String bestFor;
  final bool isSelected;
  final VoidCallback onTap;

  const _AmbitionCard({
    required this.ambition,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.features,
    required this.bestFor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(DrenSpacing.lg),
        decoration: BoxDecoration(
          color: DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
          border: Border.all(
            color: isSelected ? DrenColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 32,
                ),
                const SizedBox(width: DrenSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: DrenTypography.headline.copyWith(
                          color: isSelected
                              ? DrenColors.primary
                              : DrenColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: DrenTypography.caption1.copyWith(
                            color: iconColor,
                          ),
                        ),
                    ],
                  ),
                ),
                if (isSelected)
                  Container(
                    padding: const EdgeInsets.all(DrenSpacing.xs),
                    decoration: BoxDecoration(
                      color: DrenColors.primary,
                      borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: DrenColors.background,
                      size: 16,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: DrenSpacing.md),

            // Features
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: DrenSpacing.xs),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: isSelected
                            ? DrenColors.primary
                            : DrenColors.textSecondary,
                        size: 16,
                      ),
                      const SizedBox(width: DrenSpacing.xs),
                      Text(
                        feature,
                        style: DrenTypography.body.copyWith(
                          color: DrenColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                )),

            const SizedBox(height: DrenSpacing.sm),

            // Best for
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DrenSpacing.sm,
                vertical: DrenSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? DrenColors.primary.withValues(alpha: 0.1)
                    : DrenColors.surfaceSecondary,
                borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
              ),
              child: Text(
                'Best for: $bestFor',
                style: DrenTypography.caption1.copyWith(
                  color: isSelected ? DrenColors.primary : DrenColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
