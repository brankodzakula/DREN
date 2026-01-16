import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';

/// Welcome screen - first step of onboarding
class WelcomeStep extends StatelessWidget {
  final VoidCallback onGetStarted;

  const WelcomeStep({
    super.key,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
      child: Column(
        children: [
          const Spacer(flex: 2),

          // Logo placeholder
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: DrenColors.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Text(
                'D',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: DrenColors.background,
                ),
              ),
            ),
          ),

          const SizedBox(height: DrenSpacing.xl),

          // Title
          Text(
            'DREN',
            style: DrenTypography.largeTitle.copyWith(
              color: DrenColors.primary,
              letterSpacing: 8,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Subtitle
          Text(
            'THE LONGEVITY PROTOCOL',
            style: DrenTypography.subheadline.copyWith(
              color: DrenColors.textSecondary,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: DrenSpacing.xxxl),

          // Description
          Text(
            'Personalized daily protocols for\nDiet, Exercise, and Sleep',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),

          const Spacer(flex: 2),

          // Features list
          const _FeatureItem(
            icon: Icons.restaurant_outlined,
            color: DrenColors.caloriesInRing,
            text: 'Optimized nutrition with caloric targets',
          ),
          const SizedBox(height: DrenSpacing.md),
          const _FeatureItem(
            icon: Icons.fitness_center_outlined,
            color: DrenColors.exerciseRing,
            text: 'Personalized workout routines',
          ),
          const SizedBox(height: DrenSpacing.md),
          const _FeatureItem(
            icon: Icons.bedtime_outlined,
            color: DrenColors.sleepRing,
            text: 'Science-backed sleep optimization',
          ),

          const Spacer(flex: 3),

          // Get Started button
          PrimaryButton(
            label: 'Get Started',
            onPressed: onGetStarted,
          ),

          const SizedBox(height: DrenSpacing.xl),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _FeatureItem({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: color,
            size: 22,
          ),
        ),
        const SizedBox(width: DrenSpacing.md),
        Expanded(
          child: Text(
            text,
            style: DrenTypography.body.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
