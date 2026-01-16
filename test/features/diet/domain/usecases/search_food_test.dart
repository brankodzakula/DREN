import 'package:dren/features/diet/domain/entities/food_item.dart';
import 'package:dren/features/diet/domain/repositories/diet_repository.dart';
import 'package:dren/features/diet/domain/usecases/search_food.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDietRepository extends Mock implements DietRepository {}

void main() {
  late SearchFood searchFood;
  late MockDietRepository mockRepository;

  // Test data
  final testFoods = [
    const FoodItem(
      id: 'food_1',
      name: 'Chicken Breast',
      servingSize: 100,
      servingUnit: 'g',
      calories: 165,
      protein: 31,
      carbs: 0,
      fat: 3.6,
      databaseSource: 'usda',
    ),
    const FoodItem(
      id: 'food_2',
      name: 'Chicken Thigh',
      servingSize: 100,
      servingUnit: 'g',
      calories: 209,
      protein: 26,
      carbs: 0,
      fat: 10.9,
      databaseSource: 'usda',
    ),
  ];

  final testFoodWithBarcode = const FoodItem(
    id: 'food_3',
    name: 'Greek Yogurt',
    brand: 'Fage',
    servingSize: 170,
    servingUnit: 'g',
    calories: 100,
    protein: 18,
    carbs: 6,
    fat: 0,
    barcode: '689544001201',
    databaseSource: 'open_food_facts',
  );

  setUp(() {
    mockRepository = MockDietRepository();
    searchFood = SearchFood(mockRepository);
  });

  group('SearchFood', () {
    group('call', () {
      test('returns search results for valid query', () async {
        when(() => mockRepository.searchFood('chicken', limit: 20))
            .thenAnswer((_) async => testFoods);

        final result = await searchFood('chicken');

        expect(result, testFoods);
        expect(result.length, 2);
        verify(() => mockRepository.searchFood('chicken', limit: 20)).called(1);
      });

      test('returns empty list for empty query', () async {
        final result = await searchFood('');

        expect(result, isEmpty);
        verifyNever(() => mockRepository.searchFood(any(), limit: any(named: 'limit')));
      });

      test('returns empty list for whitespace-only query', () async {
        final result = await searchFood('   ');

        expect(result, isEmpty);
        verifyNever(() => mockRepository.searchFood(any(), limit: any(named: 'limit')));
      });

      test('trims query before searching', () async {
        when(() => mockRepository.searchFood('chicken', limit: 20))
            .thenAnswer((_) async => testFoods);

        await searchFood('  chicken  ');

        verify(() => mockRepository.searchFood('chicken', limit: 20)).called(1);
      });

      test('respects custom limit parameter', () async {
        when(() => mockRepository.searchFood('chicken', limit: 5))
            .thenAnswer((_) async => [testFoods.first]);

        final result = await searchFood('chicken', limit: 5);

        expect(result.length, 1);
        verify(() => mockRepository.searchFood('chicken', limit: 5)).called(1);
      });
    });

    group('byBarcode', () {
      test('returns food item for valid barcode', () async {
        when(() => mockRepository.searchFoodByBarcode('689544001201'))
            .thenAnswer((_) async => testFoodWithBarcode);

        final result = await searchFood.byBarcode('689544001201');

        expect(result, testFoodWithBarcode);
        expect(result?.barcode, '689544001201');
        verify(() => mockRepository.searchFoodByBarcode('689544001201')).called(1);
      });

      test('returns null for empty barcode', () async {
        final result = await searchFood.byBarcode('');

        expect(result, isNull);
        verifyNever(() => mockRepository.searchFoodByBarcode(any()));
      });

      test('returns null for whitespace-only barcode', () async {
        final result = await searchFood.byBarcode('   ');

        expect(result, isNull);
        verifyNever(() => mockRepository.searchFoodByBarcode(any()));
      });

      test('trims barcode before searching', () async {
        when(() => mockRepository.searchFoodByBarcode('689544001201'))
            .thenAnswer((_) async => testFoodWithBarcode);

        await searchFood.byBarcode('  689544001201  ');

        verify(() => mockRepository.searchFoodByBarcode('689544001201')).called(1);
      });

      test('returns null when barcode not found', () async {
        when(() => mockRepository.searchFoodByBarcode('000000000000'))
            .thenAnswer((_) async => null);

        final result = await searchFood.byBarcode('000000000000');

        expect(result, isNull);
      });
    });

    group('getRecent', () {
      test('returns recent foods with default limit', () async {
        when(() => mockRepository.getRecentFoods(limit: 10))
            .thenAnswer((_) async => testFoods);

        final result = await searchFood.getRecent();

        expect(result, testFoods);
        verify(() => mockRepository.getRecentFoods(limit: 10)).called(1);
      });

      test('respects custom limit parameter', () async {
        when(() => mockRepository.getRecentFoods(limit: 5))
            .thenAnswer((_) async => [testFoods.first]);

        final result = await searchFood.getRecent(limit: 5);

        expect(result.length, 1);
        verify(() => mockRepository.getRecentFoods(limit: 5)).called(1);
      });

      test('returns empty list when no recent foods', () async {
        when(() => mockRepository.getRecentFoods(limit: 10))
            .thenAnswer((_) async => []);

        final result = await searchFood.getRecent();

        expect(result, isEmpty);
      });
    });

    group('getFrequent', () {
      test('returns frequent foods with default limit', () async {
        when(() => mockRepository.getFrequentFoods(limit: 10))
            .thenAnswer((_) async => testFoods);

        final result = await searchFood.getFrequent();

        expect(result, testFoods);
        verify(() => mockRepository.getFrequentFoods(limit: 10)).called(1);
      });

      test('respects custom limit parameter', () async {
        when(() => mockRepository.getFrequentFoods(limit: 3))
            .thenAnswer((_) async => [testFoods.first]);

        final result = await searchFood.getFrequent(limit: 3);

        expect(result.length, 1);
        verify(() => mockRepository.getFrequentFoods(limit: 3)).called(1);
      });

      test('returns empty list when no frequent foods', () async {
        when(() => mockRepository.getFrequentFoods(limit: 10))
            .thenAnswer((_) async => []);

        final result = await searchFood.getFrequent();

        expect(result, isEmpty);
      });
    });
  });
}
