import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_session.freezed.dart';
part 'sleep_session.g.dart';

/// Represents a sleep session with detailed sleep stage data
@freezed
class SleepSession with _$SleepSession {
  const factory SleepSession({
    required String id,
    required String oderId,
    required DateTime bedTime,
    required DateTime wakeTime,
    required int totalMinutes,
    required int deepSleepMinutes,
    required int lightSleepMinutes,
    required int remSleepMinutes,
    required int awakeMinutes,
    required double efficiency, // 0.0 - 1.0
    required int latencyMinutes, // Time to fall asleep
    required int sleepScore, // 0-100
    required String source, // app, healthkit, health_connect
    String? externalId,
  }) = _SleepSession;

  factory SleepSession.fromJson(Map<String, dynamic> json) =>
      _$SleepSessionFromJson(json);
}
