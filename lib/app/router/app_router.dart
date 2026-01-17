import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/di/injection.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/typography.dart';
import '../../core/theme/spacing.dart';
import '../../core/services/firebase/auth_service.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/onboarding/domain/usecases/check_onboarding_complete.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/today/presentation/pages/today_page.dart' as today;
import '../../features/diet/presentation/pages/diet_page.dart' as diet;
import '../../features/diet/presentation/pages/food_search_page.dart';
import '../../features/diet/presentation/pages/barcode_scanner_page.dart';
import '../../features/exercise/presentation/pages/exercise_page.dart' as exercise;
import '../../features/exercise/presentation/pages/active_workout_page.dart';
import '../../features/sleep/presentation/pages/sleep_page.dart' as sleep;
import '../../features/settings/presentation/pages/settings_page.dart' as settings;
import '../../shared/widgets/debug_widgets_screen.dart';
import 'routes.dart';

/// Animated splash screen with logo and auto-navigation
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _controller.forward();
    _checkOnboardingAndNavigate();
  }

  Future<void> _checkOnboardingAndNavigate() async {
    // Minimum splash display time for branding
    await Future.delayed(const Duration(milliseconds: 1800));

    if (!mounted) return;

    try {
      // First check if user is authenticated
      final authService = getIt<AuthService>();
      if (!authService.isSignedIn) {
        if (mounted) {
          context.go(Routes.login);
        }
        return;
      }

      // If authenticated, check onboarding status
      final checkOnboarding = getIt<CheckOnboardingComplete>();
      final status = await checkOnboarding();

      if (!mounted) return;

      if (status == OnboardingStatus.complete) {
        context.go(Routes.today);
      } else {
        context.go(Routes.onboarding);
      }
    } catch (e) {
      // If check fails, go to login
      if (mounted) {
        context.go(Routes.login);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DrenColors.background,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo Text
                    Text(
                      'DREN',
                      style: DrenTypography.metricLarge.copyWith(
                        color: DrenColors.primary,
                        fontSize: 64,
                        letterSpacing: 8,
                      ),
                    ),
                    const SizedBox(height: DrenSpacing.sm),
                    // Tagline
                    Text(
                      'LONGEVITY PROTOCOL',
                      style: DrenTypography.categoryLabel.copyWith(
                        color: DrenColors.textSecondary,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: DrenSpacing.xxl),
                    // Loading indicator
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          DrenColors.primary.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// OnboardingPage is now imported from features/onboarding/presentation/pages/onboarding_page.dart

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  DateTime? _lastBackPressed;

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(Routes.today)) return 0;
    if (location.startsWith(Routes.diet)) return 1;
    if (location.startsWith(Routes.exercise)) return 2;
    if (location.startsWith(Routes.sleep)) return 3;
    return 0;
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final currentIndex = _getCurrentIndex(context);

    // If not on Today tab, go to Today first
    if (currentIndex != 0) {
      context.go(Routes.today);
      return false;
    }

    // On Today tab, require double-tap to exit
    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Press back again to exit',
            style: DrenTypography.body.copyWith(color: DrenColors.textPrimary),
          ),
          backgroundColor: DrenColors.surfaceSecondary,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop(context);
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
      backgroundColor: DrenColors.background,
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: DrenColors.surfacePrimary,
          border: Border(
            top: BorderSide(
              color: DrenColors.surfaceSecondary,
              width: 0.5,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              if (index == currentIndex) return;
              switch (index) {
                case 0:
                  context.go(Routes.today);
                  break;
                case 1:
                  context.go(Routes.diet);
                  break;
                case 2:
                  context.go(Routes.exercise);
                  break;
                case 3:
                  context.go(Routes.sleep);
                  break;
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: DrenColors.primary,
            unselectedItemColor: DrenColors.textSecondary,
            selectedLabelStyle: DrenTypography.caption2.copyWith(
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: DrenTypography.caption2,
            items: [
              BottomNavigationBarItem(
                icon: Icon(currentIndex == 0 ? Icons.dashboard : Icons.dashboard_outlined),
                label: 'Today',
              ),
              BottomNavigationBarItem(
                icon: Icon(currentIndex == 1 ? Icons.restaurant : Icons.restaurant_outlined),
                label: 'Diet',
              ),
              BottomNavigationBarItem(
                icon: Icon(currentIndex == 2 ? Icons.fitness_center : Icons.fitness_center_outlined),
                label: 'Exercise',
              ),
              BottomNavigationBarItem(
                icon: Icon(currentIndex == 3 ? Icons.bedtime : Icons.bedtime_outlined),
                label: 'Sleep',
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

// Placeholder tab pages
class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Today', style: DrenTypography.title1),
    );
  }
}

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Diet', style: DrenTypography.title1),
    );
  }
}

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Exercise', style: DrenTypography.title1),
    );
  }
}

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sleep', style: DrenTypography.title1),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings', style: DrenTypography.title1),
    );
  }
}

final goRouter = GoRouter(
  initialLocation: Routes.splash,
  debugLogDiagnostics: true,
  // Redirect based on auth and onboarding status
  redirect: (context, state) async {
    final path = state.uri.path;

    // Allow splash and debug routes without check
    if (path == Routes.splash || path == Routes.debug) {
      return null;
    }

    // Check authentication
    final authService = getIt<AuthService>();
    final isAuthenticated = authService.isSignedIn;

    // If not authenticated and trying to access protected routes
    if (!isAuthenticated &&
        path != Routes.login) {
      return Routes.login;
    }

    // If authenticated and on login page, redirect to onboarding check
    if (isAuthenticated && path == Routes.login) {
      try {
        final checkOnboarding = getIt<CheckOnboardingComplete>();
        final status = await checkOnboarding();
        if (status == OnboardingStatus.complete) {
          return Routes.today;
        }
        return Routes.onboarding;
      } catch (e) {
        return Routes.onboarding;
      }
    }

    // For main routes, check if onboarding is complete
    if (isAuthenticated && path.startsWith('/main')) {
      try {
        final checkOnboarding = getIt<CheckOnboardingComplete>();
        final status = await checkOnboarding();
        if (status != OnboardingStatus.complete) {
          return Routes.onboarding;
        }
      } catch (e) {
        // If check fails, allow navigation
        return null;
      }
    }

    return null;
  },
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: Routes.today,
          builder: (context, state) => const today.TodayPage(),
        ),
        GoRoute(
          path: Routes.diet,
          builder: (context, state) => const diet.DietPage(),
        ),
        GoRoute(
          path: Routes.exercise,
          builder: (context, state) => const exercise.ExercisePage(),
        ),
        GoRoute(
          path: Routes.sleep,
          builder: (context, state) => const sleep.SleepPage(),
        ),
      ],
    ),
    // Redirect /main to /main/today
    GoRoute(
      path: Routes.main,
      redirect: (context, state) => Routes.today,
    ),
    GoRoute(
      path: Routes.settings,
      builder: (context, state) => const settings.SettingsPage(),
    ),
    GoRoute(
      path: Routes.debug,
      builder: (context, state) => const DebugWidgetsScreen(),
    ),
    // Diet feature routes
    GoRoute(
      path: Routes.foodSearch,
      builder: (context, state) {
        final mealType = state.uri.queryParameters['mealType'];
        return FoodSearchPage(initialMealType: mealType);
      },
    ),
    GoRoute(
      path: Routes.barcodeScanner,
      builder: (context, state) {
        final mealType = state.uri.queryParameters['mealType'];
        return BarcodeScannerPage(mealType: mealType);
      },
    ),
    // Exercise feature routes
    GoRoute(
      path: Routes.activeWorkout,
      builder: (context, state) => const ActiveWorkoutPage(),
    ),
  ],
);
