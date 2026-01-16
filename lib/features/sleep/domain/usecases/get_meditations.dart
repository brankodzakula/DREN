import 'package:injectable/injectable.dart';

import '../entities/meditation.dart';
import '../repositories/sleep_repository.dart';

/// Use case to retrieve meditation content
@injectable
class GetMeditations {
  final SleepRepository _repository;

  GetMeditations(this._repository);

  /// Get all available meditations
  Future<List<Meditation>> call() async {
    return _repository.getMeditations();
  }

  /// Get meditations filtered by category
  Future<List<Meditation>> byCategory(String category) async {
    return _repository.getMeditationsByCategory(category);
  }

  /// Get a specific meditation by ID
  Future<Meditation?> byId(String id) async {
    return _repository.getMeditationById(id);
  }
}
