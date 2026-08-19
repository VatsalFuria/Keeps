import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../data/database.dart';

class NotificationService {
  NotificationService._();
  static final instance = NotificationService._();
  final _plugin = FlutterLocalNotificationsPlugin();
  static const _reminderHour = 9;

  Future<void> init() async {
    tzdata.initializeTimeZones();
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _plugin
        .initialize(const InitializationSettings(android: androidInit));

    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
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
    String warrantyLabel = 'warranty',
  }) async {
    await cancelReminders(ownerId, reminderDaysBefore: reminderDaysBefore);

    final now = DateTime.now();

    for (final days in reminderDaysBefore) {
      var fireDate = _reminderDateFor(expiry, days);
      if (fireDate.isBefore(now)) {
        if (!_isSameDate(fireDate, now)) continue;
        fireDate = now.add(const Duration(seconds: 10));
      }

      final id = ('$ownerId-$days').hashCode & 0x7fffffff;
      await _plugin.zonedSchedule(
        id,
        'Warranty reminder',
        days == 0
            ? "$productName's $warrantyLabel expires today."
            : "$productName's $warrantyLabel expires in $days day${days == 1 ? '' : 's'}.",
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

  DateTime _reminderDateFor(DateTime expiry, int daysBefore) {
    final reminderDate = expiry.subtract(Duration(days: daysBefore));
    return DateTime(
      reminderDate.year,
      reminderDate.month,
      reminderDate.day,
      _reminderHour,
    );
  }

  bool _isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  Future<void> cancelReminders(String ownerId,
      {List<int> reminderDaysBefore = const [30, 7, 0]}) async {
    for (final days in reminderDaysBefore) {
      await _plugin.cancel(('$ownerId-$days').hashCode & 0x7fffffff);
    }
  }

  Future<void> rescheduleAllWarranties({
    required AppDatabase db,
    required List<int> reminderDays,
  }) async {
    await _plugin.cancelAll();

    final warranties = await db.getAllWarranties();
    if (warranties.isEmpty) return;

    final products = await db.getAllProducts();
    final productMap = {for (final product in products) product.id: product};

    for (final warranty in warranties) {
      final ownerId = warranty.eventId ?? warranty.productId;
      if (ownerId == null) continue;

      final productName = warranty.productId != null
          ? (productMap[warranty.productId!]?.name ?? 'Product')
          : 'Product';

      final warrantyLabel = switch (warranty.kind) {
        'repair' => 'repair warranty',
        'product' => 'warranty',
        _ => '${warranty.kind} warranty',
      };

      await scheduleWarrantyReminders(
        ownerId: ownerId,
        productName: productName,
        expiry: warranty.expiryDate,
        reminderDaysBefore: reminderDays,
        warrantyLabel: warrantyLabel,
      );
    }
  }

  /// Cancels a product's own reminders plus every one of its events' reminders.
  Future<void> cancelForProduct(
    String productId, {
    List<String> eventIds = const [],
  }) async {
    await cancelReminders(productId);
    for (final eventId in eventIds) {
      await cancelReminders(eventId);
    }
  }

  /// Debug helper: lists every notification currently scheduled (not yet
  /// delivered). Useful for confirming two different owners (a product
  /// warranty vs. a repair-event warranty) produced distinct, non-colliding
  /// notification ids instead of one overwriting the other.
  Future<List<PendingNotificationRequest>> pendingRequests() =>
      _plugin.pendingNotificationRequests();

  /// Debug helper: fires a notification ~10 seconds from now regardless of
  /// any product data, to confirm scheduling + permissions actually work
  /// end-to-end on this device.
  Future<void> scheduleDebugTestNotification() async {
    final fireDate = DateTime.now().add(const Duration(seconds: 10));
    await _plugin.zonedSchedule(
      999999999,
      'Keeps test notification',
      'If you see this, scheduling and permissions are both working.',
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
