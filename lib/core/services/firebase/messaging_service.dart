import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

/// Notification data received from FCM
class PushNotification {
  final String? title;
  final String? body;
  final Map<String, dynamic> data;
  final String? imageUrl;

  const PushNotification({
    this.title,
    this.body,
    this.data = const {},
    this.imageUrl,
  });

  factory PushNotification.fromRemoteMessage(RemoteMessage message) {
    return PushNotification(
      title: message.notification?.title,
      body: message.notification?.body,
      data: message.data,
      imageUrl: Platform.isAndroid
          ? message.notification?.android?.imageUrl
          : message.notification?.apple?.imageUrl,
    );
  }
}

/// Callback for handling notifications
typedef NotificationCallback = void Function(PushNotification notification);

/// Service for Firebase Cloud Messaging
@lazySingleton
class MessagingService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  NotificationCallback? _onNotificationTapped;
  NotificationCallback? _onNotificationReceived;

  /// Initialize messaging and request permissions
  Future<bool> initialize() async {
    // Request permission
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (settings.authorizationStatus != AuthorizationStatus.authorized &&
        settings.authorizationStatus != AuthorizationStatus.provisional) {
      return false;
    }

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle background message taps
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Check if app was opened from a notification
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }

    return true;
  }

  /// Get FCM token
  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  /// Stream of FCM token changes
  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  /// Subscribe to a topic
  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  /// Unsubscribe from a topic
  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }

  /// Set callback for when notification is tapped
  void setOnNotificationTapped(NotificationCallback callback) {
    _onNotificationTapped = callback;
  }

  /// Set callback for when notification is received in foreground
  void setOnNotificationReceived(NotificationCallback callback) {
    _onNotificationReceived = callback;
  }

  void _handleForegroundMessage(RemoteMessage message) {
    final notification = PushNotification.fromRemoteMessage(message);
    _onNotificationReceived?.call(notification);
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    final notification = PushNotification.fromRemoteMessage(message);
    _onNotificationTapped?.call(notification);
  }

  /// Request notification permissions (call again if initially denied)
  Future<bool> requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  /// Check if notifications are enabled
  Future<bool> areNotificationsEnabled() async {
    final settings = await _messaging.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  /// Delete FCM token (use on sign out)
  Future<void> deleteToken() async {
    await _messaging.deleteToken();
  }
}

/// Background message handler - must be top-level function
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background message
  // Note: This runs in a separate isolate, can't access normal app state
  print('Background message received: ${message.messageId}');
}
