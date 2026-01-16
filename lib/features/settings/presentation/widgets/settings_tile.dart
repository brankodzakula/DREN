import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? titleColor;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.value,
    this.trailing,
    this.onTap,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DrenSpacing.md,
            vertical: DrenSpacing.sm,
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: DrenColors.surfaceSecondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: titleColor ?? DrenColors.textSecondary,
                ),
              ),
              const SizedBox(width: DrenSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: DrenTypography.body.copyWith(
                        color: titleColor ?? DrenColors.textPrimary,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: DrenTypography.footnote.copyWith(
                          color: DrenColors.textTertiary,
                        ),
                      ),
                  ],
                ),
              ),
              if (value != null)
                Text(
                  value!,
                  style: DrenTypography.body.copyWith(
                    color: DrenColors.textSecondary,
                  ),
                ),
              if (trailing != null) trailing!,
              if (onTap != null && trailing == null && value == null)
                const Icon(
                  Icons.chevron_right,
                  color: DrenColors.textTertiary,
                  size: 20,
                ),
              if (onTap != null && value != null)
                const Padding(
                  padding: EdgeInsets.only(left: DrenSpacing.xs),
                  child: Icon(
                    Icons.chevron_right,
                    color: DrenColors.textTertiary,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
