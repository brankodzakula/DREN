# Dren Development Prompts for Claude Code

## How to Use This Guide

1. Copy these files to your project's `.claude/` directory
2. Execute prompts in order - each builds on the previous
3. After each prompt, verify the exit criteria before proceeding
4. Update `instructions.md` phase status as you complete each phase

---

## Phase 1: Foundation

### Prompt 1.1 - Project Scaffold
```
Reference ARCHITECTURE.md. Create the Flutter project "dren" with:

1. Full folder structure as specified in ARCHITECTURE.md
2. pubspec.yaml with all dependencies listed
3. GetIt + Injectable setup in lib/app/di/injection.dart
4. GoRouter setup in lib/app/router/ with placeholder routes
5. Empty app.dart with MaterialApp.router configuration

Create folder structure only - no feature implementations yet.

Exit criteria: `flutter pub get` succeeds, no errors
```

### Prompt 1.2 - Theme and Design System
```
Reference DESIGN_SYSTEM.md. Create the complete theme system:

1. lib/core/theme/colors.dart - DrenColors class with all colors
2. lib/core/theme/typography.dart - DrenTypography class with all text styles
3. lib/core/theme/spacing.dart - DrenSpacing class with spacing constants
4. lib/core/theme/app_theme.dart - ThemeData configuration using above

Apply the theme in app.dart.

Exit criteria: App runs showing black background, no theme errors
```

### Prompt 1.3 - Database Setup
```
Reference ARCHITECTURE.md and DATA_MODELS.md. Set up Drift database:

1. Create lib/core/services/database/app_database.dart
2. Define tables for: UserProfile, DailyProtocol, MealEntry, WorkoutSession, SleepSession
3. Create DAOs for each table in lib/core/services/database/daos/
4. Configure encrypted storage using flutter_secure_storage
5. Register database as singleton in DI

Run: dart run build_runner build --delete-conflicting-outputs

Exit criteria: Database initializes without errors, tables created
```

### Prompt 1.4 - Shared Widgets
```
Reference DESIGN_SYSTEM.md. Create the shared widget library:

1. lib/shared/widgets/buttons/primary_button.dart - With loading state
2. lib/shared/widgets/buttons/secondary_button.dart - Outlined variant
3. lib/shared/widgets/cards/protocol_card.dart - Standard card component
4. lib/shared/widgets/rings/four_rings_widget.dart - CustomPainter implementation

Create a temporary debug screen that displays all widgets for visual verification.

Exit criteria: All widgets render correctly with proper colors and spacing
```

---

## Phase 2: Onboarding + Protocol Engine

### Prompt 2.1 - Onboarding Domain Layer
```
Reference DATA_MODELS.md. Create onboarding domain layer:

1. lib/features/onboarding/domain/entities/onboarding_data.dart - Freezed model for collected data
2. lib/features/onboarding/domain/repositories/onboarding_repository.dart - Interface
3. lib/features/onboarding/domain/usecases/save_user_profile.dart
4. lib/features/onboarding/domain/usecases/check_onboarding_complete.dart

Run build_runner after creating Freezed models.

Exit criteria: Code generates without errors
```

### Prompt 2.2 - Onboarding Data Layer
```
Create onboarding data layer:

1. lib/features/onboarding/data/models/onboarding_data_model.dart - DTO
2. lib/features/onboarding/data/repositories/onboarding_repository_impl.dart
3. Register repository in DI

Exit criteria: Repository can save and retrieve onboarding data from database
```

### Prompt 2.3 - Onboarding BLoC
```
Create onboarding presentation layer - BLoC only:

1. lib/features/onboarding/presentation/bloc/onboarding_state.dart - Freezed states
2. lib/features/onboarding/presentation/bloc/onboarding_event.dart - Freezed events
3. lib/features/onboarding/presentation/bloc/onboarding_bloc.dart - State machine
4. Register BLoC in DI

States needed: initial, collecting (with step index), validating, saving, complete, error
Events: nextStep, previousStep, updateField, submit

Exit criteria: BLoC unit tests pass
```

### Prompt 2.4 - Onboarding UI (Screens 1-5)
```
Reference SCREENS.md onboarding section. Create first 5 onboarding screens:

1. lib/features/onboarding/presentation/pages/onboarding_page.dart - PageView container
2. lib/features/onboarding/presentation/widgets/welcome_step.dart
3. lib/features/onboarding/presentation/widgets/birth_date_step.dart
4. lib/features/onboarding/presentation/widgets/sex_selection_step.dart
5. lib/features/onboarding/presentation/widgets/measurements_step.dart (height/weight)
6. lib/features/onboarding/presentation/widgets/target_weight_step.dart

Wire up to BLoC, implement navigation between steps.

Exit criteria: Can navigate through first 5 steps, data persists in BLoC state
```

### Prompt 2.5 - Onboarding UI (Screens 6-11)
```
Continue onboarding screens:

1. activity_level_step.dart - 5-option selection
2. goals_step.dart - Multi-select chips
3. wake_time_step.dart - Time picker
4. ambition_selection_step.dart - Card selection (moderate/aggressive)
5. health_permissions_step.dart - Platform permission request
6. disclaimer_step.dart - Legal acceptance

Exit criteria: Full onboarding flow completes, user profile saved to database
```

### Prompt 2.6 - Protocol Engine
```
Reference CALCULATIONS.md. Create protocol generation engine:

1. lib/core/utils/calculators/bmr_calculator.dart
2. lib/core/utils/calculators/tdee_calculator.dart
3. lib/core/utils/calculators/macro_calculator.dart
4. lib/core/utils/calculators/sleep_score_calculator.dart
5. lib/features/protocol_engine/domain/usecases/generate_daily_protocol.dart
6. lib/features/protocol_engine/domain/usecases/generate_sleep_schedule.dart

Include unit tests for all calculators with example values from CALCULATIONS.md.

Exit criteria: All calculator unit tests pass with expected values
```

---

## Phase 3: Today Tab

### Prompt 3.1 - Today Domain + Data
```
Create Today feature domain and data layers:

1. Domain entities: DailyProgress, RingSummary
2. Repository interface: TodayRepository
3. Use cases: GetDailyProgress, GetTodayProtocol
4. Data layer implementation
5. Register in DI

Exit criteria: Can fetch today's protocol and progress from database
```

### Prompt 3.2 - Today BLoC
```
Create Today presentation layer - BLoC:

1. TodayState with: initial, loading, loaded (with protocol, progress, rings)
2. TodayEvent: loadToday, refresh
3. TodayBloc implementation
4. Register in DI

Exit criteria: BLoC tests pass, state transitions work correctly
```

### Prompt 3.3 - Today UI
```
Reference SCREENS.md Today Tab section. Create Today page:

1. lib/features/today/presentation/pages/today_page.dart
2. Four rings widget integration with real data
3. Protocol summary cards (meals, workout, sleep)
4. Supplements checklist
5. Pull-to-refresh functionality

Exit criteria: Today tab displays with rings and protocol cards, data updates on refresh
```

---

## Phase 4: Diet Feature

### Prompt 4.1 - Diet Domain Layer
```
Reference DATA_MODELS.md diet entities. Create diet domain:

1. Entities: FoodItem, MealEntry, Recipe, NutritionPerServing
2. Repository interface: DietRepository
3. Use cases: SearchFood, LogMeal, GetMealsForDate, GetRecipes
4. Run build_runner

Exit criteria: Domain layer compiles, entities generate correctly
```

### Prompt 4.2 - Diet Data Layer
```
Reference API_SPECS.md. Create diet data layer:

1. lib/features/diet/data/datasources/usda_datasource.dart
2. lib/features/diet/data/datasources/open_food_facts_datasource.dart
3. lib/features/diet/data/datasources/local_food_datasource.dart (for favorites/recent)
4. lib/features/diet/data/repositories/diet_repository_impl.dart
5. Food search caching logic
6. Register in DI

Exit criteria: Can search USDA API and get results (test with "chicken")
```

### Prompt 4.3 - Diet BLoC
```
Create diet BLoC:

1. DietState: initial, loading, loaded (meals, protocol, macros), searching, error
2. DietEvent: loadMeals, searchFood, logMeal, deleteMeal, scanBarcode
3. DietBloc implementation with search debouncing

Exit criteria: BLoC tests pass, search returns results
```

### Prompt 4.4 - Diet UI
```
Reference SCREENS.md Diet Tab. Create diet pages:

1. lib/features/diet/presentation/pages/diet_page.dart - Main tab
2. Nutrition dashboard widget (calories bar, macro rings)
3. Eating window badge
4. Quick log section (Blueprint recipes)
5. Today's meals list with meal cards

Exit criteria: Diet tab displays, shows calorie progress and logged meals
```

### Prompt 4.5 - Food Search + Barcode
```
Create food search functionality:

1. lib/features/diet/presentation/pages/food_search_page.dart
2. Search results list
3. Recent/favorites sections
4. Barcode scanner integration using mobile_scanner
5. Food detail/portion selection bottom sheet

Exit criteria: Can search for food, scan barcodes, and log meals
```

---

## Phase 5: Exercise Feature

### Prompt 5.1 - Exercise Domain + Data
```
Reference DATA_MODELS.md workout entities. Create exercise layers:

1. Domain: Workout, Exercise, WorkoutSession entities
2. Repository interface
3. Use cases: GetTodayWorkout, GetExerciseLibrary, LogWorkoutSession
4. Data layer with bundled exercises.json asset
5. Register in DI

Exit criteria: Can load exercises from bundled JSON
```

### Prompt 5.2 - Exercise BLoC
```
Create exercise BLoC:

1. ExerciseState: initial, loading, loaded (todayWorkout, categories, history)
2. ExerciseEvent: loadExercises, startWorkout, completeWorkout, swapExercise
3. ExerciseBloc implementation

Exit criteria: BLoC tests pass
```

### Prompt 5.3 - Exercise UI
```
Reference SCREENS.md Exercise Tab. Create exercise pages:

1. exercise_page.dart - Main tab with today's workout
2. workout_card.dart - Green card with play button
3. exercise_list_item.dart - Exercise row with swap button
4. Category filter chips
5. Library browse section

Exit criteria: Exercise tab displays today's workout and library
```

### Prompt 5.4 - Active Workout Screen
```
Create active workout experience:

1. lib/features/exercise/presentation/pages/active_workout_page.dart
2. Timer display
3. Current exercise with sets/reps
4. Complete set button
5. Skip exercise option
6. Workout completion flow
7. Save workout session to database

Exit criteria: Can complete a workout from start to finish
```

---

## Phase 6: Sleep Feature

### Prompt 6.1 - Sleep Domain + Data
```
Reference DATA_MODELS.md sleep entities. Create sleep layers:

1. Domain: SleepSession, SleepHabitLog, Meditation entities
2. Repository interface
3. Use cases: GetLastNightSleep, GetSleepSchedule, LogSleepHabits
4. Data layer implementation

Exit criteria: Domain compiles, can save/retrieve sleep data
```

### Prompt 6.2 - Sleep BLoC
```
Create sleep BLoC:

1. SleepState: initial, loading, loaded (lastNight, schedule, habits, meditations)
2. SleepEvent: loadSleep, toggleHabit, startMeditation
3. SleepBloc implementation

Exit criteria: BLoC tests pass
```

### Prompt 6.3 - Sleep UI
```
Reference SCREENS.md Sleep Tab. Create sleep pages:

1. sleep_page.dart - Main tab
2. sleep_score_widget.dart - Score display with stage breakdown
3. circadian_dial.dart - 24-hour visualization
4. wind_down_checklist.dart - Interactive checklist
5. Meditation cards

Exit criteria: Sleep tab displays with score, schedule, and checklist
```

### Prompt 6.4 - Meditation Player
```
Create meditation functionality:

1. lib/features/sleep/presentation/pages/meditation_player_page.dart
2. Audio playback using just_audio
3. Play/pause controls
4. Progress indicator
5. Background audio support

Exit criteria: Can play meditation audio, works in background
```

---

## Phase 7: Health Platform Integration

### Prompt 7.1 - Health Service
```
Reference HEALTH_INTEGRATION.md. Create health service:

1. lib/core/services/health_service.dart
2. HealthKit permissions (iOS)
3. Health Connect permissions (Android)
4. Read methods: steps, calories, sleep, workouts
5. Write methods: meals, workouts
6. Register in DI

Exit criteria: Permissions request works on both platforms
```

### Prompt 7.2 - Health Sync
```
Integrate health data into existing features:

1. Sync external workouts to exercise tab
2. Import sleep data from wearables
3. Update calories out ring from health data
4. Add manual refresh trigger
5. Deduplication logic for workouts

Exit criteria: External workout data appears in app
```

---

## Phase 8: Polish + Testing

### Prompt 8.1 - Navigation Polish
```
Finalize navigation:

1. Tab bar with proper icons and colors
2. Splash screen with logo
3. Onboarding → Main navigation flow
4. Deep linking setup
5. Back button handling

Exit criteria: Full navigation flow works smoothly
```

### Prompt 8.2 - Settings Screen
```
Create settings:

1. lib/features/settings/presentation/pages/settings_page.dart
2. Profile editing
3. Protocol adjustment (ambition level)
4. Health platform connection status
5. Notification preferences
6. Data export/clear options

Exit criteria: Settings accessible and functional
```

### Prompt 8.3 - Testing Coverage
```
Add missing tests:

1. Unit tests for all use cases (target: 90% coverage)
2. Widget tests for shared components
3. Integration test for onboarding flow
4. Integration test for meal logging flow

Run: flutter test --coverage
Report coverage gaps.

Exit criteria: Coverage report shows 80%+ overall
```

### Prompt 8.4 - Final Polish
```
Final review and fixes:

1. Run flutter analyze - fix all warnings
2. Test on iOS Simulator and Android Emulator
3. Verify all screens match SCREENS.md wireframes
4. Check all colors match DESIGN_SYSTEM.md
5. Performance check - ensure smooth animations
6. Fix any UI overflow issues

Exit criteria: No analyzer warnings, app runs smoothly on both platforms
```

---

## Maintenance Prompts

### Adding a New Feature
```
I need to add [FEATURE_NAME]. Follow the clean architecture pattern:

1. First create domain layer (entities, repository interface, use cases)
2. Then data layer (models, datasources, repository implementation)
3. Then BLoC (state, events, bloc)
4. Finally UI (pages, widgets)

Register all components in DI. Include unit tests for BLoC.
```

### Fixing a Bug
```
There's a bug: [DESCRIPTION]

1. First, help me understand the current flow
2. Identify the root cause
3. Propose a fix
4. Implement the fix
5. Add a test to prevent regression
```

### Updating Design
```
Reference DESIGN_SYSTEM.md. I need to update [COMPONENT]:

1. Show me the current implementation
2. Compare with spec in DESIGN_SYSTEM.md
3. Update to match spec exactly
4. Verify no regressions in dependent components
```
