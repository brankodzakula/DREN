import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/database/daos/user_profile_dao.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../domain/entities/onboarding_data.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../models/onboarding_data_model.dart';

/// Implementation of OnboardingRepository
/// Uses database for completed profiles and secure storage for progress
@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final UserProfileDao _userProfileDao;
  final SecureStorageService _secureStorage;
  final Uuid _uuid;

  // Storage key for partial onboarding data
  static const String _progressKey = 'onboarding_progress';
  static const String _userIdKey = 'current_user_id';

  OnboardingRepositoryImpl(
    this._userProfileDao,
    this._secureStorage,
  ) : _uuid = const Uuid();

  @override
  Future<String> saveUserProfile(OnboardingData data) async {
    // Generate a unique ID for the user
    final userId = _uuid.v4();

    // Convert OnboardingData to database companion
    final companion = OnboardingDataModel.toCompanion(data, id: userId);

    // Save to database
    await _userProfileDao.upsertUserProfile(companion);

    // Mark onboarding as complete in secure storage
    await _secureStorage.setOnboardingComplete(true);

    // Store the user ID
    await _secureStorage.write(_userIdKey, userId);

    // Clear any partial progress
    await _clearOnboardingProgress();

    return userId;
  }

  @override
  Future<OnboardingData?> loadOnboardingData() async {
    // First, check if there's a completed profile
    final existingProfile = await _userProfileDao.getUserProfile();
    if (existingProfile != null) {
      return OnboardingDataModel.fromUserProfile(existingProfile);
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
    if (!flagComplete) return false;

    // Verify a profile actually exists
    final profile = await _userProfileDao.getUserProfile();
    return profile != null && profile.healthDisclaimerAccepted;
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
