import 'package:injectable/injectable.dart';

import '../entities/workout.dart';
import '../repositories/exercise_repository.dart';

/// Use case to get today's scheduled workout
@injectable
class GetTodayWorkout {
  final ExerciseRepository _repository;

  GetTodayWorkout(this._repository);

  /// Execute the use case
  /// Returns null if it's a rest day or no workout is scheduled
  Future<Workout?> call() async {
    return _repository.getTodayWorkout();
  }
}
