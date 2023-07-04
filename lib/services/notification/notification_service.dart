// ignore_for_file: use_build_context_synchronously
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../routes/routes_name.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitialization =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInitialization = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: androidInitialization, iOS: iosInitialization);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {});
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint("Message: ${message.notification!.body}");
      initLocalNotifications(context, message);
      showNotification(message);
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("user granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint("user granted provision permission");
    } else {
      debugPrint("user denied permission");
    }
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
      debugPrint("Notification Type: ${message.data["type"]}");
    if (message.data['type'] == 'weather_alert') {
      Navigator.pushNamed(context, RoutesName.weather);
    } else {
      Navigator.pushNamed(context, RoutesName.notifications);
    }
  }

  Future<void> setupInterectMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(), "Notication Channel",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: "Channel Description",
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker');

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      debugPrint("Token Refreshed");
    });
  }
}
