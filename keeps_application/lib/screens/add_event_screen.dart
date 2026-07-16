import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../data/database.dart';
import '../providers/database_provider.dart';
import '../models/event_types.dart';

class AddEventScreen extends ConsumerStatefulWidget {
  final String productId;
  const AddEventScreen({super.key, required this.productId});
  @override
  ConsumerState<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends ConsumerState<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _customType = TextEditingController();
  final _cost = TextEditingController();
  final _note = TextEditingController();
  String _type = 'Observation';
  DateTime _date = DateTime.now();
  DateTime? _warrantyExpiry;
  bool _useCustomType = false;
  final _types = kEventIcons.keys.toList();

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final db = ref.read(databaseProvider);
    final type = _useCustomType ? _customType.text.trim() : _type;
    await db.insertEvent(EventsCompanion.insert(
      id: const Uuid().v4(),
      productId: widget.productId,
      date: _date,
      type: type,
      cost: Value(double.tryParse(_cost.text)),
      warrantyExpiry: Value(_warrantyExpiry),
      markdownNote: Value(_note.text.trim()),
      createdAt: DateTime.now(),
    ));
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<String>(
              initialValue: _useCustomType ? null : _type,
              decoration: const InputDecoration(labelText: 'Type'),
              items: [
                ..._types.map(
                    (t) => DropdownMenuItem(value: t, child: Text('${iconFor(t)}  $t'))),
                const DropdownMenuItem(value: '__custom__', child: Text('Custom…')),
              ],
              onChanged: (v) => setState(() {
                if (v == '__custom__') {
                  _useCustomType = true;
                } else {
                  _useCustomType = false;
                  _type = v!;
                }
              }),
            ),
            if (_useCustomType)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _customType,
                  decoration: const InputDecoration(labelText: 'Custom type name'),
                  validator: (v) =>
                      _useCustomType && (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
              ),
            const SizedBox(height: 14),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Date'),
              subtitle: Text('${_date.toLocal()}'.split(' ').first),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) setState(() => _date = picked);
              },
            ),
            TextFormField(
              controller: _cost,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cost (optional)'),
            ),
            const SizedBox(height: 14),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Warranty Expiry (optional)'),
              subtitle: Text(_warrantyExpiry == null
                  ? 'Not set'
                  : '${_warrantyExpiry!.toLocal()}'.split(' ').first),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _warrantyExpiry ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) setState(() => _warrantyExpiry = picked);
              },
            ),
            TextFormField(
              controller: _note,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Notes'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _save, child: const Text('Save Event')),
          ],
        ),
      ),
    );
  }
}
