import 'package:injectable/injectable.dart';

import '../repositories/today_repository.dart';
import '../../../protocol_engine/domain/entities/daily_protocol.dart';
import '../../../protocol_engine/domain/usecases/generate_daily_protocol.dart';
import '../../../onboarding/domain/repositories/onboarding_repository.dart';

/// Use case to get or generate today's protocol
@injectable
class GetTodayProtocol {
  final TodayRepository _todayRepository;
  final OnboardingRepository _onboardingRepository;
  final GenerateDailyProtocol _generateProtocol;

  GetTodayProtocol(
    this._todayRepository,
    this._onboardingRepository,
    this._generateProtocol,
  );

  /// Get today's protocol, generating it if it doesn't exist
  Future<DailyProtocol?> call() async {
    // Try to get existing protocol for today
    final existingProtocol = await _todayRepository.getTodayProtocol();

    if (existingProtocol != null) {
      return existingProtocol;
    }

    // Generate new protocol if we have user profile data
    return _generateAndSaveProtocol(DateTime.now());
  }

  /// Get protocol for a specific date, generating if needed
  Future<DailyProtocol?> forDate(DateTime date) async {
    final existingProtocol = await _todayRepository.getProtocolForDate(date);

    if (existingProtocol != null) {
      return existingProtocol;
    }

    // Only generate for today or future dates
    final today = DateTime.now();
    final isToday = date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;

    if (isToday || date.isAfter(today)) {
      return _generateAndSaveProtocol(date);
    }

    return null;
  }

  /// Force regenerate protocol for today (e.g., after profile update)
  Future<DailyProtocol?> regenerate() async {
    return _generateAndSaveProtocol(DateTime.now());
  }

  /// Generate and save protocol
  Future<DailyProtocol?> _generateAndSaveProtocol(DateTime date) async {
    // Get user profile to generate protocol
    final onboardingData = await _onboardingRepository.loadOnboardingData();

    if (onboardingData == null) {
      // No user profile, can't generate protocol
      return null;
    }

    // Convert onboarding data to protocol params
    final params = GenerateProtocolParams.fromOnboardingData(onboardingData);

    // Generate protocol
    final protocol = _generateProtocol(params);

    // Update the date to the target date
    final protocolWithDate = DailyProtocol(
      date: date,
      targetCalories: protocol.targetCalories,
      proteinGrams: protocol.proteinGrams,
      carbsGrams: protocol.carbsGrams,
      fatGrams: protocol.fatGrams,
      exerciseMinutes: protocol.exerciseMinutes,
      workoutType: protocol.workoutType,
      estimatedCaloriesBurn: protocol.estimatedCaloriesBurn,
      targetBedtime: protocol.targetBedtime,
      targetWakeTime: protocol.targetWakeTime,
      windDownStart: protocol.windDownStart,
      eatingWindowStart: protocol.eatingWindowStart,
      eatingWindowEnd: protocol.eatingWindowEnd,
      ambitionLevel: protocol.ambitionLevel,
      fitnessLevel: protocol.fitnessLevel,
    );

    // Save to database
    await _todayRepository.saveProtocol(protocolWithDate);

    return protocolWithDate;
  }
}
