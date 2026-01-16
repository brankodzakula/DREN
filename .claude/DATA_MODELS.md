# Dren Data Models

All models use Freezed for immutability and code generation.

## User Profile

```dart
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required DateTime dateOfBirth,
    required String sex,                    // 'male' or 'female'
    required double heightCm,
    required double weightKg,
    double? targetWeightKg,                 // null = maintain
    required String activityLevel,          // sedentary, lightly_active, moderately_active, very_active, extra_active
    required String longevityAmbition,      // moderate, aggressive
    required String fitnessLevel,           // beginner, intermediate, advanced
    required List<String> dietaryRestrictions,
    required List<String> medicalConditions,
    required List<String> equipment,
    required int preferredWorkoutMinutes,
    required TimeOfDay wakeTime,
    required bool healthDisclaimerAccepted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile;
  
  factory UserProfile.fromJson(Map<String, dynamic> json) => 
      _$UserProfileFromJson(json);
}
```

### Activity Level Options
| Value | Multiplier | Description |
|-------|------------|-------------|
| sedentary | 1.2 | Desk job, little/no exercise |
| lightly_active | 1.375 | Light exercise 1-3 days/week |
| moderately_active | 1.55 | Moderate exercise 3-5 days/week |
| very_active | 1.725 | Hard exercise 6-7 days/week |
| extra_active | 1.9 | Physical job + intense training |

### Dietary Restrictions Options
- Vegetarian, Vegan, Pescatarian, Keto, Paleo, Gluten-Free, Dairy-Free, Nut-Free, Low-Sodium, Halal, Kosher

### Medical Conditions Options
- Diabetes Type 1, Diabetes Type 2, Heart Condition, Hypertension, Thyroid Disorder, Pregnancy, Joint Issues (Knee), Joint Issues (Hip), Joint Issues (Shoulder), Joint Issues (Back)

### Equipment Options
- None (Bodyweight), Dumbbells, Resistance Bands, Pull-up Bar, Kettlebell, Full Gym Access

## Daily Protocol

```dart
@freezed
class DailyProtocol with _$DailyProtocol {
  const factory DailyProtocol({
    required String id,
    required DateTime date,
    required NutritionProtocol nutrition,
    required ExerciseProtocol exercise,
    required SleepProtocol sleep,
    required List<SupplementRecommendation> supplements,
    required DateTime generatedAt,
  }) = _DailyProtocol;
  
  factory DailyProtocol.fromJson(Map<String, dynamic> json) => 
      _$DailyProtocolFromJson(json);
}

@freezed
class NutritionProtocol with _$NutritionProtocol {
  const factory NutritionProtocol({
    required int targetCalories,
    required int targetProtein,      // grams
    required int targetCarbs,        // grams
    required int targetFat,          // grams
    required TimeOfDay eatingWindowStart,
    required TimeOfDay eatingWindowEnd,
  }) = _NutritionProtocol;
  
  factory NutritionProtocol.fromJson(Map<String, dynamic> json) => 
      _$NutritionProtocolFromJson(json);
}

@freezed
class ExerciseProtocol with _$ExerciseProtocol {
  const factory ExerciseProtocol({
    required int targetMinutes,
    required Workout scheduledWorkout,
    required int estimatedCaloriesBurn,
    required bool isRestDay,
  }) = _ExerciseProtocol;
  
  factory ExerciseProtocol.fromJson(Map<String, dynamic> json) => 
      _$ExerciseProtocolFromJson(json);
}

@freezed
class SleepProtocol with _$SleepProtocol {
  const factory SleepProtocol({
    required TimeOfDay targetBedtime,
    required TimeOfDay targetWakeTime,
    required int targetSleepMinutes,     // Default 480 (8 hours)
    required TimeOfDay windDownStart,     // 60 min before bed
    required TimeOfDay lastCaffeineCutoff, // 9 hours after wake
    required TimeOfDay lastMealCutoff,    // 8 hours before bed
  }) = _SleepProtocol;
  
  factory SleepProtocol.fromJson(Map<String, dynamic> json) => 
      _$SleepProtocolFromJson(json);
}

@freezed
class SupplementRecommendation with _$SupplementRecommendation {
  const factory SupplementRecommendation({
    required String name,
    required String dosage,
    required String timing,           // morning, evening, with_meal
    required String rationale,
    required bool isCoreTier,         // Tier 1 vs Tier 2
  }) = _SupplementRecommendation;
  
  factory SupplementRecommendation.fromJson(Map<String, dynamic> json) => 
      _$SupplementRecommendationFromJson(json);
}
```

## Meal and Food Tracking

```dart
@freezed
class MealEntry with _$MealEntry {
  const factory MealEntry({
    required String id,
    required String oderId,            // Order/sequence ID for the day
    required DateTime timestamp,
    required String mealType,          // breakfast, lunch, dinner, snack
    required List<FoodItem> items,
    required int totalCalories,
    required double totalProtein,
    required double totalCarbs,
    required double totalFat,
    required String source,            // manual, barcode, recipe, healthkit
  }) = _MealEntry;
  
  factory MealEntry.fromJson(Map<String, dynamic> json) => 
      _$MealEntryFromJson(json);
}

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String id,
    required String name,
    String? brand,
    required double servingSize,
    required String servingUnit,       // g, ml, oz, cup, piece
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
    double? fiber,
    double? sugar,
    double? sodium,
    String? barcode,
    required String databaseSource,    // usda, open_food_facts, manual, recipe
  }) = _FoodItem;
  
  factory FoodItem.fromJson(Map<String, dynamic> json) => 
      _$FoodItemFromJson(json);
}

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required int prepTimeMinutes,
    required int cookTimeMinutes,
    required int servings,
    required List<RecipeIngredient> ingredients,
    required List<String> instructions,
    required NutritionPerServing nutrition,
    required List<String> dietaryTags,
    required List<String> allergens,
    required String longevityRationale,
    required bool isBlueprintRecipe,   // Core Blueprint meal
  }) = _Recipe;
  
  factory Recipe.fromJson(Map<String, dynamic> json) => 
      _$RecipeFromJson(json);
}

@freezed
class RecipeIngredient with _$RecipeIngredient {
  const factory RecipeIngredient({
    required String name,
    required double amount,
    required String unit,
    String? notes,                     // "diced", "optional"
  }) = _RecipeIngredient;
  
  factory RecipeIngredient.fromJson(Map<String, dynamic> json) => 
      _$RecipeIngredientFromJson(json);
}

@freezed
class NutritionPerServing with _$NutritionPerServing {
  const factory NutritionPerServing({
    required int calories,
    required double protein,
    required double carbs,
    required double fat,
    double? fiber,
    double? sugar,
  }) = _NutritionPerServing;
  
  factory NutritionPerServing.fromJson(Map<String, dynamic> json) => 
      _$NutritionPerServingFromJson(json);
}
```

## Workout Tracking

```dart
@freezed
class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String name,
    required String category,          // strength, hiit, running, yoga, core, cycling, swimming
    required int durationMinutes,
    required String difficulty,        // beginner, intermediate, advanced
    required List<String> equipmentRequired,
    required int estimatedCalories,
    required List<Exercise> exercises,
    String? videoUrl,
    String? thumbnailUrl,
  }) = _Workout;
  
  factory Workout.fromJson(Map<String, dynamic> json) => 
      _$WorkoutFromJson(json);
}

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required String muscleGroup,       // chest, back, shoulders, arms, legs, core, full_body
    required int sets,
    required int reps,                 // 0 for time-based (use durationSeconds)
    int? durationSeconds,              // For planks, cardio intervals
    required int restSeconds,
    String? videoUrl,
    String? instructions,
    List<String>? alternatives,        // Swap-out options
    List<String>? contraindications,   // Medical conditions to avoid
  }) = _Exercise;
  
  factory Exercise.fromJson(Map<String, dynamic> json) => 
      _$ExerciseFromJson(json);
}

@freezed
class WorkoutSession with _$WorkoutSession {
  const factory WorkoutSession({
    required String id,
    required String oderId,
    String? workoutId,                 // null if from HealthKit
    required DateTime startTime,
    required DateTime endTime,
    required int durationMinutes,
    required int caloriesBurned,
    required String category,
    double? averageHeartRate,
    double? maxHeartRate,
    double? distanceMeters,
    required String source,            // app, healthkit, health_connect
    String? externalId,                // HealthKit/HC UUID
  }) = _WorkoutSession;
  
  factory WorkoutSession.fromJson(Map<String, dynamic> json) => 
      _$WorkoutSessionFromJson(json);
}

enum WorkoutCategory {
  strength,
  hiit,
  running,
  yoga,
  core,
  cycling,
  swimming,
}

enum DifficultyLevel {
  beginner,
  intermediate,
  advanced,
}
```

## Sleep Tracking

```dart
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
    required double efficiency,        // 0.0 - 1.0
    required int latencyMinutes,       // Time to fall asleep
    required int sleepScore,           // 0-100
    required String source,            // app, healthkit, health_connect
    String? externalId,
  }) = _SleepSession;
  
  factory SleepSession.fromJson(Map<String, dynamic> json) => 
      _$SleepSessionFromJson(json);
}

@freezed
class SleepHabitLog with _$SleepHabitLog {
  const factory SleepHabitLog({
    required String id,
    required String oderId,
    required DateTime date,
    required bool noCaffeineAfterCutoff,
    required bool lastMealOnTime,
    required bool screenFreeBeforeBed,
    required bool roomTempOptimal,
    required bool meditationCompleted,
    String? notes,
  }) = _SleepHabitLog;
  
  factory SleepHabitLog.fromJson(Map<String, dynamic> json) => 
      _$SleepHabitLogFromJson(json);
}
```

## Progress Tracking

```dart
@freezed
class DailyProgress with _$DailyProgress {
  const factory DailyProgress({
    required String id,
    required DateTime date,
    required int caloriesConsumed,
    required int caloriesBurned,
    required int exerciseMinutes,
    required int sleepMinutes,         // Previous night
    required double proteinGrams,
    required double carbsGrams,
    required double fatGrams,
    required int stepsCount,
    double? weightKg,                  // If logged
  }) = _DailyProgress;
  
  factory DailyProgress.fromJson(Map<String, dynamic> json) => 
      _$DailyProgressFromJson(json);
}

@freezed
class WeeklyStats with _$WeeklyStats {
  const factory WeeklyStats({
    required DateTime weekStart,
    required int avgCaloriesConsumed,
    required int avgCaloriesBurned,
    required int totalExerciseMinutes,
    required double avgSleepHours,
    required double avgSleepScore,
    required int workoutsCompleted,
    required double protocolAdherence,  // 0.0 - 1.0
  }) = _WeeklyStats;
  
  factory WeeklyStats.fromJson(Map<String, dynamic> json) => 
      _$WeeklyStatsFromJson(json);
}
```

## Meditation Content

```dart
@freezed
class Meditation with _$Meditation {
  const factory Meditation({
    required String id,
    required String title,
    required String description,
    required String category,          // wind_down, sleep_story, soundscape, sos
    required int durationMinutes,
    required String audioUrl,
    required String thumbnailUrl,
    required bool isDownloaded,
  }) = _Meditation;
  
  factory Meditation.fromJson(Map<String, dynamic> json) => 
      _$MeditationFromJson(json);
}
```

## Blueprint Core Recipes (Hardcoded Data)

```dart
// These are the core Blueprint meals to seed in the database
final blueprintRecipes = [
  Recipe(
    id: 'super_veggie',
    name: 'Super Veggie',
    description: 'The foundation meal of the Blueprint protocol',
    calories: 380,
    protein: 26,
    carbs: 64,
    fat: 7,
    ingredients: ['Black Lentils', 'Broccoli', 'Cauliflower', 'Mushrooms', 'Garlic', 'Ginger'],
    isBlueprintRecipe: true,
  ),
  Recipe(
    id: 'nutty_pudding',
    name: 'Nutty Pudding',
    description: 'Nutrient-dense breakfast pudding',
    calories: 430,
    protein: 20,
    carbs: 30,
    fat: 32,
    ingredients: ['Macadamia Nuts', 'Walnuts', 'Berries', 'Pea Protein', 'Cocoa'],
    isBlueprintRecipe: true,
  ),
  Recipe(
    id: 'evoo_shot',
    name: 'EVOO Shot',
    description: 'Extra virgin olive oil for healthy fats',
    calories: 370,
    protein: 0,
    carbs: 0,
    fat: 42,
    ingredients: ['Extra Virgin Olive Oil (3 tbsp)'],
    isBlueprintRecipe: true,
  ),
];
```

## Enums Summary

```dart
enum MealType { breakfast, lunch, dinner, snack }
enum WorkoutCategory { strength, hiit, running, yoga, core, cycling, swimming }
enum DifficultyLevel { beginner, intermediate, advanced }
enum ActivityLevel { sedentary, lightly_active, moderately_active, very_active, extra_active }
enum LongevityAmbition { moderate, aggressive }
enum DataSource { manual, barcode, recipe, healthkit, health_connect, usda, open_food_facts }
enum MeditationType { wind_down, sleep_story, soundscape, sos }
enum SupplementTiming { morning, evening, with_meal }
```
