import 'package:utilities/utilities.dart';

/// ANDROID
/// call [initFirebaseNotification] in main method.
/// call [initLocalNotification] in main method.
/// call [setupNotification] in [initState] of root widget.
/// setup firebase in project.
/// add [classpath 'com.google.gms:google-services:4.3.10'] in dependencies in root level build.gradle file.
/// add [apply plugin: 'com.google.gms.google-services'] in project level build.gradle file.
/// add [implementation platform('com.google.firebase:firebase-bom:29.1.0')] in dependencies in project level build.gradle file.
/// add [implementation 'com.google.firebase:firebase-analytics-ktx'] in dependencies in project level build.gradle file.
/// add json file from firebase in project

const AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
  "important_channel",
  "important notification",
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(final RemoteMessage message) async {
  await Firebase.initializeApp();
  logger.d("message from firebase: ${message.messageId}");
}

Future<void> initFirebaseNotification() async {
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
}

Future<void> initLocalNotification() async {
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(androidNotificationChannel);
}

void setupNotification() {
  FirebaseMessaging.onMessage.listen(
    (final RemoteMessage message) {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? androidNotification = message.notification?.android;
      if (notification != null && androidNotification != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              androidNotificationChannel.id,
              androidNotificationChannel.name,
              channelDescription: androidNotificationChannel.description,
              icon: "@mipmap/ic_launcher",
            ),
            iOS: IOSNotificationDetails(
              subtitle: androidNotificationChannel.name,
            ),
          ),
        );
      }
    },
  );
}
