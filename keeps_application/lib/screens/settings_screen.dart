import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/export_service.dart';
import '../services/settings_service.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _reminderDays = TextEditingController();
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _reminderDays.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final days = await SettingsService.instance.reminderDaysBefore();
    if (!mounted) return;
    setState(() {
      _reminderDays.text = days.join(', ');
      _loading = false;
    });
  }

  Future<void> _saveReminderDays() async {
    final days = _parseReminderDays(_reminderDays.text);
    if (days.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter at least one reminder day.')),
      );
      return;
    }

    setState(() => _saving = true);
    await SettingsService.instance.saveReminderDaysBefore(days);
    if (!mounted) return;
    setState(() {
      _reminderDays.text = days.join(', ');
      _saving = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reminder schedule saved.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'REMINDERS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: AppColors.text2,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _reminderDays,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Days before expiry',
                    hintText: '30, 7, 0',
                    filled: true,
                    fillColor: AppColors.bg2,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _saving ? null : _saveReminderDays,
                  icon: const Icon(Icons.notifications_active_outlined),
                  label: Text(_saving ? 'Saving...' : 'Save Reminder Schedule'),
                ),
                const SizedBox(height: 28),
                const Text(
                  'BACKUP',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: AppColors.text2,
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => ExportService.exportAllJson(ref),
                  icon: const Icon(Icons.ios_share_outlined),
                  label: const Text('Export All Data'),
                ),
              ],
            ),
    );
  }
}

List<int> _parseReminderDays(String raw) {
  final days = raw
      .split(',')
      .map((value) => int.tryParse(value.trim()))
      .whereType<int>()
      .where((value) => value >= 0)
      .toSet()
      .toList()
    ..sort((a, b) => b.compareTo(a));
  return days;
}
