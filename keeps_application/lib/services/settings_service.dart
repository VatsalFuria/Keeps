import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class SettingsService {
  SettingsService._();
  static final instance = SettingsService._();

  static const defaultReminderDays = [30, 7, 0];

  Future<List<int>> reminderDaysBefore() async {
    final file = await _settingsFile();
    if (!await file.exists()) return defaultReminderDays;

    try {
      final data = jsonDecode(await file.readAsString());
      final rawDays = data['reminderDaysBefore'];
      if (rawDays is! List) return defaultReminderDays;
      final days = rawDays
          .map((day) => int.tryParse(day.toString()))
          .whereType<int>()
          .where((day) => day >= 0)
          .toSet()
          .toList()
        ..sort((a, b) => b.compareTo(a));
      return days.isEmpty ? defaultReminderDays : days;
    } catch (_) {
      return defaultReminderDays;
    }
  }

  Future<void> saveReminderDaysBefore(List<int> days) async {
    final cleanDays = days.where((day) => day >= 0).toSet().toList()
      ..sort((a, b) => b.compareTo(a));
    final file = await _settingsFile();
    await file.writeAsString(jsonEncode({
      'reminderDaysBefore':
          cleanDays.isEmpty ? defaultReminderDays : cleanDays,
    }));
  }

  Future<File> _settingsFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/keeps_settings.json');
  }
}
