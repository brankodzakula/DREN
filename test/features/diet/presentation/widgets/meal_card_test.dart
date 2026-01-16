import 'package:dren/features/diet/domain/entities/food_item.dart';
import 'package:dren/features/diet/domain/entities/meal_entry.dart';
import 'package:dren/features/diet/presentation/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test data
  final testFood1 = const FoodItem(
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

  final testMeal = MealEntry.fromItems(
    id: 'meal_1',
    oderId: '20240115-123000',
    timestamp: DateTime(2024, 1, 15, 12, 30),
    mealType: MealType.lunch,
    items: [testFood1, testFood2],
    source: MealSource.manual,
  );

  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('MealCard', () {
    testWidgets('displays meal type correctly', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: testMeal),
      ));

      expect(find.text('Lunch'), findsOneWidget);
    });

    testWidgets('displays meal time correctly', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: testMeal),
      ));

      expect(find.text('12:30 PM'), findsOneWidget);
    });

    testWidgets('displays total calories', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: testMeal),
      ));

      expect(find.text('276'), findsOneWidget);
      expect(find.text('kcal'), findsOneWidget);
    });

    testWidgets('displays food items', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: testMeal),
      ));

      expect(find.text('Chicken Breast'), findsOneWidget);
      expect(find.text('Brown Rice'), findsOneWidget);
    });

    testWidgets('displays macro badges', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: testMeal),
      ));

      // Protein: 34g (31 + 2.6 rounded)
      expect(find.text('P: 34g'), findsOneWidget);
      // Carbs: 23g
      expect(find.text('C: 23g'), findsOneWidget);
      // Fat: 5g (3.6 + 0.9 rounded)
      expect(find.text('F: 5g'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(buildTestableWidget(
        MealCard(
          meal: testMeal,
          onTap: () => tapped = true,
        ),
      ));

      await tester.tap(find.byType(MealCard));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('shows delete button when onDelete provided', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(
          meal: testMeal,
          onDelete: () {},
        ),
      ));

      expect(find.byIcon(Icons.delete_outline), findsOneWidget);
    });

    testWidgets('hides delete button when onDelete not provided', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: testMeal),
      ));

      expect(find.byIcon(Icons.delete_outline), findsNothing);
    });

    testWidgets('shows delete confirmation dialog', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(
          meal: testMeal,
          onDelete: () {},
        ),
      ));

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pumpAndSettle();

      expect(find.text('Delete Meal'), findsOneWidget);
      expect(find.text('Are you sure you want to delete this lunch?'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('closes dialog on cancel', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        MealCard(
          meal: testMeal,
          onDelete: () {},
        ),
      ));

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Meal'), findsNothing);
    });

    testWidgets('calls onDelete when confirmed', (tester) async {
      var deleted = false;

      await tester.pumpWidget(buildTestableWidget(
        MealCard(
          meal: testMeal,
          onDelete: () => deleted = true,
        ),
      ));

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(deleted, isTrue);
      expect(find.text('Delete Meal'), findsNothing);
    });

    testWidgets('shows correct icon for breakfast', (tester) async {
      final breakfastMeal = MealEntry.fromItems(
        id: 'meal_2',
        oderId: '20240115-073000',
        timestamp: DateTime(2024, 1, 15, 7, 30),
        mealType: MealType.breakfast,
        items: [testFood1],
        source: MealSource.manual,
      );

      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: breakfastMeal),
      ));

      expect(find.byIcon(Icons.wb_sunny_outlined), findsOneWidget);
      expect(find.text('Breakfast'), findsOneWidget);
    });

    testWidgets('shows correct icon for dinner', (tester) async {
      final dinnerMeal = MealEntry.fromItems(
        id: 'meal_3',
        oderId: '20240115-190000',
        timestamp: DateTime(2024, 1, 15, 19, 0),
        mealType: MealType.dinner,
        items: [testFood1],
        source: MealSource.manual,
      );

      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: dinnerMeal),
      ));

      expect(find.byIcon(Icons.nightlight_outlined), findsOneWidget);
      expect(find.text('Dinner'), findsOneWidget);
    });

    testWidgets('shows correct icon for snack', (tester) async {
      final snackMeal = MealEntry.fromItems(
        id: 'meal_4',
        oderId: '20240115-100000',
        timestamp: DateTime(2024, 1, 15, 10, 0),
        mealType: MealType.snack,
        items: [testFood1],
        source: MealSource.manual,
      );

      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: snackMeal),
      ));

      expect(find.byIcon(Icons.cookie_outlined), findsOneWidget);
      expect(find.text('Snack'), findsOneWidget);
    });

    testWidgets('shows "more items" indicator when more than 3 items', (tester) async {
      final food3 = testFood1.scaled(50);
      final food4 = testFood2.scaled(50);

      final mealWithManyItems = MealEntry.fromItems(
        id: 'meal_5',
        oderId: '20240115-123000',
        timestamp: DateTime(2024, 1, 15, 12, 30),
        mealType: MealType.lunch,
        items: [testFood1, testFood2, food3, food4],
        source: MealSource.manual,
      );

      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: mealWithManyItems),
      ));

      expect(find.text('+1 more items'), findsOneWidget);
    });

    testWidgets('handles empty items list', (tester) async {
      final emptyMeal = MealEntry(
        id: 'meal_6',
        oderId: '20240115-123000',
        timestamp: DateTime(2024, 1, 15, 12, 30),
        mealType: MealType.lunch,
        items: [],
        totalCalories: 0,
        totalProtein: 0,
        totalCarbs: 0,
        totalFat: 0,
        source: MealSource.manual,
      );

      await tester.pumpWidget(buildTestableWidget(
        MealCard(meal: emptyMeal),
      ));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('P: 0g'), findsOneWidget);
    });
  });
}
