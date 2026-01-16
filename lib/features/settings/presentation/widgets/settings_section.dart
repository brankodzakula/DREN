import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DrenSpacing.md,
            vertical: DrenSpacing.sm,
          ),
          child: Text(
            title.toUpperCase(),
            style: DrenTypography.caption1.copyWith(
              color: DrenColors.textSecondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: DrenSpacing.md),
          decoration: BoxDecoration(
            color: DrenColors.surfacePrimary,
            borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          ),
          child: Column(
            children: _buildChildrenWithDividers(),
          ),
        ),
        const SizedBox(height: DrenSpacing.md),
      ],
    );
  }

  List<Widget> _buildChildrenWithDividers() {
    final result = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i < children.length - 1) {
        result.add(const Padding(
          padding: EdgeInsets.only(left: 56),
          child: Divider(
            height: 1,
            color: DrenColors.surfaceSecondary,
          ),
        ));
      }
    }
    return result;
  }
}
