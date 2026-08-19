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

    final android = _plugin.resolvePlatformSpecificImplementation
        <AndroidFlutterLocalNotificationsPlugin>();
    await android?.requestNotificationsPermission();
  }

  /// Schedules 30/7/0-day-before reminders for a warranty expiry, matching
  /// the default `reminderDaysBefore` in the Warranty table (Section 5/6.5).
  /// [ownerId] uniquely identifies what this warranty belongs to — pass the
  /// productId for a product-level warranty, or the eventId for a per-event
  /// (e.g. repair) warranty, so the two never collide.
  Future<void> scheduleWarrantyReminders({
    required String ownerId,
    required String productName,
    required DateTime expiry,
    List<int> reminderDaysBefore = const [30, 7, 0],
  }) async {
    await cancelReminders(ownerId, reminderDaysBefore: reminderDaysBefore);

    for (final days in reminderDaysBefore) {
      final fireDate = expiry.subtract(Duration(days: days));
      if (fireDate.isBefore(DateTime.now())) continue;
      final id = ('$ownerId-$days').hashCode & 0x7fffffff;
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

  Future<void> cancelReminders(String ownerId,
      {List<int> reminderDaysBefore = const [30, 7, 0]}) async {
    for (final days in reminderDaysBefore) {
      await _plugin.cancel(('$ownerId-$days').hashCode & 0x7fffffff);
    }
  }

  /// Cancels a product's own reminders plus every one of its events' reminders.
  Future<void> cancelForProduct(String productId, {List<String> eventIds = const []}) async {
    await cancelReminders(productId);
    for (final eventId in eventIds) {
      await cancelReminders(eventId);
    }
  }
}