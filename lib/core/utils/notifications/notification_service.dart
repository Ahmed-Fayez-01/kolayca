import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/services/local_services/cache_keys.dart';
import 'package:kolayca/features/translator_profile/presentation/views/translator_requests_view.dart';

import '../../../main.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      CacheKeysManger.incrementNotificationsCount();
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      CacheKeysManger.incrementNotificationsCount();
      _handleMessage(message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageHandler);
    // Check for the initial message if the app was opened via a notification
    RemoteMessage? initialMessage =
        await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
  }

  static Future<void> _firebaseBackgroundMessageHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    CacheKeysManger.incrementNotificationsCount();
  }

  void _handleMessage(RemoteMessage message) {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => const TranslatorRequestsView(),
    ));
  }
}
