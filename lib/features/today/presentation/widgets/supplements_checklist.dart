import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';

/// Default supplements based on Blueprint protocol
class _Supplement {
  final String name;
  final String dosage;
  final String timing;
  final bool isCoreTier;

  const _Supplement({
    required this.name,
    required this.dosage,
    required this.timing,
    this.isCoreTier = true,
  });
}

const _defaultSupplements = [
  _Supplement(name: 'Vitamin D3', dosage: '2000 IU', timing: 'morning'),
  _Supplement(name: 'Omega-3', dosage: '1000mg', timing: 'morning'),
  _Supplement(name: 'Magnesium', dosage: '400mg', timing: 'evening'),
  _Supplement(name: 'Vitamin K2', dosage: '100mcg', timing: 'morning'),
];

/// Widget showing supplements checklist for the day
class SupplementsChecklist extends StatefulWidget {
  const SupplementsChecklist({super.key});

  @override
  State<SupplementsChecklist> createState() => _SupplementsChecklistState();
}

class _SupplementsChecklistState extends State<SupplementsChecklist> {
  final Map<String, bool> _checkedSupplements = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DrenSpacing.md),
      decoration: BoxDecoration(
        color: DrenColors.surfacePrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Wrap(
        spacing: DrenSpacing.sm,
        runSpacing: DrenSpacing.sm,
        children: _defaultSupplements.map((supplement) {
          final isChecked = _checkedSupplements[supplement.name] ?? false;
          return _SupplementChip(
            name: supplement.name,
            dosage: supplement.dosage,
            isChecked: isChecked,
            onTap: () {
              setState(() {
                _checkedSupplements[supplement.name] = !isChecked;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class _SupplementChip extends StatelessWidget {
  final String name;
  final String dosage;
  final bool isChecked;
  final VoidCallback onTap;

  const _SupplementChip({
    required this.name,
    required this.dosage,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: DrenSpacing.sm,
          vertical: DrenSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: isChecked
              ? DrenColors.primary.withValues(alpha: 0.2)
              : DrenColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isChecked ? DrenColors.primary : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isChecked ? Icons.check_circle : Icons.circle_outlined,
              size: 18,
              color: isChecked ? DrenColors.primary : DrenColors.textSecondary,
            ),
            const SizedBox(width: DrenSpacing.xs),
            Text(
              '$name ($dosage)',
              style: DrenTypography.caption1.copyWith(
                color: isChecked ? DrenColors.primary : DrenColors.textPrimary,
                fontWeight: isChecked ? FontWeight.w600 : FontWeight.normal,
                decoration:
                    isChecked ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Expanded supplements list view
class SupplementsListView extends StatefulWidget {
  final List<SupplementItem> supplements;
  final Function(String id, bool checked)? onSupplementChecked;

  const SupplementsListView({
    super.key,
    required this.supplements,
    this.onSupplementChecked,
  });

  @override
  State<SupplementsListView> createState() => _SupplementsListViewState();
}

class _SupplementsListViewState extends State<SupplementsListView> {
  final Map<String, bool> _checkedState = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.supplements.map((supplement) {
        final isChecked = _checkedState[supplement.id] ?? supplement.isChecked;
        return _SupplementListItem(
          supplement: supplement,
          isChecked: isChecked,
          onTap: () {
            setState(() {
              _checkedState[supplement.id] = !isChecked;
            });
            widget.onSupplementChecked?.call(supplement.id, !isChecked);
          },
        );
      }).toList(),
    );
  }
}

class _SupplementListItem extends StatelessWidget {
  final SupplementItem supplement;
  final bool isChecked;
  final VoidCallback onTap;

  const _SupplementListItem({
    required this.supplement,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        isChecked ? Icons.check_circle : Icons.circle_outlined,
        color: isChecked ? DrenColors.success : DrenColors.textSecondary,
      ),
      title: Text(
        supplement.name,
        style: DrenTypography.body.copyWith(
          color: DrenColors.textPrimary,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        '${supplement.dosage} - ${supplement.timing}',
        style: DrenTypography.caption1.copyWith(
          color: DrenColors.textSecondary,
        ),
      ),
      trailing: supplement.isCoreTier
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: DrenColors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Core',
                style: DrenTypography.caption2.copyWith(
                  color: DrenColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : null,
    );
  }
}

/// Model for supplement items
class SupplementItem {
  final String id;
  final String name;
  final String dosage;
  final String timing;
  final bool isCoreTier;
  final bool isChecked;

  const SupplementItem({
    required this.id,
    required this.name,
    required this.dosage,
    required this.timing,
    this.isCoreTier = true,
    this.isChecked = false,
  });
}
