import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_settings.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  /// Load settings on page open
  const factory SettingsEvent.loadSettings() = LoadSettings;

  /// Refresh settings
  const factory SettingsEvent.refresh() = RefreshSettings;

  /// Update profile fields
  const factory SettingsEvent.updateWeight({required double weightKg}) =
      UpdateWeight;

  const factory SettingsEvent.updateTargetWeight({
    required double targetWeightKg,
  }) = UpdateTargetWeight;

  const factory SettingsEvent.updateHeight({required double heightCm}) =
      UpdateHeight;

  const factory SettingsEvent.updateActivityLevel({required String level}) =
      UpdateActivityLevel;

  const factory SettingsEvent.updateWakeTime({required TimeOfDay time}) =
      UpdateWakeTime;

  /// Update protocol intensity
  const factory SettingsEvent.updateAmbition({required String ambition}) =
      UpdateAmbition;

  /// Update notification preferences
  const factory SettingsEvent.updateNotifications({
    required NotificationPreferences prefs,
  }) = UpdateNotifications;

  /// Request health permissions
  const factory SettingsEvent.requestHealthPermissions() =
      RequestHealthPermissions;

  /// Export user data
  const factory SettingsEvent.exportData() = ExportData;

  /// Clear all data (factory reset)
  const factory SettingsEvent.clearAllData() = ClearAllData;

  /// Clear success message
  const factory SettingsEvent.clearMessage() = ClearMessage;
}
