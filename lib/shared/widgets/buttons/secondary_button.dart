import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/spacing.dart';

/// Secondary action button (outlined variant)
/// Border: #B4FF00 (Neon Lime)
/// Text: #B4FF00 (Neon Lime)
/// Background: Transparent
/// Height: 50pt
/// Corner Radius: 12pt
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final IconData? icon;
  final double? width;

  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveEnabled = isEnabled && !isLoading && onPressed != null;

    return SizedBox(
      width: width ?? double.infinity,
      height: DrenSpacing.buttonHeight,
      child: OutlinedButton(
        onPressed: effectiveEnabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: effectiveEnabled
              ? DrenColors.primary
              : DrenColors.primary.withValues(alpha: 0.5),
          side: BorderSide(
            color: effectiveEnabled
                ? DrenColors.primary
                : DrenColors.primary.withValues(alpha: 0.5),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          ),
          padding: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(DrenColors.primary),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: DrenSpacing.xs),
                  ],
                  Text(
                    label,
                    style: DrenTypography.buttonText.copyWith(
                      color: effectiveEnabled
                          ? DrenColors.primary
                          : DrenColors.primary.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Text button variant for tertiary actions
class TertiaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const TertiaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: DrenColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: DrenSpacing.md,
          vertical: DrenSpacing.sm,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18),
            const SizedBox(width: DrenSpacing.xs),
          ],
          Text(
            label,
            style: DrenTypography.buttonText.copyWith(
              color: DrenColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
