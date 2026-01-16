import 'package:injectable/injectable.dart';

import '../../domain/entities/meditation.dart';

/// Datasource for meditation content
/// Currently uses bundled static data, can be extended to load from remote/assets
@lazySingleton
class MeditationDataSource {
  /// Get all available meditations
  Future<List<Meditation>> getMeditations() async {
    // Bundled meditation content
    return _bundledMeditations;
  }

  /// Get meditations by category
  Future<List<Meditation>> getMeditationsByCategory(String category) async {
    return _bundledMeditations
        .where((m) => m.category == category)
        .toList();
  }

  /// Get meditation by ID
  Future<Meditation?> getMeditationById(String id) async {
    try {
      return _bundledMeditations.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Mark meditation as downloaded (in-memory for now)
  final Map<String, bool> _downloadedStatus = {};

  Future<void> markMeditationDownloaded(String id, bool downloaded) async {
    _downloadedStatus[id] = downloaded;
  }

  bool isMeditationDownloaded(String id) {
    return _downloadedStatus[id] ?? false;
  }
}

/// Bundled meditation content
final List<Meditation> _bundledMeditations = [
  // Wind Down meditations
  const Meditation(
    id: 'wind_down_1',
    title: 'Evening Unwind',
    description: 'A gentle meditation to release the tension of the day and prepare for restful sleep.',
    category: 'wind_down',
    durationMinutes: 10,
    audioUrl: 'assets/audio/meditations/evening_unwind.mp3',
    thumbnailUrl: 'assets/images/meditations/evening_unwind.jpg',
    isDownloaded: true,
  ),
  const Meditation(
    id: 'wind_down_2',
    title: 'Body Scan Relaxation',
    description: 'Progressive relaxation through each part of your body to release physical tension.',
    category: 'wind_down',
    durationMinutes: 15,
    audioUrl: 'assets/audio/meditations/body_scan.mp3',
    thumbnailUrl: 'assets/images/meditations/body_scan.jpg',
    isDownloaded: true,
  ),
  const Meditation(
    id: 'wind_down_3',
    title: 'Breath of Calm',
    description: 'Simple breathing exercises to activate your parasympathetic nervous system.',
    category: 'wind_down',
    durationMinutes: 8,
    audioUrl: 'assets/audio/meditations/breath_calm.mp3',
    thumbnailUrl: 'assets/images/meditations/breath_calm.jpg',
    isDownloaded: true,
  ),

  // Sleep Stories
  const Meditation(
    id: 'sleep_story_1',
    title: 'The Quiet Forest',
    description: 'A soothing narrative journey through a peaceful forest at twilight.',
    category: 'sleep_story',
    durationMinutes: 20,
    audioUrl: 'assets/audio/meditations/quiet_forest.mp3',
    thumbnailUrl: 'assets/images/meditations/quiet_forest.jpg',
    isDownloaded: true,
  ),
  const Meditation(
    id: 'sleep_story_2',
    title: 'Ocean Voyage',
    description: 'Drift off to sleep on a gentle sailing journey across calm seas.',
    category: 'sleep_story',
    durationMinutes: 25,
    audioUrl: 'assets/audio/meditations/ocean_voyage.mp3',
    thumbnailUrl: 'assets/images/meditations/ocean_voyage.jpg',
    isDownloaded: true,
  ),
  const Meditation(
    id: 'sleep_story_3',
    title: 'Mountain Retreat',
    description: 'Find peace in a cozy cabin nestled in the mountains.',
    category: 'sleep_story',
    durationMinutes: 30,
    audioUrl: 'assets/audio/meditations/mountain_retreat.mp3',
    thumbnailUrl: 'assets/images/meditations/mountain_retreat.jpg',
    isDownloaded: true,
  ),

  // Soundscapes
  const Meditation(
    id: 'soundscape_1',
    title: 'Rain on Leaves',
    description: 'Gentle rain falling on forest leaves - nature\'s perfect white noise.',
    category: 'soundscape',
    durationMinutes: 60,
    audioUrl: 'assets/audio/meditations/rain_leaves.mp3',
    thumbnailUrl: 'assets/images/meditations/rain_leaves.jpg',
    isDownloaded: true,
  ),
  const Meditation(
    id: 'soundscape_2',
    title: 'Night Crickets',
    description: 'The calming sounds of a warm summer night in the countryside.',
    category: 'soundscape',
    durationMinutes: 60,
    audioUrl: 'assets/audio/meditations/night_crickets.mp3',
    thumbnailUrl: 'assets/images/meditations/night_crickets.jpg',
    isDownloaded: true,
  ),
  const Meditation(
    id: 'soundscape_3',
    title: 'Ocean Waves',
    description: 'Rhythmic ocean waves washing onto a sandy beach.',
    category: 'soundscape',
    durationMinutes: 60,
    audioUrl: 'assets/audio/meditations/ocean_waves.mp3',
    thumbnailUrl: 'assets/images/meditations/ocean_waves.jpg',
    isDownloaded: true,
  ),

  // SOS - Can't Sleep
  const Meditation(
    id: 'sos_1',
    title: 'Racing Mind Reset',
    description: 'When thoughts won\'t stop, this meditation helps quiet the mental chatter.',
    category: 'sos',
    durationMinutes: 12,
    audioUrl: 'assets/audio/meditations/racing_mind.mp3',
    thumbnailUrl: 'assets/images/meditations/racing_mind.jpg',
    isDownloaded: true,
  ),
  const Meditation(
    id: 'sos_2',
    title: 'Anxiety Release',
    description: 'Techniques to calm anxiety and worry that keeps you awake.',
    category: 'sos',
    durationMinutes: 15,
    audioUrl: 'assets/audio/meditations/anxiety_release.mp3',
    thumbnailUrl: 'assets/images/meditations/anxiety_release.jpg',
    isDownloaded: true,
  ),
  const Meditation(
    id: 'sos_3',
    title: 'Back to Sleep',
    description: 'For middle-of-the-night wake ups - helps you drift back to sleep.',
    category: 'sos',
    durationMinutes: 10,
    audioUrl: 'assets/audio/meditations/back_to_sleep.mp3',
    thumbnailUrl: 'assets/images/meditations/back_to_sleep.jpg',
    isDownloaded: true,
  ),
];
