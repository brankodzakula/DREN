import 'package:bloc_test/bloc_test.dart';
import 'package:dren/features/diet/domain/entities/food_item.dart';
import 'package:dren/features/diet/domain/entities/meal_entry.dart';
import 'package:dren/features/diet/domain/entities/recipe.dart';
import 'package:dren/features/diet/domain/repositories/diet_repository.dart';
import 'package:dren/features/diet/domain/usecases/get_meals_for_date.dart';
import 'package:dren/features/diet/domain/usecases/get_recipes.dart';
import 'package:dren/features/diet/domain/usecases/log_meal.dart';
import 'package:dren/features/diet/domain/usecases/search_food.dart';
import 'package:dren/features/diet/presentation/bloc/diet_bloc.dart';
import 'package:dren/features/diet/presentation/bloc/diet_event.dart';
import 'package:dren/features/diet/presentation/bloc/diet_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks
class MockSearchFood extends Mock implements SearchFood {}

class MockLogMeal extends Mock implements LogMeal {}

class MockGetMealsForDate extends Mock implements GetMealsForDate {}

class MockGetRecipes extends Mock implements GetRecipes {}

class MockDietRepository extends Mock implements DietRepository {}

void main() {
  late DietBloc dietBloc;
  late MockSearchFood mockSearchFood;
  late MockLogMeal mockLogMeal;
  late MockGetMealsForDate mockGetMealsForDate;
  late MockGetRecipes mockGetRecipes;

  // Test data
  final testDate = DateTime(2024, 1, 15);

  final testFoodItem = FoodItem(
    id: 'test_food_1',
    name: 'Chicken Breast',
    servingSize: 100,
    servingUnit: 'g',
    calories: 165,
    protein: 31,
    carbs: 0,
    fat: 3.6,
    databaseSource: 'usda',
  );

  final testMealEntry = MealEntry(
    id: 'meal_1',
    oderId: '20240115-120000',
    timestamp: DateTime(2024, 1, 15, 12, 0),
    mealType: 'lunch',
    items: [testFoodItem],
    totalCalories: 165,
    totalProtein: 31,
    totalCarbs: 0,
    totalFat: 3.6,
    source: 'manual',
  );

  final testNutritionSummary = DailyNutritionSummary(
    date: testDate,
    totalCalories: 165,
    totalProtein: 31,
    totalCarbs: 0,
    totalFat: 3.6,
    mealCount: 1,
  );

  final emptyNutritionSummary = DailyNutritionSummary.empty(testDate);

  final testRecipe = Recipe(
    id: 'super_veggie',
    name: 'Super Veggie',
    description: 'Blueprint recipe',
    prepTimeMinutes: 15,
    cookTimeMinutes: 30,
    servings: 2,
    ingredients: [],
    instructions: [],
    nutrition: const NutritionPerServing(
      calories: 380,
      protein: 26,
      carbs: 64,
      fat: 7,
    ),
    dietaryTags: ['vegan'],
    allergens: [],
    isBlueprintRecipe: true,
  );

  setUp(() {
    mockSearchFood = MockSearchFood();
    mockLogMeal = MockLogMeal();
    mockGetMealsForDate = MockGetMealsForDate();
    mockGetRecipes = MockGetRecipes();

    // Setup default stubs
    when(() => mockGetMealsForDate(any())).thenAnswer((_) async => []);
    when(() => mockGetMealsForDate.getSummary(any()))
        .thenAnswer((_) async => emptyNutritionSummary);
    when(() => mockGetRecipes.blueprintOnly()).thenAnswer((_) async => []);
    when(() => mockSearchFood.getRecent()).thenAnswer((_) async => []);

    dietBloc = DietBloc(
      mockSearchFood,
      mockLogMeal,
      mockGetMealsForDate,
      mockGetRecipes,
    );
  });

  tearDown(() {
    dietBloc.close();
  });

  group('DietBloc', () {
    test('initial state is DietInitial', () {
      expect(dietBloc.state, equals(const DietState.initial()));
    });

    group('LoadMealsEvent', () {
      blocTest<DietBloc, DietState>(
        'emits [loading, loaded] when load succeeds',
        build: () {
          when(() => mockGetMealsForDate(any()))
              .thenAnswer((_) async => [testMealEntry]);
          when(() => mockGetMealsForDate.getSummary(any()))
              .thenAnswer((_) async => testNutritionSummary);
          when(() => mockGetRecipes.blueprintOnly())
              .thenAnswer((_) async => [testRecipe]);
          when(() => mockSearchFood.getRecent())
              .thenAnswer((_) async => [testFoodItem]);
          return dietBloc;
        },
        act: (bloc) => bloc.add(DietEvent.loadMeals(date: testDate)),
        expect: () => [
          const DietState.loading(),
          isA<DietLoaded>()
              .having((s) => s.meals.length, 'meals count', 1)
              .having((s) => s.nutritionSummary.totalCalories, 'calories', 165)
              .having((s) => s.quickLogRecipes.length, 'recipes count', 1)
              .having((s) => s.recentFoods.length, 'recent foods count', 1),
        ],
        verify: (_) {
          verify(() => mockGetMealsForDate(any())).called(1);
          verify(() => mockGetMealsForDate.getSummary(any())).called(1);
          verify(() => mockGetRecipes.blueprintOnly()).called(1);
          verify(() => mockSearchFood.getRecent()).called(1);
        },
      );

      blocTest<DietBloc, DietState>(
        'emits [loading, error] when load fails',
        build: () {
          when(() => mockGetMealsForDate(any()))
              .thenThrow(Exception('Database error'));
          return dietBloc;
        },
        act: (bloc) => bloc.add(DietEvent.loadMeals(date: testDate)),
        expect: () => [
          const DietState.loading(),
          isA<DietError>().having(
            (s) => s.message,
            'error message',
            contains('Failed to load meals'),
          ),
        ],
      );
    });

    group('SearchFoodEvent', () {
      blocTest<DietBloc, DietState>(
        'emits [searching, searchResults] when search succeeds',
        build: () {
          when(() => mockSearchFood(any()))
              .thenAnswer((_) async => [testFoodItem]);
          return dietBloc;
        },
        seed: () => DietLoaded(
          date: testDate,
          meals: [],
          nutritionSummary: emptyNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) => bloc.add(const DietEvent.searchFood(query: 'chicken')),
        wait: const Duration(milliseconds: 400), // Wait for debounce
        expect: () => [
          isA<DietSearching>().having((s) => s.query, 'query', 'chicken'),
          isA<DietSearchResults>()
              .having((s) => s.query, 'query', 'chicken')
              .having((s) => s.results.length, 'results count', 1),
        ],
        verify: (_) {
          verify(() => mockSearchFood('chicken')).called(1);
        },
      );

      blocTest<DietBloc, DietState>(
        'does not emit when query is empty and already in loaded state',
        build: () => dietBloc,
        seed: () => DietLoaded(
          date: testDate,
          meals: [],
          nutritionSummary: emptyNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) => bloc.add(const DietEvent.searchFood(query: '')),
        wait: const Duration(milliseconds: 400),
        expect: () => [], // No state change when query is empty and already loaded
      );

      blocTest<DietBloc, DietState>(
        'emits [searching, error] when search fails',
        build: () {
          when(() => mockSearchFood(any()))
              .thenThrow(Exception('Network error'));
          return dietBloc;
        },
        seed: () => DietLoaded(
          date: testDate,
          meals: [],
          nutritionSummary: emptyNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) => bloc.add(const DietEvent.searchFood(query: 'chicken')),
        wait: const Duration(milliseconds: 400),
        expect: () => [
          isA<DietSearching>(),
          isA<DietError>().having(
            (s) => s.message,
            'error message',
            contains('Search failed'),
          ),
        ],
      );
    });

    group('ClearSearchEvent', () {
      blocTest<DietBloc, DietState>(
        'returns to loaded state when clearing search',
        build: () => dietBloc,
        seed: () => DietSearchResults(
          previousState: DietLoaded(
            date: testDate,
            meals: [],
            nutritionSummary: emptyNutritionSummary,
            targets: NutritionTargets.defaults(),
            quickLogRecipes: [],
            recentFoods: [],
          ),
          query: 'chicken',
          results: [testFoodItem],
        ),
        act: (bloc) => bloc.add(const DietEvent.clearSearch()),
        expect: () => [
          isA<DietLoaded>(),
        ],
      );
    });

    group('ScanBarcodeEvent', () {
      blocTest<DietBloc, DietState>(
        'emits [searching, searchResults] when barcode found',
        build: () {
          when(() => mockSearchFood.byBarcode(any()))
              .thenAnswer((_) async => testFoodItem);
          return dietBloc;
        },
        seed: () => DietLoaded(
          date: testDate,
          meals: [],
          nutritionSummary: emptyNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) =>
            bloc.add(const DietEvent.scanBarcode(barcode: '1234567890')),
        expect: () => [
          isA<DietSearching>(),
          isA<DietSearchResults>()
              .having((s) => s.results.length, 'results count', 1),
        ],
      );

      blocTest<DietBloc, DietState>(
        'emits [searching, error] when barcode not found',
        build: () {
          when(() => mockSearchFood.byBarcode(any()))
              .thenAnswer((_) async => null);
          return dietBloc;
        },
        seed: () => DietLoaded(
          date: testDate,
          meals: [],
          nutritionSummary: emptyNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) =>
            bloc.add(const DietEvent.scanBarcode(barcode: '0000000000')),
        expect: () => [
          isA<DietSearching>(),
          isA<DietError>().having(
            (s) => s.message,
            'error message',
            contains('Product not found'),
          ),
        ],
      );
    });

    group('LogMealEvent', () {
      blocTest<DietBloc, DietState>(
        'emits [loaded] with updated data after logging meal',
        build: () {
          when(() => mockLogMeal(
                mealType: any(named: 'mealType'),
                items: any(named: 'items'),
                source: any(named: 'source'),
              )).thenAnswer((_) async => testMealEntry);
          when(() => mockGetMealsForDate(any()))
              .thenAnswer((_) async => [testMealEntry]);
          when(() => mockGetMealsForDate.getSummary(any()))
              .thenAnswer((_) async => testNutritionSummary);
          when(() => mockGetRecipes.blueprintOnly())
              .thenAnswer((_) async => []);
          when(() => mockSearchFood.getRecent()).thenAnswer((_) async => []);
          return dietBloc;
        },
        seed: () => DietLoaded(
          date: testDate,
          meals: [],
          nutritionSummary: emptyNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) => bloc.add(DietEvent.logMeal(
          mealType: 'lunch',
          items: [testFoodItem],
        )),
        expect: () => [
          isA<DietLoaded>()
              .having((s) => s.meals.length, 'meals count', 1)
              .having((s) => s.nutritionSummary.totalCalories, 'calories', 165),
        ],
        verify: (_) {
          verify(() => mockLogMeal(
                mealType: 'lunch',
                items: [testFoodItem],
                source: 'manual',
              )).called(1);
        },
      );
    });

    group('DeleteMealEvent', () {
      blocTest<DietBloc, DietState>(
        'emits [loaded] with updated data after deleting meal',
        build: () {
          when(() => mockLogMeal.delete(any())).thenAnswer((_) async {});
          when(() => mockGetMealsForDate(any())).thenAnswer((_) async => []);
          when(() => mockGetMealsForDate.getSummary(any()))
              .thenAnswer((_) async => emptyNutritionSummary);
          when(() => mockGetRecipes.blueprintOnly())
              .thenAnswer((_) async => []);
          when(() => mockSearchFood.getRecent()).thenAnswer((_) async => []);
          return dietBloc;
        },
        seed: () => DietLoaded(
          date: testDate,
          meals: [testMealEntry],
          nutritionSummary: testNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) => bloc.add(const DietEvent.deleteMeal(mealId: 'meal_1')),
        expect: () => [
          isA<DietLoaded>()
              .having((s) => s.meals.length, 'meals count', 0)
              .having((s) => s.nutritionSummary.totalCalories, 'calories', 0),
        ],
        verify: (_) {
          verify(() => mockLogMeal.delete('meal_1')).called(1);
        },
      );
    });

    group('ChangeDateEvent', () {
      blocTest<DietBloc, DietState>(
        'emits [loading, loaded] when changing date',
        build: () {
          when(() => mockGetMealsForDate(any())).thenAnswer((_) async => []);
          when(() => mockGetMealsForDate.getSummary(any()))
              .thenAnswer((_) async => emptyNutritionSummary);
          when(() => mockGetRecipes.blueprintOnly())
              .thenAnswer((_) async => []);
          when(() => mockSearchFood.getRecent()).thenAnswer((_) async => []);
          return dietBloc;
        },
        seed: () => DietLoaded(
          date: testDate,
          meals: [],
          nutritionSummary: emptyNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) => bloc.add(DietEvent.changeDate(
          date: DateTime(2024, 1, 16),
        )),
        expect: () => [
          const DietState.loading(),
          isA<DietLoaded>().having(
            (s) => s.date,
            'date',
            DateTime(2024, 1, 16),
          ),
        ],
      );
    });

    group('RefreshDietEvent', () {
      blocTest<DietBloc, DietState>(
        'emits [loaded] with fresh data when refreshing',
        build: () {
          when(() => mockGetMealsForDate(any()))
              .thenAnswer((_) async => [testMealEntry]);
          when(() => mockGetMealsForDate.getSummary(any()))
              .thenAnswer((_) async => testNutritionSummary);
          when(() => mockGetRecipes.blueprintOnly())
              .thenAnswer((_) async => [testRecipe]);
          when(() => mockSearchFood.getRecent())
              .thenAnswer((_) async => [testFoodItem]);
          return dietBloc;
        },
        seed: () => DietLoaded(
          date: testDate,
          meals: [],
          nutritionSummary: emptyNutritionSummary,
          targets: NutritionTargets.defaults(),
          quickLogRecipes: [],
          recentFoods: [],
        ),
        act: (bloc) => bloc.add(const DietEvent.refresh()),
        expect: () => [
          isA<DietLoaded>()
              .having((s) => s.meals.length, 'meals count', 1)
              .having((s) => s.nutritionSummary.totalCalories, 'calories', 165),
        ],
      );
    });
  });

  group('NutritionTargets', () {
    test('defaults() creates correct default values', () {
      final targets = NutritionTargets.defaults();

      expect(targets.targetCalories, 2000);
      expect(targets.targetProtein, 150);
      expect(targets.targetCarbs, 200);
      expect(targets.targetFat, 65);
      expect(targets.eatingWindowStart, '08:00');
      expect(targets.eatingWindowEnd, '18:00');
    });

    test('remainingCalories calculates correctly', () {
      final targets = NutritionTargets.defaults();

      expect(targets.remainingCalories(500), 1500);
      expect(targets.remainingCalories(2000), 0);
      expect(targets.remainingCalories(2500), -500);
    });

    test('isWithinEatingWindow returns correct value', () {
      final targets = NutritionTargets.defaults();

      expect(targets.isWithinEatingWindow(DateTime(2024, 1, 1, 10, 0)), true);
      expect(targets.isWithinEatingWindow(DateTime(2024, 1, 1, 8, 0)), true);
      expect(targets.isWithinEatingWindow(DateTime(2024, 1, 1, 18, 0)), true);
      expect(targets.isWithinEatingWindow(DateTime(2024, 1, 1, 7, 0)), false);
      expect(targets.isWithinEatingWindow(DateTime(2024, 1, 1, 19, 0)), false);
    });
  });

  group('DietLoaded extensions', () {
    test('caloriesProgress calculates correctly', () {
      final state = DietLoaded(
        date: testDate,
        meals: [testMealEntry],
        nutritionSummary: testNutritionSummary,
        targets: NutritionTargets.defaults(),
        quickLogRecipes: [],
        recentFoods: [],
      );

      expect(state.caloriesConsumed, 165);
      expect(state.caloriesRemaining, 2000 - 165);
      expect(state.caloriesProgress, closeTo(0.0825, 0.001));
    });

    test('macro progress calculates correctly', () {
      final state = DietLoaded(
        date: testDate,
        meals: [testMealEntry],
        nutritionSummary: testNutritionSummary,
        targets: NutritionTargets.defaults(),
        quickLogRecipes: [],
        recentFoods: [],
      );

      expect(state.proteinProgress, closeTo(31 / 150, 0.001));
      expect(state.carbsProgress, 0);
      expect(state.fatProgress, closeTo(3.6 / 65, 0.001));
    });
  });
}
