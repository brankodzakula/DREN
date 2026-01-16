import 'package:drift/drift.dart';

/// User Profile Table
class UserProfiles extends Table {
  TextColumn get id => text()();
  DateTimeColumn get dateOfBirth => dateTime()();
  TextColumn get sex => text()(); // 'male' or 'female'
  RealColumn get heightCm => real()();
  RealColumn get weightKg => real()();
  RealColumn get targetWeightKg => real().nullable()();
  TextColumn get activityLevel => text()(); // sedentary, lightly_active, etc.
  TextColumn get longevityAmbition => text()(); // moderate, aggressive
  TextColumn get fitnessLevel => text()(); // beginner, intermediate, advanced
  TextColumn get dietaryRestrictions => text()(); // JSON array
  TextColumn get medicalConditions => text()(); // JSON array
  TextColumn get equipment => text()(); // JSON array
  IntColumn get preferredWorkoutMinutes => integer()();
  TextColumn get wakeTime => text()(); // Stored as HH:mm
  BoolColumn get healthDisclaimerAccepted => boolean()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Daily Protocol Table
class DailyProtocols extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();

  // Nutrition Protocol
  IntColumn get targetCalories => integer()();
  IntColumn get targetProtein => integer()();
  IntColumn get targetCarbs => integer()();
  IntColumn get targetFat => integer()();
  TextColumn get eatingWindowStart => text()(); // HH:mm
  TextColumn get eatingWindowEnd => text()(); // HH:mm

  // Exercise Protocol
  IntColumn get exerciseTargetMinutes => integer()();
  TextColumn get scheduledWorkoutId => text().nullable()();
  IntColumn get estimatedCaloriesBurn => integer()();
  BoolColumn get isRestDay => boolean()();

  // Sleep Protocol
  TextColumn get targetBedtime => text()(); // HH:mm
  TextColumn get targetWakeTime => text()(); // HH:mm
  IntColumn get targetSleepMinutes => integer()();
  TextColumn get windDownStart => text()(); // HH:mm
  TextColumn get lastCaffeineCutoff => text()(); // HH:mm
  TextColumn get lastMealCutoff => text()(); // HH:mm

  // Supplements (JSON array)
  TextColumn get supplements => text()();

  DateTimeColumn get generatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Meal Entry Table
class MealEntries extends Table {
  TextColumn get id => text()();
  TextColumn get oderId => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get mealType => text()(); // breakfast, lunch, dinner, snack
  TextColumn get itemsJson => text()(); // Serialized FoodItem list
  IntColumn get totalCalories => integer()();
  RealColumn get totalProtein => real()();
  RealColumn get totalCarbs => real()();
  RealColumn get totalFat => real()();
  TextColumn get source => text()(); // manual, barcode, recipe, healthkit

  @override
  Set<Column> get primaryKey => {id};
}

/// Workout Session Table
class WorkoutSessions extends Table {
  TextColumn get id => text()();
  TextColumn get oderId => text()();
  TextColumn get workoutId => text().nullable()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  IntColumn get durationMinutes => integer()();
  IntColumn get caloriesBurned => integer()();
  TextColumn get category => text()();
  RealColumn get averageHeartRate => real().nullable()();
  RealColumn get maxHeartRate => real().nullable()();
  RealColumn get distanceMeters => real().nullable()();
  TextColumn get source => text()(); // app, healthkit, health_connect
  TextColumn get externalId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Sleep Session Table
class SleepSessions extends Table {
  TextColumn get id => text()();
  TextColumn get oderId => text()();
  DateTimeColumn get bedTime => dateTime()();
  DateTimeColumn get wakeTime => dateTime()();
  IntColumn get totalMinutes => integer()();
  IntColumn get deepSleepMinutes => integer()();
  IntColumn get lightSleepMinutes => integer()();
  IntColumn get remSleepMinutes => integer()();
  IntColumn get awakeMinutes => integer()();
  RealColumn get efficiency => real()();
  IntColumn get latencyMinutes => integer()();
  IntColumn get sleepScore => integer()();
  TextColumn get source => text()(); // app, healthkit, health_connect
  TextColumn get externalId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Sleep Habit Log Table
class SleepHabitLogs extends Table {
  TextColumn get id => text()();
  TextColumn get oderId => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get noCaffeineAfterCutoff => boolean()();
  BoolColumn get lastMealOnTime => boolean()();
  BoolColumn get screenFreeBeforeBed => boolean()();
  BoolColumn get roomTempOptimal => boolean()();
  BoolColumn get meditationCompleted => boolean()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Daily Progress Table
class DailyProgressEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get caloriesConsumed => integer()();
  IntColumn get caloriesBurned => integer()();
  IntColumn get exerciseMinutes => integer()();
  IntColumn get sleepMinutes => integer()();
  RealColumn get proteinGrams => real()();
  RealColumn get carbsGrams => real()();
  RealColumn get fatGrams => real()();
  IntColumn get stepsCount => integer()();
  RealColumn get weightKg => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Recipes Table (for Blueprint and custom recipes)
class Recipes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get imageUrl => text()();
  IntColumn get prepTimeMinutes => integer()();
  IntColumn get cookTimeMinutes => integer()();
  IntColumn get servings => integer()();
  TextColumn get ingredientsJson => text()(); // JSON array of RecipeIngredient
  TextColumn get instructionsJson => text()(); // JSON array of strings
  IntColumn get calories => integer()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fat => real()();
  RealColumn get fiber => real().nullable()();
  RealColumn get sugar => real().nullable()();
  TextColumn get dietaryTags => text()(); // JSON array
  TextColumn get allergens => text()(); // JSON array
  TextColumn get longevityRationale => text()();
  BoolColumn get isBlueprintRecipe => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Workouts Table (workout templates)
class Workouts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // strength, hiit, running, yoga, etc.
  IntColumn get durationMinutes => integer()();
  TextColumn get difficulty => text()(); // beginner, intermediate, advanced
  TextColumn get equipmentRequired => text()(); // JSON array
  IntColumn get estimatedCalories => integer()();
  TextColumn get exercisesJson => text()(); // JSON array of Exercise
  TextColumn get videoUrl => text().nullable()();
  TextColumn get thumbnailUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Cached Foods Table (from remote API searches)
class CachedFoods extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get brand => text().nullable()();
  RealColumn get servingSize => real()();
  TextColumn get servingUnit => text()();
  IntColumn get calories => integer()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fat => real()();
  RealColumn get fiber => real().nullable()();
  RealColumn get sugar => real().nullable()();
  RealColumn get sodium => real().nullable()();
  TextColumn get barcode => text().nullable()();
  TextColumn get databaseSource => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Custom Foods Table (manually entered)
class CustomFoods extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get brand => text().nullable()();
  RealColumn get servingSize => real()();
  TextColumn get servingUnit => text()();
  IntColumn get calories => integer()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fat => real()();
  RealColumn get fiber => real().nullable()();
  RealColumn get sugar => real().nullable()();
  RealColumn get sodium => real().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Meal Items Table (links meals to foods)
class MealItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mealId => text()();
  TextColumn get foodId => text()();
  RealColumn get quantity => real()();
  IntColumn get calories => integer()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fat => real()();
}

/// Recent Foods Table (tracks usage for quick access)
class RecentFoods extends Table {
  TextColumn get foodId => text()();
  DateTimeColumn get usedAt => dateTime()();
  IntColumn get useCount => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {foodId};
}

/// Favorite Foods Table
class FavoriteFoods extends Table {
  TextColumn get foodId => text()();
  DateTimeColumn get addedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {foodId};
}
