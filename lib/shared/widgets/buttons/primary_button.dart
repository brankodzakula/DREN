import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/typography.dart';
import '../../../core/theme/spacing.dart';

/// Primary action button with loading state
/// Background: #B4FF00 (Neon Lime)
/// Text: Black
/// Height: 50pt
/// Corner Radius: 12pt
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final IconData? icon;
  final double? width;

  const PrimaryButton({
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
      child: ElevatedButton(
        onPressed: effectiveEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveEnabled
              ? DrenColors.primary
              : DrenColors.primary.withValues(alpha: 0.5),
          foregroundColor: DrenColors.background,
          disabledBackgroundColor: DrenColors.primary.withValues(alpha: 0.5),
          disabledForegroundColor: DrenColors.background.withValues(alpha: 0.5),
          elevation: 0,
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
                      AlwaysStoppedAnimation<Color>(DrenColors.background),
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
                    style: DrenTypography.buttonText,
                  ),
                ],
              ),
      ),
    );
  }
}
