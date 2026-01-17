import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Service for Firebase Analytics and Crashlytics
@lazySingleton
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  /// Initialize analytics and crashlytics
  Future<void> initialize() async {
    // Enable analytics collection
    await _analytics.setAnalyticsCollectionEnabled(true);

    // Configure Crashlytics
    await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);

    // Pass Flutter errors to Crashlytics
    FlutterError.onError = (errorDetails) {
      _crashlytics.recordFlutterFatalError(errorDetails);
    };

    // Pass async errors to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      _crashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }

  /// Set user ID for analytics
  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(id: userId);
    await _crashlytics.setUserIdentifier(userId);
  }

  /// Clear user ID on sign out
  Future<void> clearUserId() async {
    await _analytics.setUserId(id: null);
    await _crashlytics.setUserIdentifier('');
  }

  /// Set user properties
  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  // ============ Screen Tracking ============

  /// Log screen view
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    await _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }

  // ============ User Actions ============

  /// Log sign in event
  Future<void> logLogin(String method) async {
    await _analytics.logLogin(loginMethod: method);
  }

  /// Log sign up event
  Future<void> logSignUp(String method) async {
    await _analytics.logSignUp(signUpMethod: method);
  }

  // ============ App-Specific Events ============

  /// Log meal logged
  Future<void> logMealLogged({
    required String mealType,
    required int calories,
  }) async {
    await _analytics.logEvent(
      name: 'meal_logged',
      parameters: {
        'meal_type': mealType,
        'calories': calories,
      },
    );
  }

  /// Log workout completed
  Future<void> logWorkoutCompleted({
    required String workoutType,
    required int durationMinutes,
    required int caloriesBurned,
  }) async {
    await _analytics.logEvent(
      name: 'workout_completed',
      parameters: {
        'workout_type': workoutType,
        'duration_minutes': durationMinutes,
        'calories_burned': caloriesBurned,
      },
    );
  }

  /// Log sleep session recorded
  Future<void> logSleepRecorded({
    required int durationMinutes,
    required int sleepScore,
  }) async {
    await _analytics.logEvent(
      name: 'sleep_recorded',
      parameters: {
        'duration_minutes': durationMinutes,
        'sleep_score': sleepScore,
      },
    );
  }

  /// Log protocol completed for the day
  Future<void> logDailyProtocolCompleted({
    required double completionPercentage,
  }) async {
    await _analytics.logEvent(
      name: 'daily_protocol_completed',
      parameters: {
        'completion_percentage': completionPercentage,
      },
    );
  }

  /// Log onboarding completed
  Future<void> logOnboardingCompleted() async {
    await _analytics.logEvent(name: 'onboarding_completed');
  }

  /// Log food barcode scanned
  Future<void> logBarcodeScanned({required bool found}) async {
    await _analytics.logEvent(
      name: 'barcode_scanned',
      parameters: {
        'product_found': found,
      },
    );
  }

  /// Log health sync performed
  Future<void> logHealthSync({required bool success}) async {
    await _analytics.logEvent(
      name: 'health_sync',
      parameters: {
        'success': success,
      },
    );
  }

  /// Log custom event
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  // ============ Error Tracking ============

  /// Record non-fatal error
  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    String? reason,
    bool fatal = false,
  }) async {
    await _crashlytics.recordError(
      exception,
      stack,
      reason: reason,
      fatal: fatal,
    );
  }

  /// Log message to crashlytics
  Future<void> log(String message) async {
    await _crashlytics.log(message);
  }

  /// Set custom key for crash reports
  Future<void> setCustomKey(String key, dynamic value) async {
    await _crashlytics.setCustomKey(key, value);
  }
}
