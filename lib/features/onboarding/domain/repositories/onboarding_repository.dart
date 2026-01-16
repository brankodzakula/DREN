import '../entities/onboarding_data.dart';

/// Repository interface for onboarding operations
/// Implementations handle storage of user profile data
abstract class OnboardingRepository {
  /// Saves the completed onboarding data as a user profile
  /// Returns the generated user profile ID on success
  Future<String> saveUserProfile(OnboardingData data);

  /// Loads any existing onboarding data (partial or complete)
  /// Returns null if no onboarding data exists
  Future<OnboardingData?> loadOnboardingData();

  /// Saves partial onboarding data for later completion
  Future<void> saveOnboardingProgress(OnboardingData data);

  /// Checks if onboarding has been completed
  /// Returns true if a valid user profile exists
  Future<bool> isOnboardingComplete();

  /// Clears all onboarding data (for reset functionality)
  Future<void> clearOnboardingData();

  /// Gets the current user profile ID if exists
  /// Returns null if onboarding not complete
  Future<String?> getCurrentUserId();
}
