import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/firebase/auth_service.dart';
import '../../../../core/services/firebase/analytics_service.dart';
import '../../../../core/services/firebase/firestore_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final AnalyticsService _analyticsService;
  final FirestoreService _firestoreService;

  StreamSubscription<AuthUser?>? _authSubscription;

  AuthBloc(
    this._authService,
    this._analyticsService,
    this._firestoreService,
  ) : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);

    // Listen to auth state changes
    _authSubscription = _authService.authStateChanges.listen((user) {
      if (user != null) {
        add(const AuthEvent.checkAuthStatus());
      }
    });
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.when(
      checkAuthStatus: () => _onCheckAuthStatus(emit),
      signInWithGoogle: () => _onSignInWithGoogle(emit),
      signInWithApple: () => _onSignInWithApple(emit),
      signOut: () => _onSignOut(emit),
      deleteAccount: () => _onDeleteAccount(emit),
    );
  }

  Future<void> _onCheckAuthStatus(Emitter<AuthState> emit) async {
    final user = _authService.currentUser;
    if (user != null) {
      await _analyticsService.setUserId(user.uid);
      emit(AuthState.authenticated(user));
    } else {
      await _analyticsService.clearUserId();
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onSignInWithGoogle(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _authService.signInWithGoogle();

    if (result.isSuccess && result.data != null) {
      final user = result.data!;

      // Set analytics user
      await _analyticsService.setUserId(user.uid);
      await _analyticsService.logLogin('google');

      // Create/update user profile in Firestore
      await _firestoreService.saveUserProfile({
        'email': user.email,
        'displayName': user.displayName,
        'photoUrl': user.photoUrl,
        'provider': user.provider,
        'lastSignIn': DateTime.now().toIso8601String(),
      });

      emit(AuthState.authenticated(user));
    } else {
      final errorMessage = _getErrorMessage(result.error);
      if (result.error != AuthError.cancelled) {
        emit(AuthState.error(errorMessage));
        // Return to unauthenticated after showing error
        await Future.delayed(const Duration(milliseconds: 100));
        emit(const AuthState.unauthenticated());
      } else {
        emit(const AuthState.unauthenticated());
      }
    }
  }

  Future<void> _onSignInWithApple(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _authService.signInWithApple();

    if (result.isSuccess && result.data != null) {
      final user = result.data!;

      // Set analytics user
      await _analyticsService.setUserId(user.uid);
      await _analyticsService.logLogin('apple');

      // Create/update user profile in Firestore
      await _firestoreService.saveUserProfile({
        'email': user.email,
        'displayName': user.displayName,
        'photoUrl': user.photoUrl,
        'provider': user.provider,
        'lastSignIn': DateTime.now().toIso8601String(),
      });

      emit(AuthState.authenticated(user));
    } else {
      final errorMessage = _getErrorMessage(result.error);
      if (result.error != AuthError.cancelled) {
        emit(AuthState.error(errorMessage));
        await Future.delayed(const Duration(milliseconds: 100));
        emit(const AuthState.unauthenticated());
      } else {
        emit(const AuthState.unauthenticated());
      }
    }
  }

  Future<void> _onSignOut(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    await _authService.signOut();
    await _analyticsService.clearUserId();

    emit(const AuthState.unauthenticated());
  }

  Future<void> _onDeleteAccount(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _authService.deleteAccount();

    if (result.isSuccess) {
      await _analyticsService.clearUserId();
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.error(_getErrorMessage(result.error)));
    }
  }

  String _getErrorMessage(AuthError? error) {
    switch (error) {
      case AuthError.cancelled:
        return 'Sign in was cancelled';
      case AuthError.invalidCredential:
        return 'Invalid credentials. Please try again.';
      case AuthError.userDisabled:
        return 'This account has been disabled.';
      case AuthError.userNotFound:
        return 'Account not found.';
      case AuthError.networkError:
        return 'Network error. Please check your connection.';
      default:
        return 'An error occurred. Please try again.';
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
