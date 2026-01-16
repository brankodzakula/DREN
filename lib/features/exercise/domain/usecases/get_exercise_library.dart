import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/exercise_repository.dart';

/// Use case to get the complete exercise library
@injectable
class GetExerciseLibrary {
  final ExerciseRepository _repository;

  GetExerciseLibrary(this._repository);

  /// Get all available workouts
  Future<List<Workout>> call() async {
    return _repository.getExerciseLibrary();
  }

  /// Get workouts filtered by category
  Future<List<Workout>> byCategory(String category) async {
    return _repository.getWorkoutsByCategory(category);
  }

  /// Get workouts filtered by difficulty
  Future<List<Workout>> byDifficulty(String difficulty) async {
    return _repository.getWorkoutsByDifficulty(difficulty);
  }

  /// Get all individual exercises
  Future<List<Exercise>> getAllExercises() async {
    return _repository.getAllExercises();
  }

  /// Get exercises by muscle group
  Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup) async {
    return _repository.getExercisesByMuscleGroup(muscleGroup);
  }

  /// Get alternative exercises for swapping
  Future<List<Exercise>> getAlternatives(String exerciseId) async {
    return _repository.getAlternatives(exerciseId);
  }
}
