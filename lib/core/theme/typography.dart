import 'package:flutter/material.dart';
import 'colors.dart';

/// Dren Design System Typography
/// Uses SF Pro Display for headlines, SF Pro Text for body copy
class DrenTypography {
  DrenTypography._();

  // Large Titles (Screen Headers)
  static const largeTitle = TextStyle(
    fontFamily: '.SF Pro Display',
    fontSize: 34,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.37,
    height: 1.2,
    color: DrenColors.textPrimary,
  );

  // Titles
  static const title1 = TextStyle(
    fontFamily: '.SF Pro Display',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.36,
    color: DrenColors.textPrimary,
  );

  static const title2 = TextStyle(
    fontFamily: '.SF Pro Display',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.35,
    color: DrenColors.textPrimary,
  );

  static const title3 = TextStyle(
    fontFamily: '.SF Pro Display',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.38,
    color: DrenColors.textPrimary,
  );

  // Body Text
  static const headline = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.41,
    color: DrenColors.textPrimary,
  );

  static const body = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 17,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.41,
    color: DrenColors.textPrimary,
  );

  static const callout = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.32,
    color: DrenColors.textPrimary,
  );

  static const subheadline = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 15,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.24,
    color: DrenColors.textPrimary,
  );

  static const footnote = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 13,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.08,
    color: DrenColors.textSecondary,
  );

  // Captions
  static const caption1 = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: DrenColors.textSecondary,
  );

  static const caption2 = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 11,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.07,
    color: DrenColors.textSecondary,
  );

  // Special Styles
  static const metricLarge = TextStyle(
    fontFamily: '.SF Pro Display',
    fontSize: 48,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    color: DrenColors.textPrimary,
  );

  static const metricMedium = TextStyle(
    fontFamily: '.SF Pro Display',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
    color: DrenColors.textPrimary,
  );

  static const buttonText = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.41,
    color: DrenColors.background, // Black text on primary button
  );

  static const categoryLabel = TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
    color: DrenColors.textSecondary,
  );
}
