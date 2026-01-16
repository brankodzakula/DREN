import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../domain/entities/user_settings.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsBloc>()..add(const SettingsEvent.loadSettings()),
      child: const _SettingsPageContent(),
    );
  }
}

class _SettingsPageContent extends StatelessWidget {
  const _SettingsPageContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      appBar: AppBar(
        backgroundColor: DrenColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: DrenColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Settings',
          style: DrenTypography.headline.copyWith(
            color: DrenColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsLoaded && state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage!),
                backgroundColor: DrenColors.success,
                duration: const Duration(seconds: 2),
              ),
            );
            context.read<SettingsBloc>().add(const SettingsEvent.clearMessage());
          }

          // Handle data clear - navigate to onboarding
          if (state is SettingsInitial) {
            context.go('/onboarding');
          }
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: DrenColors.primary),
            ),
            loaded: (settings, notificationPrefs, healthStatus, isSaving, _) =>
                _buildContent(
              context,
              settings: settings,
              notificationPrefs: notificationPrefs,
              healthStatus: healthStatus,
              isSaving: isSaving,
            ),
            error: (message) => _buildError(context, message),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required UserSettings settings,
    required NotificationPreferences notificationPrefs,
    required HealthConnectionStatus healthStatus,
    required bool isSaving,
  }) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.symmetric(vertical: DrenSpacing.md),
          children: [
            // Profile Section
            SettingsSection(
              title: 'Profile',
              children: [
                SettingsTile(
                  icon: Icons.person,
                  title: 'Age',
                  value: '${settings.age} years',
                ),
                SettingsTile(
                  icon: Icons.straighten,
                  title: 'Height',
                  value: settings.heightFormatted,
                  onTap: () => _showHeightEditor(context, settings.heightCm),
                ),
                SettingsTile(
                  icon: Icons.monitor_weight,
                  title: 'Current Weight',
                  value: settings.weightFormatted,
                  onTap: () => _showWeightEditor(context, settings.weightKg),
                ),
                if (settings.targetWeightKg != null)
                  SettingsTile(
                    icon: Icons.flag,
                    title: 'Target Weight',
                    value: '${(settings.targetWeightKg! * 2.205).round()} lbs',
                    onTap: () => _showTargetWeightEditor(
                        context, settings.targetWeightKg!),
                  ),
                SettingsTile(
                  icon: Icons.directions_run,
                  title: 'Activity Level',
                  value: settings.activityLevelDisplay,
                  onTap: () =>
                      _showActivityLevelPicker(context, settings.activityLevel),
                ),
                SettingsTile(
                  icon: Icons.alarm,
                  title: 'Wake Time',
                  value: settings.wakeTime.format(context),
                  onTap: () => _showWakeTimePicker(context, settings.wakeTime),
                ),
              ],
            ),

            // Protocol Section
            SettingsSection(
              title: 'Protocol',
              children: [
                SettingsTile(
                  icon: Icons.speed,
                  title: 'Intensity Level',
                  value: settings.ambitionDisplay,
                  onTap: () => _showAmbitionPicker(
                      context, settings.longevityAmbition),
                ),
              ],
            ),

            // Health Platform Section
            SettingsSection(
              title: 'Health Integration',
              children: [
                SettingsTile(
                  icon: Icons.favorite,
                  title: healthStatus.platformName,
                  value: healthStatus.statusText,
                  trailing: healthStatus.hasPermissions
                      ? const Icon(Icons.check_circle,
                          color: DrenColors.success, size: 20)
                      : const Icon(Icons.warning,
                          color: DrenColors.warning, size: 20),
                  onTap: healthStatus.hasPermissions
                      ? null
                      : () => context
                          .read<SettingsBloc>()
                          .add(const SettingsEvent.requestHealthPermissions()),
                ),
                if (healthStatus.lastSyncFormatted != null)
                  SettingsTile(
                    icon: Icons.sync,
                    title: 'Last Sync',
                    value: healthStatus.lastSyncFormatted!,
                  ),
              ],
            ),

            // Notifications Section
            SettingsSection(
              title: 'Notifications',
              children: [
                SettingsTile(
                  icon: Icons.restaurant,
                  title: 'Meal Reminders',
                  trailing: Switch(
                    value: notificationPrefs.mealReminders,
                    onChanged: (value) => _updateNotificationPref(
                      context,
                      notificationPrefs.copyWith(mealReminders: value),
                    ),
                    activeColor: DrenColors.primary,
                  ),
                ),
                SettingsTile(
                  icon: Icons.fitness_center,
                  title: 'Workout Reminders',
                  trailing: Switch(
                    value: notificationPrefs.workoutReminders,
                    onChanged: (value) => _updateNotificationPref(
                      context,
                      notificationPrefs.copyWith(workoutReminders: value),
                    ),
                    activeColor: DrenColors.primary,
                  ),
                ),
                SettingsTile(
                  icon: Icons.bedtime,
                  title: 'Bedtime Reminders',
                  trailing: Switch(
                    value: notificationPrefs.bedtimeReminders,
                    onChanged: (value) => _updateNotificationPref(
                      context,
                      notificationPrefs.copyWith(bedtimeReminders: value),
                    ),
                    activeColor: DrenColors.primary,
                  ),
                ),
                SettingsTile(
                  icon: Icons.medication,
                  title: 'Supplement Reminders',
                  trailing: Switch(
                    value: notificationPrefs.supplementReminders,
                    onChanged: (value) => _updateNotificationPref(
                      context,
                      notificationPrefs.copyWith(supplementReminders: value),
                    ),
                    activeColor: DrenColors.primary,
                  ),
                ),
                SettingsTile(
                  icon: Icons.trending_up,
                  title: 'Progress Updates',
                  trailing: Switch(
                    value: notificationPrefs.progressUpdates,
                    onChanged: (value) => _updateNotificationPref(
                      context,
                      notificationPrefs.copyWith(progressUpdates: value),
                    ),
                    activeColor: DrenColors.primary,
                  ),
                ),
              ],
            ),

            // Data Section
            SettingsSection(
              title: 'Data',
              children: [
                SettingsTile(
                  icon: Icons.download,
                  title: 'Export Data',
                  subtitle: 'Download your data as JSON',
                  onTap: () => context
                      .read<SettingsBloc>()
                      .add(const SettingsEvent.exportData()),
                ),
                SettingsTile(
                  icon: Icons.delete_forever,
                  title: 'Clear All Data',
                  subtitle: 'Delete all data and start over',
                  titleColor: DrenColors.error,
                  onTap: () => _showClearDataConfirmation(context),
                ),
              ],
            ),

            // About Section
            SettingsSection(
              title: 'About',
              children: [
                SettingsTile(
                  icon: Icons.info,
                  title: 'Version',
                  value: '1.0.0',
                ),
                SettingsTile(
                  icon: Icons.description,
                  title: 'Privacy Policy',
                  onTap: () {
                    // TODO: Open privacy policy
                  },
                ),
                SettingsTile(
                  icon: Icons.gavel,
                  title: 'Terms of Service',
                  onTap: () {
                    // TODO: Open terms of service
                  },
                ),
              ],
            ),

            const SizedBox(height: DrenSpacing.xxl),
          ],
        ),

        // Loading overlay
        if (isSaving)
          Container(
            color: DrenColors.background.withOpacity(0.7),
            child: const Center(
              child: CircularProgressIndicator(color: DrenColors.primary),
            ),
          ),
      ],
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: DrenColors.error, size: 48),
          const SizedBox(height: DrenSpacing.md),
          Text(
            'Failed to load settings',
            style: DrenTypography.headline.copyWith(
              color: DrenColors.textPrimary,
            ),
          ),
          const SizedBox(height: DrenSpacing.xs),
          Text(
            message,
            style: DrenTypography.footnote.copyWith(
              color: DrenColors.textSecondary,
            ),
          ),
          const SizedBox(height: DrenSpacing.lg),
          ElevatedButton(
            onPressed: () => context
                .read<SettingsBloc>()
                .add(const SettingsEvent.loadSettings()),
            style: ElevatedButton.styleFrom(
              backgroundColor: DrenColors.primary,
              foregroundColor: DrenColors.background,
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _updateNotificationPref(
      BuildContext context, NotificationPreferences prefs) {
    context
        .read<SettingsBloc>()
        .add(SettingsEvent.updateNotifications(prefs: prefs));
  }

  void _showHeightEditor(BuildContext context, double currentHeight) {
    double height = currentHeight;
    showModalBottomSheet(
      context: context,
      backgroundColor: DrenColors.surfacePrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => Padding(
          padding: const EdgeInsets.all(DrenSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Update Height',
                style: DrenTypography.title2.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${height.round()} cm',
                    style: DrenTypography.metricLarge.copyWith(
                      color: DrenColors.primary,
                    ),
                  ),
                ],
              ),
              Slider(
                value: height,
                min: 120,
                max: 220,
                divisions: 100,
                activeColor: DrenColors.primary,
                onChanged: (value) => setState(() => height = value),
              ),
              const SizedBox(height: DrenSpacing.md),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  context
                      .read<SettingsBloc>()
                      .add(SettingsEvent.updateHeight(heightCm: height));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: DrenColors.primary,
                  foregroundColor: DrenColors.background,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Save'),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  void _showWeightEditor(BuildContext context, double currentWeight) {
    double weight = currentWeight;
    showModalBottomSheet(
      context: context,
      backgroundColor: DrenColors.surfacePrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => Padding(
          padding: const EdgeInsets.all(DrenSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Update Weight',
                style: DrenTypography.title2.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.lg),
              Text(
                '${weight.toStringAsFixed(1)} kg',
                style: DrenTypography.metricLarge.copyWith(
                  color: DrenColors.primary,
                ),
              ),
              Text(
                '${(weight * 2.205).round()} lbs',
                style: DrenTypography.subheadline.copyWith(
                  color: DrenColors.textSecondary,
                ),
              ),
              Slider(
                value: weight,
                min: 30,
                max: 200,
                divisions: 170,
                activeColor: DrenColors.primary,
                onChanged: (value) => setState(() => weight = value),
              ),
              const SizedBox(height: DrenSpacing.md),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  context
                      .read<SettingsBloc>()
                      .add(SettingsEvent.updateWeight(weightKg: weight));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: DrenColors.primary,
                  foregroundColor: DrenColors.background,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Save'),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  void _showTargetWeightEditor(BuildContext context, double currentTarget) {
    double weight = currentTarget;
    showModalBottomSheet(
      context: context,
      backgroundColor: DrenColors.surfacePrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => Padding(
          padding: const EdgeInsets.all(DrenSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Update Target Weight',
                style: DrenTypography.title2.copyWith(
                  color: DrenColors.textPrimary,
                ),
              ),
              const SizedBox(height: DrenSpacing.lg),
              Text(
                '${weight.toStringAsFixed(1)} kg',
                style: DrenTypography.metricLarge.copyWith(
                  color: DrenColors.primary,
                ),
              ),
              Slider(
                value: weight,
                min: 30,
                max: 200,
                divisions: 170,
                activeColor: DrenColors.primary,
                onChanged: (value) => setState(() => weight = value),
              ),
              const SizedBox(height: DrenSpacing.md),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  context.read<SettingsBloc>().add(
                      SettingsEvent.updateTargetWeight(targetWeightKg: weight));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: DrenColors.primary,
                  foregroundColor: DrenColors.background,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Save'),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  void _showActivityLevelPicker(BuildContext context, String currentLevel) {
    final levels = [
      ('sedentary', 'Sedentary', 'Little or no exercise'),
      ('lightly_active', 'Lightly Active', 'Light exercise 1-3 days/week'),
      ('moderately_active', 'Moderately Active', 'Moderate exercise 3-5 days/week'),
      ('very_active', 'Very Active', 'Hard exercise 6-7 days/week'),
      ('extremely_active', 'Extremely Active', 'Very hard exercise daily'),
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: DrenColors.surfacePrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(DrenSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity Level',
              style: DrenTypography.title2.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),
            const SizedBox(height: DrenSpacing.md),
            ...levels.map((level) => ListTile(
                  title: Text(
                    level.$2,
                    style: DrenTypography.body.copyWith(
                      color: DrenColors.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    level.$3,
                    style: DrenTypography.footnote.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                  trailing: currentLevel == level.$1
                      ? const Icon(Icons.check, color: DrenColors.primary)
                      : null,
                  onTap: () {
                    Navigator.pop(ctx);
                    context.read<SettingsBloc>().add(
                        SettingsEvent.updateActivityLevel(level: level.$1));
                  },
                )),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  void _showWakeTimePicker(BuildContext context, TimeOfDay currentTime) async {
    final time = await showTimePicker(
      context: context,
      initialTime: currentTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: DrenColors.primary,
              surface: DrenColors.surfacePrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (time != null && context.mounted) {
      context.read<SettingsBloc>().add(SettingsEvent.updateWakeTime(time: time));
    }
  }

  void _showAmbitionPicker(BuildContext context, String currentAmbition) {
    showModalBottomSheet(
      context: context,
      backgroundColor: DrenColors.surfacePrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(DrenSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Protocol Intensity',
              style: DrenTypography.title2.copyWith(
                color: DrenColors.textPrimary,
              ),
            ),
            const SizedBox(height: DrenSpacing.md),
            _AmbitionOption(
              title: 'Moderate',
              description:
                  'Balanced approach with sustainable targets. Recommended for most people.',
              isSelected: currentAmbition == 'moderate',
              onTap: () {
                Navigator.pop(ctx);
                context
                    .read<SettingsBloc>()
                    .add(const SettingsEvent.updateAmbition(ambition: 'moderate'));
              },
            ),
            const SizedBox(height: DrenSpacing.sm),
            _AmbitionOption(
              title: 'Aggressive',
              description:
                  'More challenging targets for faster results. Requires strong commitment.',
              isSelected: currentAmbition == 'aggressive',
              onTap: () {
                Navigator.pop(ctx);
                context.read<SettingsBloc>().add(
                    const SettingsEvent.updateAmbition(ambition: 'aggressive'));
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  void _showClearDataConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: DrenColors.surfacePrimary,
        title: Text(
          'Clear All Data?',
          style: DrenTypography.title2.copyWith(
            color: DrenColors.textPrimary,
          ),
        ),
        content: Text(
          'This will permanently delete all your data including your profile, meals, workouts, and sleep records. This action cannot be undone.',
          style: DrenTypography.body.copyWith(
            color: DrenColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Cancel',
              style: DrenTypography.body.copyWith(
                color: DrenColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<SettingsBloc>().add(const SettingsEvent.clearAllData());
            },
            child: Text(
              'Delete All',
              style: DrenTypography.body.copyWith(
                color: DrenColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbitionOption extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const _AmbitionOption({
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DrenSpacing.md),
        decoration: BoxDecoration(
          color: isSelected
              ? DrenColors.primary.withOpacity(0.1)
              : DrenColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          border: Border.all(
            color: isSelected ? DrenColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: DrenTypography.headline.copyWith(
                      color: DrenColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: DrenSpacing.xxs),
                  Text(
                    description,
                    style: DrenTypography.footnote.copyWith(
                      color: DrenColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: DrenColors.primary),
          ],
        ),
      ),
    );
  }
}
