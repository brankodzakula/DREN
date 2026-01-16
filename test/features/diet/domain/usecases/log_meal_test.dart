import 'package:dren/features/diet/domain/entities/food_item.dart';
import 'package:dren/features/diet/domain/entities/meal_entry.dart';
import 'package:dren/features/diet/domain/repositories/diet_repository.dart';
import 'package:dren/features/diet/domain/usecases/log_meal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDietRepository extends Mock implements DietRepository {}

void main() {
  late LogMeal logMeal;
  late MockDietRepository mockRepository;

  // Test data
  final testFood = const FoodItem(
    id: 'food_1',
    name: 'Chicken Breast',
    servingSize: 100,
    servingUnit: 'g',
    calories: 165,
    protein: 31,
    carbs: 0,
    fat: 3.6,
    databaseSource: 'usda',
  );

  final testFood2 = const FoodItem(
    id: 'food_2',
    name: 'Brown Rice',
    servingSize: 100,
    servingUnit: 'g',
    calories: 111,
    protein: 2.6,
    carbs: 23,
    fat: 0.9,
    databaseSource: 'usda',
  );

  setUpAll(() {
    registerFallbackValue(MealEntry(
      id: 'fallback',
      oderId: 'fallback',
      timestamp: DateTime.now(),
      mealType: 'lunch',
      items: [],
      totalCalories: 0,
      totalProtein: 0,
      totalCarbs: 0,
      totalFat: 0,
      source: 'manual',
    ));
  });

  setUp(() {
    mockRepository = MockDietRepository();
    logMeal = LogMeal(mockRepository);
  });

  group('LogMeal', () {
    group('call', () {
      test('logs meal with correct data', () async {
        final timestamp = DateTime(2024, 1, 15, 12, 30);

        when(() => mockRepository.logMeal(any())).thenAnswer((invocation) async {
          final meal = invocation.positionalArguments[0] as MealEntry;
          return meal;
        });

        final result = await logMeal(
          mealType: MealType.lunch,
          items: [testFood, testFood2],
          source: MealSource.manual,
          timestamp: timestamp,
        );

        expect(result.mealType, MealType.lunch);
        expect(result.source, MealSource.manual);
        expect(result.items.length, 2);
        expect(result.totalCalories, 276); // 165 + 111
        expect(result.totalProtein, 33.6); // 31 + 2.6
        expect(result.totalCarbs, 23); // 0 + 23
        expect(result.totalFat, 4.5); // 3.6 + 0.9

        verify(() => mockRepository.logMeal(any())).called(1);
      });

      test('generates correct order ID from timestamp', () async {
        final timestamp = DateTime(2024, 3, 5, 9, 7, 30);

        when(() => mockRepository.logMeal(any())).thenAnswer((invocation) async {
          final meal = invocation.positionalArguments[0] as MealEntry;
          return meal;
        });

        final result = await logMeal(
          mealType: MealType.breakfast,
          items: [testFood],
          source: MealSource.manual,
          timestamp: timestamp,
        );

        expect(result.oderId, '20240305-090730');
      });

      test('uses current time when timestamp not provided', () async {
        when(() => mockRepository.logMeal(any())).thenAnswer((invocation) async {
          final meal = invocation.positionalArguments[0] as MealEntry;
          return meal;
        });

        final before = DateTime.now();
        final result = await logMeal(
          mealType: MealType.snack,
          items: [testFood],
          source: MealSource.manual,
        );
        final after = DateTime.now();

        expect(
          result.timestamp.isAfter(before.subtract(const Duration(seconds: 1))),
          isTrue,
        );
        expect(
          result.timestamp.isBefore(after.add(const Duration(seconds: 1))),
          isTrue,
        );
      });
    });

    group('update', () {
      test('updates existing meal', () async {
        final meal = MealEntry(
          id: 'meal_1',
          oderId: '20240115-123000',
          timestamp: DateTime(2024, 1, 15, 12, 30),
          mealType: MealType.lunch,
          items: [testFood],
          totalCalories: 165,
          totalProtein: 31,
          totalCarbs: 0,
          totalFat: 3.6,
          source: MealSource.manual,
        );

        when(() => mockRepository.updateMeal(any()))
            .thenAnswer((_) async => meal);

        final result = await logMeal.update(meal);

        expect(result, meal);
        verify(() => mockRepository.updateMeal(meal)).called(1);
      });
    });

    group('delete', () {
      test('deletes meal by ID', () async {
        when(() => mockRepository.deleteMeal(any()))
            .thenAnswer((_) async => {});

        await logMeal.delete('meal_1');

        verify(() => mockRepository.deleteMeal('meal_1')).called(1);
      });
    });

    group('quickLog', () {
      test('logs single food item with scaling', () async {
        when(() => mockRepository.logMeal(any())).thenAnswer((invocation) async {
          final meal = invocation.positionalArguments[0] as MealEntry;
          return meal;
        });

        final result = await logMeal.quickLog(
          food: testFood,
          mealType: MealType.snack,
          quantity: 2.0, // 2x serving
        );

        expect(result.mealType, MealType.snack);
        expect(result.items.length, 1);
        // 2x100g serving = 200g
        expect(result.items.first.servingSize, 200);
        expect(result.items.first.calories, 330); // 165 * 2
        expect(result.items.first.protein, 62); // 31 * 2
      });

      test('logs single food item with default quantity', () async {
        when(() => mockRepository.logMeal(any())).thenAnswer((invocation) async {
          final meal = invocation.positionalArguments[0] as MealEntry;
          return meal;
        });

        final result = await logMeal.quickLog(
          food: testFood,
          mealType: MealType.breakfast,
        );

        expect(result.items.first.servingSize, 100);
        expect(result.items.first.calories, 165);
      });
    });
  });

  group('FoodItem', () {
    test('scaled calculates nutrition correctly', () {
      final scaled = testFood.scaled(200); // 200g = 2x serving

      expect(scaled.servingSize, 200);
      expect(scaled.calories, 330);
      expect(scaled.protein, 62);
      expect(scaled.carbs, 0);
      expect(scaled.fat, 7.2);
    });

    test('displayName includes brand when present', () {
      const foodWithBrand = FoodItem(
        id: 'food_1',
        name: 'Greek Yogurt',
        brand: 'Fage',
        servingSize: 170,
        servingUnit: 'g',
        calories: 100,
        protein: 18,
        carbs: 6,
        fat: 0,
        databaseSource: 'manual',
      );

      expect(foodWithBrand.displayName, 'Greek Yogurt (Fage)');
      expect(testFood.displayName, 'Chicken Breast');
    });

    test('calculatedCalories matches macro sum', () {
      // 31 * 4 + 0 * 4 + 3.6 * 9 = 124 + 0 + 32.4 = 156.4 ≈ 156
      expect(testFood.calculatedCalories, 156);
    });
  });

  group('MealEntry', () {
    test('fromItems calculates totals correctly', () {
      final meal = MealEntry.fromItems(
        id: 'meal_1',
        oderId: '20240115-123000',
        timestamp: DateTime(2024, 1, 15, 12, 30),
        mealType: MealType.lunch,
        items: [testFood, testFood2],
        source: MealSource.manual,
      );

      expect(meal.totalCalories, 276);
      expect(meal.totalProtein, 33.6);
      expect(meal.totalCarbs, 23);
      expect(meal.totalFat, 4.5);
    });

    test('displayTime formats correctly', () {
      final morningMeal = MealEntry.fromItems(
        id: 'meal_1',
        oderId: '20240115-073000',
        timestamp: DateTime(2024, 1, 15, 7, 30),
        mealType: MealType.breakfast,
        items: [testFood],
        source: MealSource.manual,
      );

      final afternoonMeal = MealEntry.fromItems(
        id: 'meal_2',
        oderId: '20240115-143000',
        timestamp: DateTime(2024, 1, 15, 14, 30),
        mealType: MealType.lunch,
        items: [testFood],
        source: MealSource.manual,
      );

      expect(morningMeal.displayTime, '7:30 AM');
      expect(afternoonMeal.displayTime, '2:30 PM');
    });

    test('mealTypeDisplay returns correct display names', () {
      expect(
        MealEntry.fromItems(
          id: 'meal_1',
          oderId: '20240115-073000',
          timestamp: DateTime.now(),
          mealType: MealType.breakfast,
          items: [],
          source: MealSource.manual,
        ).mealTypeDisplay,
        'Breakfast',
      );
      expect(
        MealEntry.fromItems(
          id: 'meal_2',
          oderId: '20240115-123000',
          timestamp: DateTime.now(),
          mealType: MealType.lunch,
          items: [],
          source: MealSource.manual,
        ).mealTypeDisplay,
        'Lunch',
      );
      expect(
        MealEntry.fromItems(
          id: 'meal_3',
          oderId: '20240115-190000',
          timestamp: DateTime.now(),
          mealType: MealType.dinner,
          items: [],
          source: MealSource.manual,
        ).mealTypeDisplay,
        'Dinner',
      );
      expect(
        MealEntry.fromItems(
          id: 'meal_4',
          oderId: '20240115-100000',
          timestamp: DateTime.now(),
          mealType: MealType.snack,
          items: [],
          source: MealSource.manual,
        ).mealTypeDisplay,
        'Snack',
      );
    });
  });
}
