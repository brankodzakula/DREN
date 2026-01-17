import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/router/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: const _LoginPageContent(),
    );
  }
}

class _LoginPageContent extends StatelessWidget {
  const _LoginPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (_) {
            // Navigate to onboarding or main app
            context.go(Routes.onboarding);
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: DrenColors.error,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Scaffold(
          backgroundColor: DrenColors.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(DrenSpacing.lg),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // Logo and Branding
                  _buildBranding(),

                  const Spacer(flex: 2),

                  // Sign in buttons
                  _buildSignInButtons(context, isLoading),

                  const SizedBox(height: DrenSpacing.lg),

                  // Terms and Privacy
                  _buildTermsText(),

                  const SizedBox(height: DrenSpacing.lg),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBranding() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // App Logo
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: DrenColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              'D',
              style: DrenTypography.metricLarge.copyWith(
                color: DrenColors.primary,
                fontSize: 56,
              ),
            ),
          ),
        ),

        const SizedBox(height: DrenSpacing.lg),

        // App Name
        Text(
          'DREN',
          style: DrenTypography.metricLarge.copyWith(
            color: DrenColors.primary,
            fontSize: 40,
            letterSpacing: 6,
          ),
        ),

        const SizedBox(height: DrenSpacing.xs),

        // Tagline
        Text(
          'Longevity Protocol Engine',
          style: DrenTypography.subheadline.copyWith(
            color: DrenColors.textSecondary,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: DrenSpacing.xxl),

        // Description
        Text(
          'Your personalized daily protocol for\ndiet, exercise, and sleep',
          textAlign: TextAlign.center,
          style: DrenTypography.body.copyWith(
            color: DrenColors.textTertiary,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButtons(BuildContext context, bool isLoading) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Continue with Apple (iOS only)
        if (Platform.isIOS) ...[
          _SignInButton(
            onPressed: isLoading
                ? null
                : () => context
                    .read<AuthBloc>()
                    .add(const AuthEvent.signInWithApple()),
            icon: Icons.apple,
            label: 'Continue with Apple',
            backgroundColor: DrenColors.textPrimary,
            textColor: DrenColors.background,
            isLoading: isLoading,
          ),
          const SizedBox(height: DrenSpacing.md),
        ],

        // Continue with Google
        _SignInButton(
          onPressed: isLoading
              ? null
              : () => context
                  .read<AuthBloc>()
                  .add(const AuthEvent.signInWithGoogle()),
          icon: null,
          customIcon: _buildGoogleIcon(),
          label: 'Continue with Google',
          backgroundColor: DrenColors.surfacePrimary,
          textColor: DrenColors.textPrimary,
          isLoading: isLoading,
        ),
      ],
    );
  }

  Widget _buildGoogleIcon() {
    // Google "G" logo approximation
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          'G',
          style: TextStyle(
            color: Colors.blue.shade700,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTermsText() {
    return Text(
      'By continuing, you agree to our Terms of Service\nand Privacy Policy',
      textAlign: TextAlign.center,
      style: DrenTypography.caption1.copyWith(
        color: DrenColors.textTertiary,
        height: 1.5,
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final Widget? customIcon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;

  const _SignInButton({
    required this.onPressed,
    this.icon,
    this.customIcon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DrenSpacing.radiusMd),
            side: BorderSide(
              color: DrenColors.surfaceSecondary,
              width: 1,
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(icon, size: 24)
                  else if (customIcon != null)
                    customIcon!,
                  const SizedBox(width: DrenSpacing.sm),
                  Text(
                    label,
                    style: DrenTypography.headline.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
