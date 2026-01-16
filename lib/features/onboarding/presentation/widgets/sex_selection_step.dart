import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/onboarding_data.dart';

/// Biological sex selection step
class SexSelectionStep extends StatelessWidget {
  final String? selectedSex;
  final ValueChanged<String> onSexSelected;

  const SexSelectionStep({
    super.key,
    required this.selectedSex,
    required this.onSexSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: DrenSpacing.xl),

          // Title
          Text(
            'What is your biological sex?',
            style: DrenTypography.title1.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Description
          Text(
            'This helps us accurately calculate your basal metabolic rate and tailor recommendations',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),

          const SizedBox(height: DrenSpacing.xxxl),

          // Sex selection cards
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SexCard(
                  sex: Sex.male,
                  label: 'Male',
                  icon: Icons.male,
                  isSelected: selectedSex == Sex.male,
                  onTap: () => onSexSelected(Sex.male),
                ),
                const SizedBox(height: DrenSpacing.md),
                _SexCard(
                  sex: Sex.female,
                  label: 'Female',
                  icon: Icons.female,
                  isSelected: selectedSex == Sex.female,
                  onTap: () => onSexSelected(Sex.female),
                ),
              ],
            ),
          ),

          // Info note
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
                  color: DrenColors.textTertiary,
                  size: 20,
                ),
                const SizedBox(width: DrenSpacing.sm),
                Expanded(
                  child: Text(
                    'We use biological sex for accurate BMR calculations. Your gender identity is respected.',
                    style: DrenTypography.caption1.copyWith(
                      color: DrenColors.textTertiary,
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

class _SexCard extends StatelessWidget {
  final String sex;
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SexCard({
    required this.sex,
    required this.label,
    required this.icon,
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
          color: isSelected
              ? DrenColors.primary.withValues(alpha: 0.1)
              : DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
          border: Border.all(
            color: isSelected ? DrenColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected
                    ? DrenColors.primary.withValues(alpha: 0.2)
                    : DrenColors.surfaceSecondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? DrenColors.primary : DrenColors.textSecondary,
                size: 32,
              ),
            ),
            const SizedBox(width: DrenSpacing.lg),
            Expanded(
              child: Text(
                label,
                style: DrenTypography.title2.copyWith(
                  color: isSelected ? DrenColors.primary : DrenColors.textPrimary,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: DrenColors.primary,
                size: 28,
              ),
          ],
        ),
      ),
    );
  }
}
