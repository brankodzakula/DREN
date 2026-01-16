# Dren - Longevity Protocol Engine

Offline-first longevity protocol app generating personalized daily protocols across Diet, Exercise, and Sleep. Inspired by Bryan Johnson's Blueprint methodology. Built with Flutter.

## Tech Stack
- **State**: flutter_bloc
- **DI**: GetIt + Injectable
- **Navigation**: GoRouter
- **Database**: Drift (SQLite) with encryption
- **Health**: health package (HealthKit + Health Connect)
- **Code Gen**: Freezed, JsonSerializable

## Architecture
Clean Architecture with feature-first organization:
```
lib/features/[feature]/
├── data/          # DTOs, datasources, repository implementations
├── domain/        # Entities, repository interfaces, use cases
└── presentation/  # BLoC, pages, widgets
```

## Key Design Decisions
1. **Offline-First**: All protocol logic on-device, no cloud accounts
2. **PHI Protection**: Health data encrypted at rest (AES-256)
3. **Free APIs Only**: USDA FoodData Central, Open Food Facts
4. **Four Rings**: Calories In (green), Out (red), Exercise (blue), Sleep (purple)

## Design System
- **Primary**: #B4FF00 (Neon Lime)
- **Background**: #000000
- **Surface**: #1C1C1E
- **Spacing**: 8pt grid

## Commands
```bash
flutter pub get                                              # Install deps
dart run build_runner build --delete-conflicting-outputs     # Generate code
flutter test                                                 # Run tests
```

## Detailed Documentation
See `.claude/` directory for comprehensive specs:
- `ARCHITECTURE.md` - Full project structure and patterns
- `DESIGN_SYSTEM.md` - Colors, typography, components
- `DATA_MODELS.md` - All Freezed entities
- `SCREENS.md` - Screen layouts
- `CALCULATIONS.md` - BMR, TDEE, sleep score formulas
- `HEALTH_INTEGRATION.md` - HealthKit/Health Connect
- `API_SPECS.md` - External API specs
