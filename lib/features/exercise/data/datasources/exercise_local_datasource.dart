import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';

/// Local datasource for exercises loaded from bundled JSON asset
abstract class ExerciseLocalDataSource {
  /// Load all exercises from the bundled JSON
  Future<List<Exercise>> loadExercises();

  /// Load all workouts from the bundled JSON
  Future<List<Workout>> loadWorkouts();
}

@LazySingleton(as: ExerciseLocalDataSource)
class ExerciseLocalDataSourceImpl implements ExerciseLocalDataSource {
  static const String _assetPath = 'assets/data/exercises.json';

  List<Exercise>? _cachedExercises;
  List<Workout>? _cachedWorkouts;

  @override
  Future<List<Exercise>> loadExercises() async {
    if (_cachedExercises != null) {
      return _cachedExercises!;
    }

    final jsonString = await rootBundle.loadString(_assetPath);
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;
    final exercisesList = jsonData['exercises'] as List<dynamic>;

    _cachedExercises = exercisesList
        .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
        .toList();

    return _cachedExercises!;
  }

  @override
  Future<List<Workout>> loadWorkouts() async {
    if (_cachedWorkouts != null) {
      return _cachedWorkouts!;
    }

    // First ensure exercises are loaded
    final exercises = await loadExercises();
    final exerciseMap = {for (var e in exercises) e.id: e};

    final jsonString = await rootBundle.loadString(_assetPath);
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;
    final workoutsList = jsonData['workouts'] as List<dynamic>;

    _cachedWorkouts = workoutsList.map((w) {
      final workoutJson = w as Map<String, dynamic>;
      final exerciseIds = (workoutJson['exercises'] as List<dynamic>)
          .map((e) => e as String)
          .toList();

      // Map exercise IDs to full Exercise objects
      final workoutExercises = exerciseIds
          .map((id) => exerciseMap[id])
          .whereType<Exercise>()
          .toList();

      return Workout(
        id: workoutJson['id'] as String,
        name: workoutJson['name'] as String,
        category: workoutJson['category'] as String,
        durationMinutes: workoutJson['durationMinutes'] as int,
        difficulty: workoutJson['difficulty'] as String,
        equipmentRequired: (workoutJson['equipmentRequired'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        estimatedCalories: workoutJson['estimatedCalories'] as int,
        exercises: workoutExercises,
        videoUrl: workoutJson['videoUrl'] as String?,
        thumbnailUrl: workoutJson['thumbnailUrl'] as String?,
      );
    }).toList();

    return _cachedWorkouts!;
  }
}
