import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_settings.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = SettingsInitial;

  const factory SettingsState.loading() = SettingsLoading;

  const factory SettingsState.loaded({
    required UserSettings settings,
    required NotificationPreferences notificationPrefs,
    required HealthConnectionStatus healthStatus,
    @Default(false) bool isSaving,
    String? successMessage,
  }) = SettingsLoaded;

  const factory SettingsState.error({required String message}) = SettingsError;
}
