# DREN

**Longevity Protocol Engine** - A personalized health and wellness app that generates daily protocols based on your goals, biometrics, and lifestyle.

## Features

### Daily Protocol Dashboard
- **Four Rings System** - Visual progress tracking for Sleep, Diet, Exercise, and Supplements
- Personalized daily recommendations based on your ambition level
- Real-time protocol adaptation

### Diet Tracking
- Food search via USDA and Open Food Facts APIs
- Barcode scanning for quick food logging
- Macro and calorie tracking with personalized targets
- Intermittent fasting support with eating window tracking
- Recipe management

### Exercise
- Workout library with categorized exercises
- Active workout tracking with rest timers
- Integration with Apple Health / Google Fit
- Personalized workout recommendations

### Sleep Management
- Sleep score calculation based on duration and consistency
- Circadian rhythm visualization
- Wind-down checklist for sleep hygiene
- Guided meditation library
- Smart sleep schedule recommendations

### Health Integration
- Apple HealthKit (iOS/macOS)
- Google Fit (Android)
- Automatic sync of steps, sleep, and workout data

## Tech Stack

- **Framework**: Flutter 3.2+
- **State Management**: flutter_bloc
- **Navigation**: go_router
- **Dependency Injection**: get_it + injectable
- **Local Database**: Drift (SQLite)
- **Code Generation**: freezed, json_serializable

## Architecture

Clean Architecture with feature-based organization:

```
lib/
├── app/                    # App configuration, routing, DI
├── core/                   # Shared services, theme, utilities
├── features/
│   ├── onboarding/        # User profile setup
│   ├── today/             # Daily dashboard
│   ├── diet/              # Nutrition tracking
│   ├── exercise/          # Workout management
│   ├── sleep/             # Sleep tracking
│   ├── protocol_engine/   # Daily protocol generation
│   └── settings/          # User preferences
└── shared/                # Reusable widgets
```

Each feature follows the domain-driven structure:
- `data/` - Repositories, data sources, models
- `domain/` - Entities, use cases, repository interfaces
- `presentation/` - BLoC, pages, widgets

## Getting Started

### Prerequisites

- Flutter SDK 3.2.0 or higher
- Dart SDK 3.2.0 or higher
- Xcode (for iOS/macOS)
- Android Studio (for Android)

### Installation

```bash
# Clone the repository
git clone https://github.com/brankodzakula/DREN.git
cd DREN

# Install dependencies
flutter pub get

# Generate code (Freezed, Injectable, Drift)
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## Build

```bash
# iOS
flutter build ios --release

# Android
flutter build apk --release

# macOS
flutter build macos --release
```

## Project Documentation

Detailed documentation is available in the `.claude/` directory:

- `ARCHITECTURE.md` - Project structure and patterns
- `DESIGN_SYSTEM.md` - UI components and theming
- `DATA_MODELS.md` - Entity definitions
- `SCREENS.md` - Screen specifications
- `CALCULATIONS.md` - BMR, TDEE, and scoring formulas
- `HEALTH_INTEGRATION.md` - HealthKit/Google Fit setup
- `API_SPECS.md` - External API documentation

## License

This project is proprietary software.
