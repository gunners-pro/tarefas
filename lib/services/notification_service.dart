import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings("@mipmap/ic_launcher");
    const settings = InitializationSettings(android: android);

    await _plugin.initialize(settings: settings);

    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static Future<void> showSimple({
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'canal_tarefas',
      'Tarefas',
      channelDescription: 'Notificações do app de tarefas',
      importance: Importance.max,
      priority: Priority.high,
    );

    const details = NotificationDetails(android: androidDetails);

    await _plugin.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }
}
