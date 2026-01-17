import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Result wrapper for auth operations
class AuthResult<T> {
  final T? data;
  final AuthError? error;

  const AuthResult.success(this.data) : error = null;
  const AuthResult.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}

/// Error types for auth operations
enum AuthError {
  cancelled,
  invalidCredential,
  userDisabled,
  userNotFound,
  networkError,
  unknown,
}

/// User data from authentication
class AuthUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String provider;
  final DateTime createdAt;
  final DateTime lastSignIn;

  const AuthUser({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    required this.provider,
    required this.createdAt,
    required this.lastSignIn,
  });

  factory AuthUser.fromFirebaseUser(User user) {
    final providerData = user.providerData;
    String provider = 'unknown';
    if (providerData.isNotEmpty) {
      final providerId = providerData.first.providerId;
      if (providerId.contains('google')) {
        provider = 'google';
      } else if (providerId.contains('apple')) {
        provider = 'apple';
      } else if (providerId.contains('password')) {
        provider = 'email';
      }
    }

    return AuthUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
      provider: provider,
      createdAt: user.metadata.creationTime ?? DateTime.now(),
      lastSignIn: user.metadata.lastSignInTime ?? DateTime.now(),
    );
  }
}

/// Service for Firebase Authentication
@lazySingleton
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Stream of auth state changes
  Stream<AuthUser?> get authStateChanges => _auth.authStateChanges().map(
        (user) => user != null ? AuthUser.fromFirebaseUser(user) : null,
      );

  /// Get current user
  AuthUser? get currentUser {
    final user = _auth.currentUser;
    return user != null ? AuthUser.fromFirebaseUser(user) : null;
  }

  /// Check if user is signed in
  bool get isSignedIn => _auth.currentUser != null;

  /// Sign in with Google
  Future<AuthResult<AuthUser>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return const AuthResult.failure(AuthError.cancelled);
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        return const AuthResult.failure(AuthError.unknown);
      }

      return AuthResult.success(AuthUser.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const AuthResult.failure(AuthError.unknown);
    }
  }

  /// Sign in with Apple
  Future<AuthResult<AuthUser>> signInWithApple() async {
    try {
      // Generate nonce for security
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final userCredential = await _auth.signInWithCredential(oauthCredential);
      final user = userCredential.user;

      if (user == null) {
        return const AuthResult.failure(AuthError.unknown);
      }

      // Apple only provides name on first sign-in, update profile if available
      if (appleCredential.givenName != null ||
          appleCredential.familyName != null) {
        final displayName = [
          appleCredential.givenName,
          appleCredential.familyName,
        ].where((n) => n != null).join(' ');

        if (displayName.isNotEmpty) {
          await user.updateDisplayName(displayName);
        }
      }

      return AuthResult.success(AuthUser.fromFirebaseUser(user));
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        return const AuthResult.failure(AuthError.cancelled);
      }
      return const AuthResult.failure(AuthError.unknown);
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const AuthResult.failure(AuthError.unknown);
    }
  }

  /// Sign out
  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  /// Delete account
  Future<AuthResult<void>> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const AuthResult.failure(AuthError.userNotFound);
      }

      await user.delete();
      return const AuthResult.success(null);
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_mapFirebaseError(e));
    } catch (e) {
      return const AuthResult.failure(AuthError.unknown);
    }
  }

  /// Re-authenticate user (required before sensitive operations)
  Future<AuthResult<void>> reauthenticate() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const AuthResult.failure(AuthError.userNotFound);
      }

      final providerData = user.providerData;
      if (providerData.isEmpty) {
        return const AuthResult.failure(AuthError.unknown);
      }

      final providerId = providerData.first.providerId;

      if (providerId.contains('google')) {
        final result = await signInWithGoogle();
        if (result.isFailure) {
          return AuthResult.failure(result.error!);
        }
      } else if (providerId.contains('apple')) {
        final result = await signInWithApple();
        if (result.isFailure) {
          return AuthResult.failure(result.error!);
        }
      }

      return const AuthResult.success(null);
    } catch (e) {
      return const AuthResult.failure(AuthError.unknown);
    }
  }

  AuthError _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-disabled':
        return AuthError.userDisabled;
      case 'user-not-found':
        return AuthError.userNotFound;
      case 'invalid-credential':
        return AuthError.invalidCredential;
      case 'network-request-failed':
        return AuthError.networkError;
      default:
        return AuthError.unknown;
    }
  }

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
