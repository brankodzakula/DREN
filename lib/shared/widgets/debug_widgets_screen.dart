import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/theme/spacing.dart';
import 'buttons/primary_button.dart';
import 'buttons/secondary_button.dart';
import 'cards/protocol_card.dart';
import 'rings/four_rings_widget.dart';

/// Debug screen to verify all shared widgets render correctly
class DebugWidgetsScreen extends StatefulWidget {
  const DebugWidgetsScreen({super.key});

  @override
  State<DebugWidgetsScreen> createState() => _DebugWidgetsScreenState();
}

class _DebugWidgetsScreenState extends State<DebugWidgetsScreen> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
    if (_isLoading) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Debug'),
        backgroundColor: DrenColors.background,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DrenSpacing.screenHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Buttons
            _buildSectionHeader('Buttons'),
            const SizedBox(height: DrenSpacing.sm),

            PrimaryButton(
              label: 'Primary Button',
              onPressed: _toggleLoading,
              isLoading: _isLoading,
            ),
            const SizedBox(height: DrenSpacing.sm),

            PrimaryButton(
              label: 'With Icon',
              icon: Icons.play_arrow,
              onPressed: () {},
            ),
            const SizedBox(height: DrenSpacing.sm),

            const PrimaryButton(
              label: 'Disabled',
              isEnabled: false,
            ),
            const SizedBox(height: DrenSpacing.md),

            SecondaryButton(
              label: 'Secondary Button',
              onPressed: () {},
            ),
            const SizedBox(height: DrenSpacing.sm),

            SecondaryButton(
              label: 'With Icon',
              icon: Icons.add,
              onPressed: () {},
            ),
            const SizedBox(height: DrenSpacing.sm),

            const SecondaryButton(
              label: 'Disabled',
              isEnabled: false,
            ),
            const SizedBox(height: DrenSpacing.md),

            Row(
              children: [
                TertiaryButton(
                  label: 'Skip',
                  onPressed: () {},
                ),
                TertiaryButton(
                  label: 'Learn More',
                  icon: Icons.info_outline,
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: DrenSpacing.xl),

            // Section: Four Rings
            _buildSectionHeader('Four Rings Widget'),
            const SizedBox(height: DrenSpacing.sm),

            const ProtocolCard(
              child: FourRingsWithLabels(
                caloriesIn: RingData(
                  current: 1450,
                  target: 2100,
                  label: 'Calories In',
                  unit: 'KCAL',
                ),
                caloriesOut: RingData(
                  current: 320,
                  target: 450,
                  label: 'Calories Out',
                  unit: 'KCAL',
                ),
                exercise: RingData(
                  current: 45,
                  target: 60,
                  label: 'Exercise',
                  unit: 'MIN',
                ),
                sleep: RingData(
                  current: 432, // 7.2 hours in minutes
                  target: 480, // 8 hours in minutes
                  label: 'Sleep',
                  unit: 'MIN',
                ),
                ringSize: 140,
              ),
            ),

            const SizedBox(height: DrenSpacing.md),

            // Over target example
            _buildSectionHeader('Rings - Over Target'),
            const SizedBox(height: DrenSpacing.sm),

            const ProtocolCard(
              child: FourRingsWithLabels(
                caloriesIn: RingData(
                  current: 2300,
                  target: 2100,
                  label: 'Calories In',
                  unit: 'KCAL',
                ),
                caloriesOut: RingData(
                  current: 500,
                  target: 450,
                  label: 'Calories Out',
                  unit: 'KCAL',
                ),
                exercise: RingData(
                  current: 75,
                  target: 60,
                  label: 'Exercise',
                  unit: 'MIN',
                ),
                sleep: RingData(
                  current: 510,
                  target: 480,
                  label: 'Sleep',
                  unit: 'MIN',
                ),
                ringSize: 140,
              ),
            ),

            const SizedBox(height: DrenSpacing.xl),

            // Section: Protocol Cards
            _buildSectionHeader('Protocol Cards'),
            const SizedBox(height: DrenSpacing.sm),

            ProtocolSummaryCard(
              icon: Icons.restaurant,
              iconColor: DrenColors.caloriesInRing,
              title: 'Meals Remaining: 1',
              subtitle: '650 kcal • 45g protein to go',
              onTap: () {},
            ),
            const SizedBox(height: DrenSpacing.sm),

            ProtocolSummaryCard(
              icon: Icons.fitness_center,
              iconColor: DrenColors.exerciseRing,
              title: 'Upper Body Strength',
              subtitle: '45 min • ~320 kcal • Intermediate',
              onTap: () {},
            ),
            const SizedBox(height: DrenSpacing.sm),

            ProtocolSummaryCard(
              icon: Icons.bedtime,
              iconColor: DrenColors.sleepRing,
              title: 'Wind-Down in 4h 32m',
              subtitle: 'Target bedtime: 10:00 PM',
              onTap: () {},
            ),

            const SizedBox(height: DrenSpacing.xl),

            // Section: Workout Card
            _buildSectionHeader('Workout Card'),
            const SizedBox(height: DrenSpacing.sm),

            WorkoutCard(
              title: 'Upper Body Strength',
              subtitle: '6 exercises • Intermediate',
              duration: '45 min',
              calories: '~320 kcal',
              onStartPressed: () {},
            ),

            const SizedBox(height: DrenSpacing.xl),

            // Section: Recipe Cards
            _buildSectionHeader('Recipe Cards'),
            const SizedBox(height: DrenSpacing.sm),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RecipeCard(
                    name: 'Super Veggie',
                    calories: '380 kcal',
                    onLogPressed: () {},
                  ),
                  const SizedBox(width: DrenSpacing.sm),
                  RecipeCard(
                    name: 'Nutty Pudding',
                    calories: '430 kcal',
                    onLogPressed: () {},
                  ),
                  const SizedBox(width: DrenSpacing.sm),
                  RecipeCard(
                    name: 'EVOO Shot',
                    calories: '370 kcal',
                    onLogPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: DrenSpacing.xl),

            // Section: Colors
            _buildSectionHeader('Color Palette'),
            const SizedBox(height: DrenSpacing.sm),

            Wrap(
              spacing: DrenSpacing.xs,
              runSpacing: DrenSpacing.xs,
              children: [
                _buildColorChip('Primary', DrenColors.primary),
                _buildColorChip('Surface', DrenColors.surfacePrimary),
                _buildColorChip('Surface 2', DrenColors.surfaceSecondary),
                _buildColorChip('Cal In', DrenColors.caloriesInRing),
                _buildColorChip('Cal Out', DrenColors.caloriesOutRing),
                _buildColorChip('Exercise', DrenColors.exerciseRing),
                _buildColorChip('Sleep', DrenColors.sleepRing),
                _buildColorChip('Success', DrenColors.success),
                _buildColorChip('Warning', DrenColors.warning),
                _buildColorChip('Error', DrenColors.error),
              ],
            ),

            const SizedBox(height: DrenSpacing.xl),

            // Section: Typography
            _buildSectionHeader('Typography'),
            const SizedBox(height: DrenSpacing.sm),

            const Text('Large Title', style: DrenTypography.largeTitle),
            const Text('Title 1', style: DrenTypography.title1),
            const Text('Title 2', style: DrenTypography.title2),
            const Text('Title 3', style: DrenTypography.title3),
            const Text('Headline', style: DrenTypography.headline),
            const Text('Body', style: DrenTypography.body),
            const Text('Callout', style: DrenTypography.callout),
            const Text('Subheadline', style: DrenTypography.subheadline),
            const Text('Footnote', style: DrenTypography.footnote),
            const Text('Caption 1', style: DrenTypography.caption1),
            const Text('Caption 2', style: DrenTypography.caption2),

            const SizedBox(height: DrenSpacing.xxxl),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title.toUpperCase(),
      style: DrenTypography.categoryLabel,
    );
  }

  Widget _buildColorChip(String name, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DrenSpacing.sm,
        vertical: DrenSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(DrenSpacing.radiusSm),
      ),
      child: Text(
        name,
        style: DrenTypography.caption1.copyWith(
          color: color == DrenColors.primary ||
                  color == DrenColors.caloriesInRing ||
                  color == DrenColors.warning
              ? DrenColors.background
              : DrenColors.textPrimary,
        ),
      ),
    );
  }
}
