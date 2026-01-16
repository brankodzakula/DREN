import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/spacing.dart';

/// Standard protocol card component
/// Background: #1C1C1E (surfacePrimary)
/// Corner Radius: 16pt
/// Padding: 16pt all sides
class ProtocolCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? borderRadius;

  const ProtocolCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding ?? const EdgeInsets.all(DrenSpacing.cardPadding),
      decoration: BoxDecoration(
        color: backgroundColor ?? DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(
          borderRadius ?? DrenSpacing.radiusLg,
        ),
      ),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }

    return card;
  }
}

/// Protocol card with icon, title, subtitle, and optional trailing widget
class ProtocolSummaryCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProtocolSummaryCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ProtocolCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: DrenSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: DrenTypography.headline,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: DrenTypography.footnote,
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
          if (onTap != null && trailing == null)
            const Icon(
              Icons.chevron_right,
              color: DrenColors.textSecondary,
            ),
        ],
      ),
    );
  }
}

/// Workout card with green background
class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final String calories;
  final VoidCallback? onTap;
  final VoidCallback? onStartPressed;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.calories,
    this.onTap,
    this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DrenSpacing.cardPadding),
        decoration: BoxDecoration(
          color: DrenColors.workoutCardGreen,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusXl),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: DrenTypography.title3,
                      ),
                      const SizedBox(height: DrenSpacing.xxs),
                      Text(
                        subtitle,
                        style: DrenTypography.footnote,
                      ),
                    ],
                  ),
                ),
                if (onStartPressed != null)
                  GestureDetector(
                    onTap: onStartPressed,
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
              ],
            ),
            const SizedBox(height: DrenSpacing.sm),
            Row(
              children: [
                _buildPill(duration),
                const SizedBox(width: DrenSpacing.xs),
                _buildPill(calories),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DrenSpacing.sm,
        vertical: DrenSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: DrenColors.workoutCardDarkGreen,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusFull),
      ),
      child: Text(
        text,
        style: DrenTypography.caption1.copyWith(
          color: DrenColors.textPrimary,
        ),
      ),
    );
  }
}

/// Recipe/Quick Log Card
class RecipeCard extends StatelessWidget {
  final String name;
  final String calories;
  final String? imageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onLogPressed;

  const RecipeCard({
    super.key,
    required this.name,
    required this.calories,
    this.imageUrl,
    this.onTap,
    this.onLogPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: DrenColors.surfacePrimary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: DrenColors.surfaceSecondary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(DrenSpacing.radiusMd),
                ),
              ),
              child: imageUrl != null
                  ? ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(DrenSpacing.radiusMd),
                      ),
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(
                            Icons.restaurant,
                            color: DrenColors.textSecondary,
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: Icon(
                        Icons.restaurant,
                        color: DrenColors.textSecondary,
                        size: 32,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(DrenSpacing.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: DrenTypography.subheadline.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    calories,
                    style: DrenTypography.caption1,
                  ),
                  if (onLogPressed != null) ...[
                    const SizedBox(height: DrenSpacing.xs),
                    GestureDetector(
                      onTap: onLogPressed,
                      child: Container(
                        height: 28,
                        decoration: BoxDecoration(
                          color: DrenColors.primary,
                          borderRadius:
                              BorderRadius.circular(DrenSpacing.radiusSm),
                        ),
                        child: Center(
                          child: Text(
                            '+ Log',
                            style: DrenTypography.caption1.copyWith(
                              color: DrenColors.background,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
