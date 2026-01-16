import 'package:freezed_annotation/freezed_annotation.dart';

part 'meditation.freezed.dart';
part 'meditation.g.dart';

/// Meditation audio content for sleep preparation
@freezed
class Meditation with _$Meditation {
  const factory Meditation({
    required String id,
    required String title,
    required String description,
    required String category, // wind_down, sleep_story, soundscape, sos
    required int durationMinutes,
    required String audioUrl,
    required String thumbnailUrl,
    required bool isDownloaded,
  }) = _Meditation;

  factory Meditation.fromJson(Map<String, dynamic> json) =>
      _$MeditationFromJson(json);
}

/// Categories for meditation content
enum MeditationCategory {
  windDown,
  sleepStory,
  soundscape,
  sos,
}

extension MeditationCategoryExtension on MeditationCategory {
  String get value {
    switch (this) {
      case MeditationCategory.windDown:
        return 'wind_down';
      case MeditationCategory.sleepStory:
        return 'sleep_story';
      case MeditationCategory.soundscape:
        return 'soundscape';
      case MeditationCategory.sos:
        return 'sos';
    }
  }

  String get displayName {
    switch (this) {
      case MeditationCategory.windDown:
        return 'Wind Down';
      case MeditationCategory.sleepStory:
        return 'Sleep Story';
      case MeditationCategory.soundscape:
        return 'Soundscape';
      case MeditationCategory.sos:
        return 'SOS';
    }
  }

  static MeditationCategory fromString(String value) {
    switch (value) {
      case 'wind_down':
        return MeditationCategory.windDown;
      case 'sleep_story':
        return MeditationCategory.sleepStory;
      case 'soundscape':
        return MeditationCategory.soundscape;
      case 'sos':
        return MeditationCategory.sos;
      default:
        return MeditationCategory.windDown;
    }
  }
}
