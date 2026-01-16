import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/services/health_service.dart';
import '../../domain/entities/user_settings.dart';
import '../../domain/usecases/get_user_settings.dart';
import '../../domain/usecases/manage_data.dart';
import '../../domain/usecases/update_ambition.dart' as usecase;
import '../../domain/usecases/update_profile.dart';
import '../../domain/repositories/settings_repository.dart';
import 'settings_event.dart';
import 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUserSettings _getUserSettings;
  final UpdateProfile _updateProfile;
  final usecase.UpdateAmbition _updateAmbition;
  final ManageData _manageData;
  final SettingsRepository _settingsRepository;
  final HealthService _healthService;

  SettingsBloc(
    this._getUserSettings,
    this._updateProfile,
    this._updateAmbition,
    this._manageData,
    this._settingsRepository,
    this._healthService,
  ) : super(const SettingsState.initial()) {
    on<LoadSettings>(_onLoadSettings);
    on<RefreshSettings>(_onRefresh);
    on<UpdateWeight>(_onUpdateWeight);
    on<UpdateTargetWeight>(_onUpdateTargetWeight);
    on<UpdateHeight>(_onUpdateHeight);
    on<UpdateActivityLevel>(_onUpdateActivityLevel);
    on<UpdateWakeTime>(_onUpdateWakeTime);
    on<UpdateAmbition>(_onUpdateAmbition);
    on<UpdateNotifications>(_onUpdateNotifications);
    on<RequestHealthPermissions>(_onRequestHealthPermissions);
    on<ExportData>(_onExportData);
    on<ClearAllData>(_onClearAllData);
    on<ClearMessage>(_onClearMessage);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());

    try {
      final settings = await _getUserSettings();
      if (settings == null) {
        emit(const SettingsState.error(message: 'No user profile found'));
        return;
      }

      final notificationPrefs =
          await _settingsRepository.getNotificationPreferences();
      final healthStatus = await _getHealthConnectionStatus();

      emit(SettingsState.loaded(
        settings: settings,
        notificationPrefs: notificationPrefs,
        healthStatus: healthStatus,
      ));
    } catch (e) {
      emit(SettingsState.error(message: e.toString()));
    }
  }

  Future<void> _onRefresh(
    RefreshSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    try {
      final settings = await _getUserSettings();
      if (settings == null) return;

      final notificationPrefs =
          await _settingsRepository.getNotificationPreferences();
      final healthStatus = await _getHealthConnectionStatus();

      emit(currentState.copyWith(
        settings: settings,
        notificationPrefs: notificationPrefs,
        healthStatus: healthStatus,
      ));
    } catch (e) {
      // Silently fail on refresh
    }
  }

  Future<void> _onUpdateWeight(
    UpdateWeight event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(isSaving: true));

    try {
      await _updateProfile(weightKg: event.weightKg);
      final settings = await _getUserSettings();
      if (settings != null) {
        emit(currentState.copyWith(
          settings: settings,
          isSaving: false,
          successMessage: 'Weight updated',
        ));
      }
    } catch (e) {
      emit(currentState.copyWith(isSaving: false));
    }
  }

  Future<void> _onUpdateTargetWeight(
    UpdateTargetWeight event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(isSaving: true));

    try {
      await _updateProfile(targetWeightKg: event.targetWeightKg);
      final settings = await _getUserSettings();
      if (settings != null) {
        emit(currentState.copyWith(
          settings: settings,
          isSaving: false,
          successMessage: 'Target weight updated',
        ));
      }
    } catch (e) {
      emit(currentState.copyWith(isSaving: false));
    }
  }

  Future<void> _onUpdateHeight(
    UpdateHeight event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(isSaving: true));

    try {
      await _updateProfile(heightCm: event.heightCm);
      final settings = await _getUserSettings();
      if (settings != null) {
        emit(currentState.copyWith(
          settings: settings,
          isSaving: false,
          successMessage: 'Height updated',
        ));
      }
    } catch (e) {
      emit(currentState.copyWith(isSaving: false));
    }
  }

  Future<void> _onUpdateActivityLevel(
    UpdateActivityLevel event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(isSaving: true));

    try {
      await _updateProfile(activityLevel: event.level);
      final settings = await _getUserSettings();
      if (settings != null) {
        emit(currentState.copyWith(
          settings: settings,
          isSaving: false,
          successMessage: 'Activity level updated',
        ));
      }
    } catch (e) {
      emit(currentState.copyWith(isSaving: false));
    }
  }

  Future<void> _onUpdateWakeTime(
    UpdateWakeTime event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(isSaving: true));

    try {
      await _updateProfile(wakeTime: event.time);
      final settings = await _getUserSettings();
      if (settings != null) {
        emit(currentState.copyWith(
          settings: settings,
          isSaving: false,
          successMessage: 'Wake time updated',
        ));
      }
    } catch (e) {
      emit(currentState.copyWith(isSaving: false));
    }
  }

  Future<void> _onUpdateAmbition(
    UpdateAmbition event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(isSaving: true));

    try {
      await _updateAmbition(event.ambition);
      final settings = await _getUserSettings();
      if (settings != null) {
        emit(currentState.copyWith(
          settings: settings,
          isSaving: false,
          successMessage: 'Protocol intensity updated',
        ));
      }
    } catch (e) {
      emit(currentState.copyWith(isSaving: false));
    }
  }

  Future<void> _onUpdateNotifications(
    UpdateNotifications event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    try {
      await _settingsRepository.updateNotificationPreferences(event.prefs);
      emit(currentState.copyWith(
        notificationPrefs: event.prefs,
        successMessage: 'Notification preferences updated',
      ));
    } catch (e) {
      // Silently fail
    }
  }

  Future<void> _onRequestHealthPermissions(
    RequestHealthPermissions event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    try {
      final result = await _healthService.requestPermissions();
      final granted = result.isSuccess && result.data == true;
      final healthStatus = HealthConnectionStatus(
        isConnected: true,
        hasPermissions: granted,
        platformName: Platform.isIOS ? 'Apple Health' : 'Health Connect',
        lastSyncTime: granted ? DateTime.now() : null,
      );

      emit(currentState.copyWith(
        healthStatus: healthStatus,
        successMessage: granted
            ? 'Health permissions granted'
            : 'Health permissions denied',
      ));
    } catch (e) {
      emit(currentState.copyWith(
        healthStatus: HealthConnectionStatus(
          isConnected: false,
          hasPermissions: false,
          platformName: Platform.isIOS ? 'Apple Health' : 'Health Connect',
          errorMessage: e.toString(),
        ),
      ));
    }
  }

  Future<void> _onExportData(
    ExportData event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(isSaving: true));

    try {
      final data = await _manageData.exportData();
      final jsonString = const JsonEncoder.withIndent('  ').convert(data);

      // Save to temp file and share
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/dren_export.json');
      await file.writeAsString(jsonString);

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'Dren Data Export',
      );

      emit(currentState.copyWith(
        isSaving: false,
        successMessage: 'Data exported successfully',
      ));
    } catch (e) {
      emit(currentState.copyWith(
        isSaving: false,
        successMessage: 'Export failed: ${e.toString()}',
      ));
    }
  }

  Future<void> _onClearAllData(
    ClearAllData event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(isSaving: true));

    try {
      await _manageData.clearAllData();
      emit(const SettingsState.initial());
    } catch (e) {
      emit(currentState.copyWith(
        isSaving: false,
        successMessage: 'Failed to clear data: ${e.toString()}',
      ));
    }
  }

  Future<void> _onClearMessage(
    ClearMessage event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! SettingsLoaded) return;

    emit(currentState.copyWith(successMessage: null));
  }

  Future<HealthConnectionStatus> _getHealthConnectionStatus() async {
    try {
      final hasPermissions = await _healthService.hasPermissions();
      return HealthConnectionStatus(
        isConnected: true,
        hasPermissions: hasPermissions,
        platformName: Platform.isIOS ? 'Apple Health' : 'Health Connect',
        lastSyncTime: hasPermissions ? DateTime.now() : null,
      );
    } catch (e) {
      return HealthConnectionStatus(
        isConnected: false,
        hasPermissions: false,
        platformName: Platform.isIOS ? 'Apple Health' : 'Health Connect',
        errorMessage: e.toString(),
      );
    }
  }
}
