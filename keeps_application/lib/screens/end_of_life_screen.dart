import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../data/database.dart';
import '../providers/database_provider.dart';
import '../models/event_types.dart';

class EndOfLifeScreen extends ConsumerStatefulWidget {
  final String productId;
  const EndOfLifeScreen({super.key, required this.productId});
  @override
  ConsumerState<EndOfLifeScreen> createState() => _EndOfLifeScreenState();
}

class _EndOfLifeScreenState extends ConsumerState<EndOfLifeScreen> {
  String _status = 'Sold';
  final _q1 = TextEditingController();
  final _q2 = TextEditingController();
  final _q3 = TextEditingController();
  final _q4 = TextEditingController();
  final _q5 = TextEditingController();

  Future<void> _save() async {
    final db = ref.read(databaseProvider);
    final note = 'Would buy again: ${_q1.text}\n\n'
        'What surprised me: ${_q2.text}\n\n'
        'Biggest strength: ${_q3.text}\n\n'
        'Biggest weakness: ${_q4.text}\n\n'
        'Final thoughts: ${_q5.text}';
    final now = DateTime.now();

    await db.insertEvent(EventsCompanion.insert(
      id: const Uuid().v4(),
      productId: widget.productId,
      date: now,
      type: 'Reflection',
      markdownNote: Value(note),
      createdAt: now,
    ));

    final product = await db.getProduct(widget.productId);
    if (product != null) {
      await db.upsertProduct(
          product.toCompanion(true).copyWith(status: Value(_status), updatedAt: Value(now)));
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    const statuses = ['Sold', 'Disposed', 'GivenAway', 'Lost', 'Stolen', 'Other'];
    return Scaffold(
      appBar: AppBar(title: const Text('Mark Complete')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<String>(
            initialValue: _status,
            decoration: const InputDecoration(labelText: 'What happened?'),
            items: statuses
                .map((s) => DropdownMenuItem(value: s, child: Text(prettyStatus(s))))
                .toList(),
            onChanged: (v) => setState(() => _status = v!),
          ),
          const SizedBox(height: 14),
          TextField(
              controller: _q1,
              decoration: const InputDecoration(labelText: 'Would you buy it again?'),
              maxLines: 3),
          const SizedBox(height: 14),
          TextField(
              controller: _q2,
              decoration: const InputDecoration(labelText: 'What surprised you?'),
              maxLines: 3),
          const SizedBox(height: 14),
          TextField(
              controller: _q3,
              decoration: const InputDecoration(labelText: 'Biggest strength?'),
              maxLines: 3),
          const SizedBox(height: 14),
          TextField(
              controller: _q4,
              decoration: const InputDecoration(labelText: 'Biggest weakness?'),
              maxLines: 3),
          const SizedBox(height: 14),
          TextField(
              controller: _q5,
              decoration: const InputDecoration(labelText: 'Final thoughts'),
              maxLines: 3),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _save, child: const Text('Save & Close Out')),
        ],
      ),
    );
  }
}