import 'package:dren/app/app.dart';
import 'package:dren/app/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Integration test for the onboarding flow
/// Run with: flutter test integration_test/onboarding_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Initialize dependencies
    getIt.reset();
    configureDependencies();
  });

  group('Onboarding Flow', () {
    testWidgets('completes full onboarding flow', (tester) async {
      // Build the app
      await tester.pumpWidget(const DrenApp());
      await tester.pumpAndSettle();

      // Wait for splash screen if present
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // Step 1: Welcome Screen
      // Look for "Get Started" or similar button
      final getStartedFinder = find.textContaining('Get Started');
      if (getStartedFinder.evaluate().isNotEmpty) {
        await tester.tap(getStartedFinder);
        await tester.pumpAndSettle();
      }

      // Step 2: Birth Date
      // Find the continue button and proceed (date picker should have default)
      final continueFinder = find.text('Continue');
      if (continueFinder.evaluate().isNotEmpty) {
        await tester.tap(continueFinder);
        await tester.pumpAndSettle();
      }

      // Step 3: Sex Selection - tap Male or Female
      final maleFinder = find.text('Male');
      if (maleFinder.evaluate().isNotEmpty) {
        await tester.tap(maleFinder);
        await tester.pumpAndSettle();

        // Continue to next step
        await tester.tap(find.text('Continue'));
        await tester.pumpAndSettle();
      }

      // Step 4: Measurements - height and weight
      // Sliders should have default values, just continue
      final continueButtonStep4 = find.text('Continue');
      if (continueButtonStep4.evaluate().isNotEmpty) {
        await tester.tap(continueButtonStep4);
        await tester.pumpAndSettle();
      }

      // Step 5: Target Weight - has default, continue
      final continueButtonStep5 = find.text('Continue');
      if (continueButtonStep5.evaluate().isNotEmpty) {
        await tester.tap(continueButtonStep5);
        await tester.pumpAndSettle();
      }

      // Step 6: Activity Level - select Moderately Active
      final moderatelyActiveFinder = find.textContaining('Moderately');
      if (moderatelyActiveFinder.evaluate().isNotEmpty) {
        await tester.tap(moderatelyActiveFinder.first);
        await tester.pumpAndSettle();

        await tester.tap(find.text('Continue'));
        await tester.pumpAndSettle();
      }

      // Step 7: Goals - select some goals
      final weightLossFinder = find.textContaining('Weight');
      if (weightLossFinder.evaluate().isNotEmpty) {
        await tester.tap(weightLossFinder.first);
        await tester.pumpAndSettle();

        await tester.tap(find.text('Continue'));
        await tester.pumpAndSettle();
      }

      // Step 8: Wake Time - has default, continue
      final continueButtonStep8 = find.text('Continue');
      if (continueButtonStep8.evaluate().isNotEmpty) {
        await tester.tap(continueButtonStep8);
        await tester.pumpAndSettle();
      }

      // Step 9: Ambition Level - select Moderate
      final moderateFinder = find.textContaining('Moderate');
      if (moderateFinder.evaluate().isNotEmpty) {
        await tester.tap(moderateFinder.first);
        await tester.pumpAndSettle();

        await tester.tap(find.text('Continue'));
        await tester.pumpAndSettle();
      }

      // Step 10: Health Permissions - skip for testing
      final skipFinder = find.text('Skip');
      if (skipFinder.evaluate().isNotEmpty) {
        await tester.tap(skipFinder);
        await tester.pumpAndSettle();
      }

      // Step 11: Disclaimer - accept and finish
      final acceptFinder = find.byType(Checkbox);
      if (acceptFinder.evaluate().isNotEmpty) {
        await tester.tap(acceptFinder.first);
        await tester.pumpAndSettle();

        await tester.tap(find.text('Continue'));
        await tester.pumpAndSettle();
      }

      // Wait for navigation to main screen
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      // Verify we reached the main screen (Today tab should be visible)
      final todayFinder = find.text('Today');
      expect(todayFinder, findsWidgets);
    });
  });
}
