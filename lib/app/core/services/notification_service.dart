import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fuzionest_chatai/app/core/local_storage/storage_service.dart';
import 'package:fuzionest_chatai/app/core/utils/logger_util.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    getFCMToken();
    await FirebaseMessaging.instance.requestPermission();
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iOSSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    await _localNotificationsPlugin.initialize(
      InitializationSettings(android: androidSettings, iOS: iOSSettings),
      onDidReceiveNotificationResponse: (response) {
        // Handle notification tapped logic
      },
    );

    FirebaseMessaging.onMessage.listen(_handleForegroundNotification);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOpenedApp);
  }

  static Future<String?> getFCMToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    StorageX.saveDeviceToken(token ?? "");
    LoggerUtil.debug("FCM Token: $token");
    return token;
  }

  static Future<void> _handleForegroundNotification(
    RemoteMessage message,
  ) async {
    _showNotification(message);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    _showNotification(message);
  }

  static Future<void> _handleOpenedApp(RemoteMessage message) async {
    // Navigate or handle on open
  }

  static Future<void> _showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      // Decide which type to show: banner, normal, etc.
      final data = message.data;
      String? type = data['type']; // e.g., 'banner', 'normal'

      switch (type) {
        case 'banner':
          _showBannerNotification(
            notification.title ?? '',
            notification.body ?? '',
          );
          break;
        default:
          _showNormalNotification(
            notification.title ?? '',
            notification.body ?? '',
          );
      }
    }
  }

  static Future<void> _showNormalNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'high_importance_channel',
          'Normal Notifications',
          importance: Importance.high,
          priority: Priority.high,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotificationsPlugin.show(0, title, body, platformDetails);
  }

  static Future<void> _showBannerNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'high_importance_channel',
          'Banner Notifications',
          importance: Importance.max,
          priority: Priority.max,
          styleInformation: BigTextStyleInformation(''),
          ticker: 'ticker',
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotificationsPlugin.show(1, title, body, platformDetails);
  }
}
