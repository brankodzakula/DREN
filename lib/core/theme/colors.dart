import 'package:flutter/material.dart';

/// Dren Design System Colors
class DrenColors {
  DrenColors._();

  // Brand Colors
  static const primary = Color(0xFFB4FF00);      // Neon Lime - CTAs, highlights
  static const primaryDark = Color(0xFF8BC34A);  // Darker lime - pressed states

  // Background Colors (Dark Mode)
  static const background = Color(0xFF000000);           // Pure black - app background
  static const surfacePrimary = Color(0xFF1C1C1E);       // Card backgrounds
  static const surfaceSecondary = Color(0xFF2C2C2E);     // Elevated surfaces
  static const surfaceTertiary = Color(0xFF3A3A3C);      // Highest elevation

  // Workout Card Backgrounds
  static const workoutCardGreen = Color(0xFF1C3D1C);     // Green workout cards
  static const workoutCardDarkGreen = Color(0xFF0D1F0D); // Darker variant (pills)

  // Text Colors
  static const textPrimary = Color(0xFFFFFFFF);          // Primary text - white
  static const textSecondary = Color(0xFF8E8E93);        // Secondary text - gray
  static const textTertiary = Color(0xFF636366);         // Tertiary text - dark gray

  // Protocol Ring Colors (4 Rings)
  static const caloriesInRing = Color(0xFF34C759);   // Green - Calories consumed
  static const caloriesOutRing = Color(0xFFFA114F);  // Red/Pink - Calories burned
  static const exerciseRing = Color(0xFF007AFF);     // Blue - Exercise minutes
  static const sleepRing = Color(0xFFAF52DE);        // Purple - Sleep hours

  // Heart Rate Zone Colors
  static const hrZone1 = Color(0xFF8E8E93);  // Gray - Recovery (50-60%)
  static const hrZone2 = Color(0xFF007AFF);  // Blue - Fat Burn (60-70%)
  static const hrZone3 = Color(0xFF34C759);  // Green - Cardio (70-80%)
  static const hrZone4 = Color(0xFFFF9500);  // Orange - Peak (80-90%)
  static const hrZone5 = Color(0xFFFF3B30);  // Red - Maximum (90-100%)

  // Sleep Stage Colors
  static const sleepDeep = Color(0xFF007AFF);    // Blue - 13-23% target
  static const sleepLight = Color(0xFF8E8E93);   // Gray - 45-55% target
  static const sleepREM = Color(0xFFAF52DE);     // Purple - 20-25% target
  static const sleepAwake = Color(0xFFFF3B30);   // Red - <10% target

  // Semantic Colors
  static const success = Color(0xFF34C759);
  static const warning = Color(0xFFFF9500);
  static const error = Color(0xFFFF3B30);
  static const info = Color(0xFF007AFF);

  // Macro Colors
  static const proteinColor = Color(0xFFFF6B6B);
  static const carbsColor = Color(0xFF4ECDC4);
  static const fatColor = Color(0xFFFFE66D);
}
