import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'user_profile_dao.g.dart';

@DriftAccessor(tables: [UserProfiles])
class UserProfileDao extends DatabaseAccessor<AppDatabase>
    with _$UserProfileDaoMixin {
  UserProfileDao(super.db);

  /// Get the current user profile (there should only be one)
  Future<UserProfile?> getUserProfile() async {
    return (select(userProfiles)..limit(1)).getSingleOrNull();
  }

  /// Insert or update user profile
  Future<void> upsertUserProfile(UserProfilesCompanion profile) async {
    await into(userProfiles).insertOnConflictUpdate(profile);
  }

  /// Delete user profile
  Future<void> deleteUserProfile(String id) async {
    await (delete(userProfiles)..where((t) => t.id.equals(id))).go();
  }

  /// Check if user has completed onboarding
  Future<bool> hasCompletedOnboarding() async {
    final profile = await getUserProfile();
    return profile != null && profile.healthDisclaimerAccepted;
  }

  /// Update specific fields
  Future<void> updateWeight(String id, double weightKg) async {
    await (update(userProfiles)..where((t) => t.id.equals(id))).write(
      UserProfilesCompanion(
        weightKg: Value(weightKg),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
