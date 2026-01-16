# Dren Design System

## Color System

### Brand Colors
```dart
static const primary = Color(0xFFB4FF00);      // Neon Lime - CTAs, highlights
static const primaryDark = Color(0xFF8BC34A);  // Darker lime - pressed states
```

### Background Colors (Dark Mode)
```dart
static const background = Color(0xFF000000);           // Pure black - app background
static const surfacePrimary = Color(0xFF1C1C1E);       // Card backgrounds
static const surfaceSecondary = Color(0xFF2C2C2E);     // Elevated surfaces
static const surfaceTertiary = Color(0xFF3A3A3C);      // Highest elevation
```

### Workout Card Backgrounds
```dart
static const workoutCardGreen = Color(0xFF1C3D1C);     // Green workout cards
static const workoutCardDarkGreen = Color(0xFF0D1F0D); // Darker variant (pills)
```

### Text Colors
```dart
static const textPrimary = Color(0xFFFFFFFF);          // Primary text - white
static const textSecondary = Color(0xFF8E8E93);        // Secondary text - gray
static const textTertiary = Color(0xFF636366);         // Tertiary text - dark gray
```

### Protocol Ring Colors (4 Rings)
```dart
static const caloriesInRing = Color(0xFF34C759);   // Green - Calories consumed
static const caloriesOutRing = Color(0xFFFA114F);  // Red/Pink - Calories burned
static const exerciseRing = Color(0xFF007AFF);     // Blue - Exercise minutes
static const sleepRing = Color(0xFFAF52DE);        // Purple - Sleep hours
```

### Heart Rate Zone Colors
```dart
static const hrZone1 = Color(0xFF8E8E93);  // Gray - Recovery (50-60%)
static const hrZone2 = Color(0xFF007AFF);  // Blue - Fat Burn (60-70%)
static const hrZone3 = Color(0xFF34C759);  // Green - Cardio (70-80%)
static const hrZone4 = Color(0xFFFF9500);  // Orange - Peak (80-90%)
static const hrZone5 = Color(0xFFFF3B30);  // Red - Maximum (90-100%)
```

### Sleep Stage Colors
```dart
static const sleepDeep = Color(0xFF007AFF);    // Blue - 13-23% target
static const sleepLight = Color(0xFF8E8E93);   // Gray - 45-55% target
static const sleepREM = Color(0xFFAF52DE);     // Purple - 20-25% target
static const sleepAwake = Color(0xFFFF3B30);   // Red - <10% target
```

### Semantic Colors
```dart
static const success = Color(0xFF34C759);
static const warning = Color(0xFFFF9500);
static const error = Color(0xFFFF3B30);
static const info = Color(0xFF007AFF);
```

## Typography System

Use SF Pro Display for headlines, SF Pro Text for body copy.

### Large Titles (Screen Headers)
```dart
static const largeTitle = TextStyle(
  fontFamily: 'SF Pro Display',
  fontSize: 34,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.37,
  height: 1.2,
);
```

### Titles
```dart
static const title1 = TextStyle(
  fontFamily: 'SF Pro Display',
  fontSize: 28,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.36,
);

static const title2 = TextStyle(
  fontFamily: 'SF Pro Display',
  fontSize: 22,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.35,
);

static const title3 = TextStyle(
  fontFamily: 'SF Pro Display',
  fontSize: 20,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.38,
);
```

### Body Text
```dart
static const headline = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 17,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.41,
);

static const body = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 17,
  fontWeight: FontWeight.normal,
  letterSpacing: -0.41,
);

static const callout = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 16,
  fontWeight: FontWeight.normal,
  letterSpacing: -0.32,
);

static const subheadline = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 15,
  fontWeight: FontWeight.normal,
  letterSpacing: -0.24,
);

static const footnote = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 13,
  fontWeight: FontWeight.normal,
  letterSpacing: -0.08,
);
```

### Captions
```dart
static const caption1 = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 12,
  fontWeight: FontWeight.normal,
);

static const caption2 = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 11,
  fontWeight: FontWeight.normal,
  letterSpacing: 0.07,
);
```

### Special Styles
```dart
static const metricLarge = TextStyle(
  fontFamily: 'SF Pro Display',
  fontSize: 48,
  fontWeight: FontWeight.bold,
  letterSpacing: -0.5,
);

static const metricMedium = TextStyle(
  fontFamily: 'SF Pro Display',
  fontSize: 32,
  fontWeight: FontWeight.bold,
  letterSpacing: -0.3,
);

static const buttonText = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 17,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.41,
);

static const categoryLabel = TextStyle(
  fontFamily: 'SF Pro Text',
  fontSize: 12,
  fontWeight: FontWeight.w600,
  letterSpacing: 1.0,
);
```

## Spacing System (8pt Grid)

```dart
class DrenSpacing {
  static const double base = 8.0;
  
  // Scale
  static const double xxs = 4.0;   // 0.5x
  static const double xs = 8.0;    // 1x
  static const double sm = 12.0;   // 1.5x
  static const double md = 16.0;   // 2x
  static const double lg = 24.0;   // 3x
  static const double xl = 32.0;   // 4x
  static const double xxl = 48.0;  // 6x
  static const double xxxl = 64.0; // 8x
  
  // Screen padding
  static const double screenHorizontal = 16.0;
  static const double screenVertical = 16.0;
  
  // Card padding
  static const double cardPadding = 16.0;
  static const double cardSpacing = 12.0;
  
  // Component spacing
  static const double sectionSpacing = 24.0;
  static const double itemSpacing = 12.0;
  
  // Border radius
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 20.0;
  static const double radiusFull = 9999.0;
}
```

## Component Specifications

### Primary Button
| Property | Value |
|----------|-------|
| Height | 50pt |
| Width | Full width (stretch) |
| Background | #B4FF00 (primary) |
| Text Color | Black |
| Corner Radius | 12pt (radiusMd) |
| Disabled Background | primary.withOpacity(0.5) |
| Elevation | 0 |

### Protocol Card
| Property | Value |
|----------|-------|
| Background | #1C1C1E (surfacePrimary) |
| Corner Radius | 16pt (radiusLg) |
| Padding | 16pt all sides |
| Icon Size | 24pt |
| Icon Color | #B4FF00 (primary) |

### Workout Card
| Property | Value |
|----------|-------|
| Background | #1C3D1C (workoutCardGreen) |
| Corner Radius | 20pt (radiusXl) |
| Padding | 16pt all sides |
| Icon Size | 32pt |
| Play Button | 48pt circle, #B4FF00 background |
| Option Pills | #0D1F0D background, radiusFull |

### Recipe Card (Quick Log)
| Property | Value |
|----------|-------|
| Card Width | 120pt |
| Card Height | 160pt |
| Image Aspect | 1:1 (120pt × 120pt) |
| Corner Radius | 12pt |
| Background | #1C1C1E |
| Title | 14pt Semibold, white |
| Calories | 12pt Regular, #8E8E93 |
| Log Button Height | 28pt |
| Log Button Background | #B4FF00 |

### Four Protocol Rings
| Ring | Position | Color | Purpose |
|------|----------|-------|---------|
| Calories In | Outer | #34C759 (Green) | Food intake tracking |
| Calories Out | 2nd | #FA114F (Red/Pink) | Active energy burned |
| Exercise | 3rd | #007AFF (Blue) | Workout minutes |
| Sleep | Inner | #AF52DE (Purple) | Previous night |

Ring Specifications:
- Stroke width: 10% of total widget size
- Gap between rings: 15% of stroke width
- Background ring opacity: 0.3
- Stroke cap: Round
- Start angle: -π/2 (12 o'clock)
- Calories In warning: Changes to orange (#FF9500) when >105%

### Tab Bar
| Property | Value |
|----------|-------|
| Background | #000000 |
| Selected Icon Color | #B4FF00 |
| Unselected Icon Color | #8E8E93 |
| Label | 10pt, below icon |

Tab Icons (SF Symbols):
| Tab | SF Symbol | Fallback |
|-----|-----------|----------|
| Today | circle.circle | Custom rings icon |
| Diet | leaf.fill | 🥗 |
| Exercise | figure.run | 🏃 |
| Sleep | moon.zzz.fill | 😴 |

### Nutrition Progress Bar
| Property | Value |
|----------|-------|
| Height | 8pt |
| Corner Radius | 4pt |
| Fill Color | #B4FF00 (primary) |
| Track Color | #3A3A3C (surfaceTertiary) |

### Macro Mini-Ring
| Property | Value |
|----------|-------|
| Diameter | 40pt |
| Stroke Width | 4pt |
| Protein Color | #FF6B6B |
| Carbs Color | #4ECDC4 |
| Fat Color | #FFE66D |

### Eating Window Badge
| Property | Value |
|----------|-------|
| Shape | Pill (radiusFull) |
| Open Background | #1C3D1C |
| Closed Background | #3A3A3C |
| Text | 12pt, white |

## Animation Specifications

### Ring Fill Animation
- Duration: 1200ms
- Curve: Curves.easeOutCubic
- Trigger: On screen appear, on data update

### Card Tap Feedback
- Scale: 0.98
- Duration: 100ms
- Curve: Curves.easeInOut

### Page Transitions
- Type: CupertinoPageTransition
- Duration: 300ms

### Loading Spinner
- Size: 20pt (in buttons), 40pt (full screen)
- Color: Context-dependent (black on primary, white on dark)
- Stroke Width: 2pt
