import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Health platform permissions request step
class HealthPermissionsStep extends StatelessWidget {
  final bool permissionsGranted;
  final VoidCallback onRequestPermissions;
  final VoidCallback onSkip;

  const HealthPermissionsStep({
    super.key,
    required this.permissionsGranted,
    required this.onRequestPermissions,
    required this.onSkip,
  });

  String get _platformName {
    if (Platform.isIOS || Platform.isMacOS) {
      return 'Apple Health';
    } else {
      return 'Health Connect';
    }
  }

  IconData get _platformIcon {
    if (Platform.isIOS || Platform.isMacOS) {
      return Icons.favorite;
    } else {
      return Icons.monitor_heart_outlined;
    }
  }

  Color get _platformColor {
    if (Platform.isIOS || Platform.isMacOS) {
      return const Color(0xFFFF2D55); // Apple Health red
    } else {
      return const Color(0xFF4285F4); // Google blue
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
      child: Column(
        children: [
          const SizedBox(height: DrenSpacing.xxxl),

          // Platform icon
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: _platformColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
            ),
            child: Icon(
              _platformIcon,
              size: 56,
              color: _platformColor,
            ),
          ),

          const SizedBox(height: DrenSpacing.xl),

          // Title
          Text(
            'Connect to $_platformName',
            style: DrenTypography.title1.copyWith(
              color: DrenColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: DrenSpacing.sm),

          // Description
          Text(
            'Dren reads your health data to personalize your protocol and track your progress.',
            style: DrenTypography.body.copyWith(
              color: DrenColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: DrenSpacing.xxxl),

          // Data we'll access
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(DrenSpacing.lg),
            decoration: BoxDecoration(
              color: DrenColors.surfacePrimary,
              borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data we\'ll access:',
                  style: DrenTypography.headline.copyWith(
                    color: DrenColors.textPrimary,
                  ),
                ),
                const SizedBox(height: DrenSpacing.md),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _DataItem(icon: Icons.directions_run_outlined, label: 'Workouts'),
                          SizedBox(height: DrenSpacing.sm),
                          _DataItem(icon: Icons.directions_walk_outlined, label: 'Steps'),
                          SizedBox(height: DrenSpacing.sm),
                          _DataItem(icon: Icons.local_fire_department_outlined, label: 'Active Energy'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _DataItem(icon: Icons.bedtime_outlined, label: 'Sleep Analysis'),
                          SizedBox(height: DrenSpacing.sm),
                          _DataItem(icon: Icons.favorite_outline, label: 'Heart Rate'),
                          SizedBox(height: DrenSpacing.sm),
                          _DataItem(icon: Icons.restaurant_outlined, label: 'Nutrition'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: DrenSpacing.xxxl),

          // Connection status or button
          if (permissionsGranted)
            Container(
              padding: const EdgeInsets.all(DrenSpacing.md),
              decoration: BoxDecoration(
                color: DrenColors.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                border: Border.all(
                  color: DrenColors.success,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: DrenColors.success,
                    size: 24,
                  ),
                  const SizedBox(width: DrenSpacing.sm),
                  Text(
                    'Connected to $_platformName',
                    style: DrenTypography.headline.copyWith(
                      color: DrenColors.success,
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onRequestPermissions,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _platformColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: DrenSpacing.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_platformIcon, size: 24),
                    const SizedBox(width: DrenSpacing.sm),
                    Text(
                      'Connect $_platformName',
                      style: DrenTypography.headline.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          const SizedBox(height: DrenSpacing.md),

          // Skip button
          if (!permissionsGranted)
            TextButton(
              onPressed: onSkip,
              child: Text(
                'Skip for Now',
                style: DrenTypography.body.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
            ),

          const SizedBox(height: DrenSpacing.lg),

          // Privacy note
          Text(
            'Your health data never leaves your device.',
            style: DrenTypography.caption1.copyWith(
              color: DrenColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: DrenSpacing.xl),
        ],
      ),
    );
  }
}

class _DataItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DataItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: DrenColors.textSecondary,
          size: 18,
        ),
        const SizedBox(width: DrenSpacing.xs),
        Text(
          label,
          style: DrenTypography.body.copyWith(
            color: DrenColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
