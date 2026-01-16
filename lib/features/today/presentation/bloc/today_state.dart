import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/daily_progress.dart';
import '../../domain/entities/ring_summary.dart';
import '../../../protocol_engine/domain/entities/daily_protocol.dart';

part 'today_state.freezed.dart';

/// State for the Today feature BLoC
@freezed
class TodayState with _$TodayState {
  /// Initial state before any data is loaded
  const factory TodayState.initial() = TodayInitial;

  /// Loading state while fetching data
  const factory TodayState.loading() = TodayLoading;

  /// Loaded state with all today's data
  const factory TodayState.loaded({
    required DailyProgress progress,
    required RingSummary rings,
    DailyProtocol? protocol,
    required DateTime lastUpdated,
  }) = TodayLoaded;

  /// Error state when data fetch fails
  const factory TodayState.error({
    required String message,
    DailyProgress? previousProgress,
    RingSummary? previousRings,
  }) = TodayError;
}

/// Extension methods for TodayState
extension TodayStateExtension on TodayState {
  /// Check if state has data (loaded or error with previous data)
  bool get hasData => maybeMap(
        loaded: (_) => true,
        error: (e) => e.previousProgress != null,
        orElse: () => false,
      );

  /// Get progress if available
  DailyProgress? get progress => maybeMap(
        loaded: (s) => s.progress,
        error: (e) => e.previousProgress,
        orElse: () => null,
      );

  /// Get rings if available
  RingSummary? get rings => maybeMap(
        loaded: (s) => s.rings,
        error: (e) => e.previousRings,
        orElse: () => null,
      );

  /// Get protocol if available
  DailyProtocol? get protocol => maybeMap(
        loaded: (s) => s.protocol,
        orElse: () => null,
      );

  /// Check if currently loading
  bool get isLoading => this is TodayLoading;

  /// Check if in error state
  bool get isError => this is TodayError;

  /// Get error message if in error state
  String? get errorMessage => maybeMap(
        error: (e) => e.message,
        orElse: () => null,
      );
}
