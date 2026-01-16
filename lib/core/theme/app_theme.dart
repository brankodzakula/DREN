import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'typography.dart';
import 'spacing.dart';

/// Dren App Theme Configuration
class DrenTheme {
  DrenTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Colors
      primaryColor: DrenColors.primary,
      scaffoldBackgroundColor: DrenColors.background,
      colorScheme: const ColorScheme.dark(
        primary: DrenColors.primary,
        onPrimary: DrenColors.background,
        secondary: DrenColors.primary,
        onSecondary: DrenColors.background,
        surface: DrenColors.surfacePrimary,
        onSurface: DrenColors.textPrimary,
        error: DrenColors.error,
        onError: DrenColors.textPrimary,
      ),

      // App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: DrenColors.background,
        foregroundColor: DrenColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: DrenTypography.headline,
      ),

      // Bottom Navigation
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DrenColors.background,
        selectedItemColor: DrenColors.primary,
        unselectedItemColor: DrenColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: DrenColors.surfacePrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
        ),
        margin: EdgeInsets.zero,
      ),

      // Elevated Buttons (Primary)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DrenColors.primary,
          foregroundColor: DrenColors.background,
          minimumSize: const Size(double.infinity, DrenSpacing.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          ),
          elevation: 0,
          textStyle: DrenTypography.buttonText,
        ),
      ),

      // Outlined Buttons (Secondary)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DrenColors.primary,
          minimumSize: const Size(double.infinity, DrenSpacing.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          ),
          side: const BorderSide(color: DrenColors.primary, width: 1.5),
          textStyle: DrenTypography.buttonText.copyWith(color: DrenColors.primary),
        ),
      ),

      // Text Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DrenColors.primary,
          textStyle: DrenTypography.buttonText.copyWith(color: DrenColors.primary),
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DrenColors.surfacePrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          borderSide: const BorderSide(color: DrenColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
          borderSide: const BorderSide(color: DrenColors.error, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DrenSpacing.md,
          vertical: DrenSpacing.sm,
        ),
        hintStyle: DrenTypography.body.copyWith(color: DrenColors.textTertiary),
        labelStyle: DrenTypography.body,
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: DrenColors.surfaceSecondary,
        thickness: 1,
        space: 0,
      ),

      // Checkbox
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DrenColors.primary;
          }
          return DrenColors.surfaceTertiary;
        }),
        checkColor: WidgetStateProperty.all(DrenColors.background),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // Switch
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DrenColors.primary;
          }
          return DrenColors.textSecondary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DrenColors.primary.withValues(alpha: 0.5);
          }
          return DrenColors.surfaceTertiary;
        }),
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: DrenColors.primary,
        linearTrackColor: DrenColors.surfaceTertiary,
      ),

      // Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: DrenColors.surfaceSecondary,
        contentTextStyle: DrenTypography.body,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Dialog
      dialogTheme: DialogThemeData(
        backgroundColor: DrenColors.surfacePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DrenSpacing.radiusLg),
        ),
        titleTextStyle: DrenTypography.title3,
        contentTextStyle: DrenTypography.body,
      ),

      // Bottom Sheet
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: DrenColors.surfacePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(DrenSpacing.radiusXl),
          ),
        ),
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: DrenTypography.largeTitle,
        displayMedium: DrenTypography.title1,
        displaySmall: DrenTypography.title2,
        headlineMedium: DrenTypography.title3,
        titleLarge: DrenTypography.headline,
        titleMedium: DrenTypography.body,
        bodyLarge: DrenTypography.body,
        bodyMedium: DrenTypography.callout,
        bodySmall: DrenTypography.footnote,
        labelLarge: DrenTypography.buttonText,
        labelMedium: DrenTypography.caption1,
        labelSmall: DrenTypography.caption2,
      ),
    );
  }
}
