import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/database/daos/user_profile_dao.dart';
import '../../../../core/services/firebase/auth_service.dart';
import '../../../../core/services/firebase/firestore_service.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../domain/entities/onboarding_data.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../models/onboarding_data_model.dart';

/// Implementation of OnboardingRepository
/// Uses database for completed profiles and secure storage for progress
/// Also syncs with Firestore for cloud backup
@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final UserProfileDao _userProfileDao;
  final SecureStorageService _secureStorage;
  final FirestoreService _firestoreService;
  final AuthService _authService;
  final Uuid _uuid;

  // Storage key for partial onboarding data
  static const String _progressKey = 'onboarding_progress';
  static const String _userIdKey = 'current_user_id';

  OnboardingRepositoryImpl(
    this._userProfileDao,
    this._secureStorage,
    this._firestoreService,
    this._authService,
  ) : _uuid = const Uuid();

  @override
  Future<String> saveUserProfile(OnboardingData data) async {
    // Use Firebase Auth UID if authenticated, otherwise generate UUID
    final authUser = _authService.currentUser;
    final userId = authUser?.uid ?? _uuid.v4();

    // Convert OnboardingData to database companion
    final companion = OnboardingDataModel.toCompanion(data, id: userId);

    // Save to local database
    await _userProfileDao.upsertUserProfile(companion);

    // Sync to Firestore if authenticated
    if (authUser != null) {
      await _syncProfileToFirestore(data, userId);
    }

    // Mark onboarding as complete in secure storage
    await _secureStorage.setOnboardingComplete(true);

    // Store the user ID
    await _secureStorage.write(_userIdKey, userId);

    // Clear any partial progress
    await _clearOnboardingProgress();

    return userId;
  }

  /// Sync user profile to Firestore
  Future<void> _syncProfileToFirestore(OnboardingData data, String id) async {
    final profileData = {
      'id': id,
      'dateOfBirth': data.dateOfBirth?.toIso8601String(),
      'sex': data.sex,
      'heightCm': data.heightCm,
      'weightKg': data.weightKg,
      'targetWeightKg': data.targetWeightKg,
      'activityLevel': data.activityLevel,
      'longevityAmbition': data.longevityAmbition,
      'fitnessLevel': data.fitnessLevel,
      'dietaryRestrictions': data.dietaryRestrictions,
      'medicalConditions': data.medicalConditions,
      'equipment': data.equipment,
      'preferredWorkoutMinutes': data.preferredWorkoutMinutes,
      'wakeTime': data.wakeTime != null
          ? '${data.wakeTime!.hour.toString().padLeft(2, '0')}:${data.wakeTime!.minute.toString().padLeft(2, '0')}'
          : null,
      'healthDisclaimerAccepted': data.disclaimerAccepted,
      'onboardingComplete': true,
    };

    await _firestoreService.saveUserProfile(profileData);
  }

  @override
  Future<OnboardingData?> loadOnboardingData() async {
    // First, check if there's a completed profile locally
    final existingProfile = await _userProfileDao.getUserProfile();
    if (existingProfile != null) {
      return OnboardingDataModel.fromUserProfile(existingProfile);
    }

    // If authenticated, check Firestore for existing profile (new device scenario)
    if (_authService.isSignedIn) {
      final firestoreData = await _loadProfileFromFirestore();
      if (firestoreData != null) {
        // Save to local database for offline access
        await _saveFirestoreProfileLocally(firestoreData);
        return firestoreData;
      }
    }

    // Otherwise, check for partial progress
    final progressJson = await _secureStorage.read(_progressKey);
    if (progressJson != null) {
      try {
        final json = jsonDecode(progressJson) as Map<String, dynamic>;
        return OnboardingProgressModel.fromJson(json);
      } catch (_) {
        // Invalid JSON, return null
        return null;
      }
    }

    return null;
  }

  /// Load user profile from Firestore
  Future<OnboardingData?> _loadProfileFromFirestore() async {
    final result = await _firestoreService.getUserProfile();
    if (result.isFailure || result.data == null) {
      return null;
    }

    final data = result.data!;

    // Check if onboarding is complete in Firestore
    if (data['onboardingComplete'] != true) {
      return null;
    }

    return OnboardingData(
      dateOfBirth: data['dateOfBirth'] != null
          ? DateTime.parse(data['dateOfBirth'] as String)
          : null,
      sex: data['sex'] as String?,
      heightCm: (data['heightCm'] as num?)?.toDouble(),
      weightKg: (data['weightKg'] as num?)?.toDouble(),
      targetWeightKg: (data['targetWeightKg'] as num?)?.toDouble(),
      activityLevel: data['activityLevel'] as String?,
      longevityAmbition: data['longevityAmbition'] as String?,
      fitnessLevel: (data['fitnessLevel'] as String?) ?? 'intermediate',
      dietaryRestrictions: data['dietaryRestrictions'] != null
          ? List<String>.from(data['dietaryRestrictions'] as List)
          : [],
      medicalConditions: data['medicalConditions'] != null
          ? List<String>.from(data['medicalConditions'] as List)
          : [],
      equipment: data['equipment'] != null
          ? List<String>.from(data['equipment'] as List)
          : [],
      preferredWorkoutMinutes: (data['preferredWorkoutMinutes'] as int?) ?? 45,
      wakeTime: _parseTimeOfDay(data['wakeTime'] as String?),
      disclaimerAccepted: data['healthDisclaimerAccepted'] as bool? ?? false,
    );
  }

  /// Parse TimeOfDay from HH:mm string
  TimeOfDay? _parseTimeOfDay(String? timeStr) {
    if (timeStr == null) return null;
    final parts = timeStr.split(':');
    if (parts.length != 2) return null;
    return TimeOfDay(
      hour: int.tryParse(parts[0]) ?? 0,
      minute: int.tryParse(parts[1]) ?? 0,
    );
  }

  /// Save Firestore profile to local database
  Future<void> _saveFirestoreProfileLocally(OnboardingData data) async {
    final authUser = _authService.currentUser;
    if (authUser == null) return;

    final companion = OnboardingDataModel.toCompanion(data, id: authUser.uid);
    await _userProfileDao.upsertUserProfile(companion);
    await _secureStorage.setOnboardingComplete(true);
    await _secureStorage.write(_userIdKey, authUser.uid);
  }

  @override
  Future<void> saveOnboardingProgress(OnboardingData data) async {
    // Convert to JSON and store in secure storage
    final json = OnboardingProgressModel.toJson(data);
    await _secureStorage.write(_progressKey, jsonEncode(json));
  }

  @override
  Future<bool> isOnboardingComplete() async {
    // Check both secure storage flag and database
    final flagComplete = await _secureStorage.isOnboardingComplete();
    if (flagComplete) {
      // Verify a profile actually exists
      final profile = await _userProfileDao.getUserProfile();
      if (profile != null && profile.healthDisclaimerAccepted) {
        return true;
      }
    }

    // If authenticated, check Firestore for existing profile (new device scenario)
    if (_authService.isSignedIn) {
      final firestoreData = await _loadProfileFromFirestore();
      if (firestoreData != null && firestoreData.isComplete) {
        // Save to local database for offline access
        await _saveFirestoreProfileLocally(firestoreData);
        return true;
      }
    }

    return false;
  }

  @override
  Future<void> clearOnboardingData() async {
    // Get current user ID
    final userId = await getCurrentUserId();

    // Delete from database if exists
    if (userId != null) {
      await _userProfileDao.deleteUserProfile(userId);
    }

    // Clear secure storage
    await _secureStorage.setOnboardingComplete(false);
    await _secureStorage.delete(_userIdKey);
    await _clearOnboardingProgress();
  }

  @override
  Future<String?> getCurrentUserId() async {
    // First try to get from secure storage
    final storedId = await _secureStorage.read(_userIdKey);
    if (storedId != null) return storedId;

    // Fallback: get from database
    final profile = await _userProfileDao.getUserProfile();
    return profile?.id;
  }

  /// Clears partial onboarding progress from secure storage
  Future<void> _clearOnboardingProgress() async {
    await _secureStorage.delete(_progressKey);
  }
}
