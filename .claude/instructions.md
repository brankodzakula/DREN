# Dren - Longevity Protocol Engine

## Project Summary
Dren is an offline-first longevity protocol app that generates personalized daily protocols across Diet, Exercise, and Sleep pillars. Inspired by Bryan Johnson's Blueprint methodology. Built with Flutter for iOS and Android.

## Tech Stack Quick Reference
| Concern | Solution |
|---------|----------|
| State Management | flutter_bloc (BLoC/Cubit) |
| Dependency Injection | GetIt + Injectable |
| Navigation | GoRouter |
| Local Database | Drift (SQLite) with encryption |
| Health Integration | health package (HealthKit + Health Connect) |
| Code Generation | Freezed, JsonSerializable, Injectable |

## Architecture Pattern
Clean Architecture with feature-first organization:
```
lib/features/[feature]/
├── data/          # DTOs, datasources, repository implementations
├── domain/        # Entities, repository interfaces, use cases
└── presentation/  # BLoC, pages, widgets
```

## Critical Design Decisions
1. **Offline-First**: All protocol logic runs on-device. No cloud accounts.
2. **PHI Protection**: All health data encrypted at rest (AES-256)
3. **Free APIs Only**: USDA FoodData Central, Open Food Facts, Wger
4. **Four Protocol Rings**: Calories In (green), Calories Out (red), Exercise (blue), Sleep (purple)

## Design System Quick Reference
- **Primary Color**: #B4FF00 (Neon Lime)
- **Background**: #000000 (Pure Black)
- **Surface**: #1C1C1E (Card backgrounds)
- **Typography**: SF Pro Display/Text
- **Spacing**: 8pt grid system

## Reference Files
Load these as needed for specific tasks:
- `ARCHITECTURE.md` - Folder structure, dependencies, patterns
- `DESIGN_SYSTEM.md` - Colors, typography, spacing, components
- `DATA_MODELS.md` - All Freezed entities and models
- `SCREENS.md` - Screen layouts and wireframes
- `CALCULATIONS.md` - BMR, TDEE, sleep score, protocol logic
- `HEALTH_INTEGRATION.md` - HealthKit/Health Connect setup
- `API_SPECS.md` - External API integrations

## Current Development Phase
**Phase**: 8 - Polish + Testing
**Status**: Prompt 8.3 Complete (Testing Coverage)
**Next Task**: Phase 8 - Complete

## Phase Checklist
- [x] Phase 1: Foundation (scaffold, DI, router, theme, database)
- [x] Phase 2: Onboarding + Protocol Engine
- [x] Phase 3: Today Tab (rings, daily summary)
- [x] Phase 4: Diet Feature
- [x] Phase 5: Exercise Feature
- [x] Phase 6: Sleep Feature
- [x] Phase 7: Health Platform Integration
- [ ] Phase 8: Polish + Testing

## Code Quality Rules
1. Every feature follows domain → data → presentation order
2. All BLoCs have unit tests
3. No business logic in widgets
4. Use Freezed for all models
5. Register everything in DI
6. Run `dart run build_runner build --delete-conflicting-outputs` after model changes
