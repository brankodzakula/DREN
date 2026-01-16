# Dren Architecture Specification

## Project Structure

```
dren/
├── .claude/
│   ├── instructions.md              # Core context (always loaded)
│   ├── ARCHITECTURE.md              # This file
│   ├── DESIGN_SYSTEM.md
│   ├── DATA_MODELS.md
│   ├── SCREENS.md
│   ├── CALCULATIONS.md
│   ├── HEALTH_INTEGRATION.md
│   └── API_SPECS.md
│
├── lib/
│   ├── main.dart                    # App entry point
│   │
│   ├── app/
│   │   ├── app.dart                 # MaterialApp configuration
│   │   ├── router/
│   │   │   ├── app_router.dart      # GoRouter configuration
│   │   │   └── routes.dart          # Route constants
│   │   └── di/
│   │       └── injection.dart       # GetIt setup
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_constants.dart   # App-wide constants
│   │   │   └── api_constants.dart   # API endpoints
│   │   ├── theme/
│   │   │   ├── app_theme.dart       # ThemeData configuration
│   │   │   ├── colors.dart          # DrenColors class
│   │   │   ├── typography.dart      # DrenTypography class
│   │   │   └── spacing.dart         # DrenSpacing class
│   │   ├── services/
│   │   │   ├── health_service.dart
│   │   │   ├── nutrition_api_service.dart
│   │   │   ├── secure_storage_service.dart
│   │   │   └── local_database_service.dart
│   │   └── utils/
│   │       ├── extensions/
│   │       ├── validators/
│   │       └── calculators/
│   │           ├── bmr_calculator.dart
│   │           ├── tdee_calculator.dart
│   │           └── sleep_score_calculator.dart
│   │
│   ├── features/
│   │   ├── onboarding/
│   │   │   ├── data/
│   │   │   │   ├── models/
│   │   │   │   └── repositories/
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   ├── repositories/
│   │   │   │   └── usecases/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── pages/
│   │   │       └── widgets/
│   │   │
│   │   ├── today/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── pages/
│   │   │       │   └── today_page.dart
│   │   │       └── widgets/
│   │   │           ├── four_rings_widget.dart
│   │   │           └── protocol_summary_card.dart
│   │   │
│   │   ├── diet/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── usda_datasource.dart
│   │   │   │   │   └── open_food_facts_datasource.dart
│   │   │   │   ├── models/
│   │   │   │   └── repositories/
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   ├── repositories/
│   │   │   │   └── usecases/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── pages/
│   │   │       │   ├── diet_page.dart
│   │   │       │   ├── food_search_page.dart
│   │   │       │   └── recipe_detail_page.dart
│   │   │       └── widgets/
│   │   │           ├── macro_rings.dart
│   │   │           ├── meal_card.dart
│   │   │           └── recipe_card.dart
│   │   │
│   │   ├── exercise/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── pages/
│   │   │       │   ├── exercise_page.dart
│   │   │       │   ├── workout_detail_page.dart
│   │   │       │   └── active_workout_page.dart
│   │   │       └── widgets/
│   │   │           ├── workout_card.dart
│   │   │           └── exercise_list_item.dart
│   │   │
│   │   ├── sleep/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       ├── pages/
│   │   │       │   ├── sleep_page.dart
│   │   │       │   └── meditation_player_page.dart
│   │   │       └── widgets/
│   │   │           ├── sleep_score_widget.dart
│   │   │           ├── circadian_dial.dart
│   │   │           └── wind_down_checklist.dart
│   │   │
│   │   ├── protocol_engine/
│   │   │   ├── domain/
│   │   │   │   └── usecases/
│   │   │   │       ├── generate_daily_protocol.dart
│   │   │   │       └── adapt_protocol.dart
│   │   │   └── data/
│   │   │       └── models/
│   │   │
│   │   └── settings/
│   │       └── presentation/
│   │
│   └── shared/
│       ├── widgets/
│       │   ├── buttons/
│       │   │   └── primary_button.dart
│       │   ├── cards/
│       │   │   └── protocol_card.dart
│       │   └── rings/
│       │       └── four_rings_widget.dart
│       └── models/
│
├── test/
│   ├── unit/
│   ├── widget/
│   └── integration/
│
├── assets/
│   ├── data/
│   │   ├── exercises.json
│   │   └── blueprint_recipes.json
│   ├── audio/
│   │   └── meditations/
│   ├── images/
│   └── fonts/
│
├── android/
├── ios/
├── pubspec.yaml
└── README.md
```

## Dependencies (pubspec.yaml)

```yaml
name: dren
description: Longevity Protocol Engine
version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_bloc: ^8.1.3
  bloc: ^8.1.2
  
  # Dependency Injection
  get_it: ^7.6.4
  injectable: ^2.3.2
  
  # Navigation
  go_router: ^12.1.3
  
  # Health Integration
  health: ^10.2.0
  
  # Local Storage
  drift: ^2.14.1
  sqlite3_flutter_libs: ^0.5.0
  path_provider: ^2.1.0
  path: ^1.9.0
  flutter_secure_storage: ^9.0.0
  
  # Networking
  dio: ^5.4.0
  connectivity_plus: ^5.0.2
  
  # Audio
  just_audio: ^0.9.36
  audio_service: ^0.18.12
  
  # UI Components
  fl_chart: ^0.66.0
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.1
  
  # Barcode Scanning
  mobile_scanner: ^4.0.0
  
  # Utilities
  intl: ^0.18.1
  uuid: ^4.2.2
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  equatable: ^2.0.5
  dartz: ^0.10.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1
  build_runner: ^2.4.8
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  injectable_generator: ^2.4.1
  drift_dev: ^2.14.1
  mockito: ^5.4.4
  bloc_test: ^9.1.5

flutter:
  uses-material-design: true
  
  assets:
    - assets/data/
    - assets/audio/meditations/
    - assets/images/
```

## Dependency Injection Setup

### lib/app/di/injection.dart
```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
```

### Registration Pattern
```dart
// Services - Singleton
@singleton
class HealthService { }

// Repositories - LazySingleton
@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository { }

// BLoCs - Factory (new instance per use)
@injectable
class DietBloc extends Bloc<DietEvent, DietState> { }
```

## Navigation Setup

### lib/app/router/routes.dart
```dart
abstract class Routes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const today = '/home/today';
  static const diet = '/home/diet';
  static const exercise = '/home/exercise';
  static const sleep = '/home/sleep';
  static const foodSearch = '/diet/search';
  static const recipeDetail = '/diet/recipe/:id';
  static const workoutDetail = '/exercise/workout/:id';
  static const activeWorkout = '/exercise/active';
  static const meditationPlayer = '/sleep/meditation/:id';
  static const settings = '/settings';
}
```

### lib/app/router/app_router.dart
```dart
final goRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(path: Routes.today, builder: ...),
        GoRoute(path: Routes.diet, builder: ...),
        GoRoute(path: Routes.exercise, builder: ...),
        GoRoute(path: Routes.sleep, builder: ...),
      ],
    ),
  ],
);
```

## BLoC Pattern

### State Structure
```dart
@freezed
class DietState with _$DietState {
  const factory DietState.initial() = _Initial;
  const factory DietState.loading() = _Loading;
  const factory DietState.loaded({
    required List<MealEntry> meals,
    required NutritionProtocol protocol,
  }) = _Loaded;
  const factory DietState.error(String message) = _Error;
}
```

### Event Structure
```dart
@freezed
class DietEvent with _$DietEvent {
  const factory DietEvent.loadMeals(DateTime date) = _LoadMeals;
  const factory DietEvent.logMeal(MealEntry meal) = _LogMeal;
  const factory DietEvent.deleteMeal(String mealId) = _DeleteMeal;
}
```

## Database Pattern (Drift)

### Table Definition
```dart
class MealEntries extends Table {
  TextColumn get id => text()();
  TextColumn get oderId => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get mealType => text()();
  IntColumn get totalCalories => integer()();
  RealColumn get totalProtein => real()();
  RealColumn get totalCarbs => real()();
  RealColumn get totalFat => real()();
  TextColumn get itemsJson => text()(); // Serialized FoodItem list
  TextColumn get source => text()();
  
  @override
  Set<Column> get primaryKey => {id};
}
```

### DAO Pattern
```dart
@DriftAccessor(tables: [MealEntries])
class MealEntriesDao extends DatabaseAccessor<AppDatabase> 
    with _$MealEntriesDaoMixin {
  
  MealEntriesDao(AppDatabase db) : super(db);
  
  Future<List<MealEntry>> getMealsForDate(DateTime date) { }
  Future<void> insertMeal(MealEntriesCompanion meal) { }
  Future<void> deleteMeal(String id) { }
}
```

## Error Handling Pattern

Use Either from dartz for use case results:
```dart
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class GetDailyProtocol implements UseCase<DailyProtocol, DateTime> {
  @override
  Future<Either<Failure, DailyProtocol>> call(DateTime date) async {
    try {
      final protocol = await repository.getProtocol(date);
      return Right(protocol);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
```

## Testing Structure

```
test/
├── unit/
│   ├── calculators/
│   │   ├── bmr_calculator_test.dart
│   │   └── sleep_score_calculator_test.dart
│   └── usecases/
│       └── generate_daily_protocol_test.dart
├── widget/
│   ├── four_rings_widget_test.dart
│   └── primary_button_test.dart
└── integration/
    └── onboarding_flow_test.dart
```

## Build Commands

```bash
# Get dependencies
flutter pub get

# Generate code (Freezed, Injectable, Drift)
dart run build_runner build --delete-conflicting-outputs

# Run tests
flutter test

# Run with verbose logging
flutter run --verbose

# Build release
flutter build ios --release
flutter build apk --release
```
