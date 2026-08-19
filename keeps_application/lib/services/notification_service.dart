import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;

class NotificationService {
  NotificationService._();
  static final instance = NotificationService._();
  final _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tzdata.initializeTimeZones();
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _plugin.initialize(const InitializationSettings(android: androidInit));

    final android = _plugin.resolvePlatformSpecificImplementationAndroidFlutterLocalNotificationsPlugin>();
    await android?.requestNotificationsPermission();
  }

  /// Schedules 30/7/0-day-before reminders for a warranty expiry, matching
  /// the default `reminderDaysBefore` in the Warranty table (Section 5/6.5).
  Future<void> scheduleWarrantyReminders({
    required String productId,
    required String productName,
    required DateTime expiry,
    List<int> reminderDaysBefore = const [30, 7, 0],
  }) async {
    for (final days in reminderDaysBefore) {
      final fireDate = expiry.subtract(Duration(days: days));
      if (fireDate.isBefore(DateTime.now())) continue;
      final id = ('$productId-$days').hashCode & 0x7fffffff;
      await _plugin.zonedSchedule(
        id,
        'Warranty reminder',
        days == 0
            ? "$productName's warranty expires today."
            : "$productName's warranty expires in $days day${days == 1 ? '' : 's'}.",
        tz.TZDateTime.from(fireDate, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'warranty_reminders',
            'Warranty Reminders',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  Future<void> cancelForProduct(String productId) async {
    for (final days in const [30, 7, 0]) {
      await _plugin.cancel(('$productId-$days').hashCode & 0x7fffffff);
    }
  }
}