import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../data/database.dart';
import '../providers/database_provider.dart';
import '../services/notification_service.dart';
import 'package:drift/drift.dart';

class AddEditProductScreen extends ConsumerStatefulWidget {
  const AddEditProductScreen({super.key});
  @override
  ConsumerState<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends ConsumerState<AddEditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _category = TextEditingController();
  final _brand = TextEditingController();
  final _price = TextEditingController();
  final _journal = TextEditingController();
  DateTime _purchaseDate = DateTime.now();
  DateTime? _warrantyExpiry;

  Future<void> _pickDate({required bool isWarranty}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isWarranty ? (_warrantyExpiry ?? DateTime.now()) : _purchaseDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => isWarranty ? _warrantyExpiry = picked : _purchaseDate = picked);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final db = ref.read(databaseProvider);
    final id = const Uuid().v4();
    final now = DateTime.now();

    await db.upsertProduct(ProductsCompanion.insert(
      id: id,
      name: _name.text.trim(),
      category: Value(_category.text.trim()),
      brand: Value(_brand.text.trim()),
      purchasePrice: Value(double.tryParse(_price.text) ?? 0),
      purchaseDate: _purchaseDate,
      warrantyExpiry: Value(_warrantyExpiry),
      createdAt: now,
      updatedAt: now,
    ));

    if (_journal.text.trim().isNotEmpty) {
      await db.appendJournalRevision(JournalRevisionsCompanion.insert(
        id: const Uuid().v4(),
        productId: id,
        content: _journal.text.trim(),
        createdAt: now,
      ));
    }

    if (_warrantyExpiry != null) {
      await NotificationService.instance.scheduleWarrantyReminders(
        productId: id,
        productName: _name.text.trim(),
        expiry: _warrantyExpiry!,
      );
    }

    if (mounted) Navigator.of(context).pop(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Product')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Name *'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
                controller: _category,
                decoration: const InputDecoration(labelText: 'Category')),
            const SizedBox(height: 14),
            TextFormField(
                controller: _brand, decoration: const InputDecoration(labelText: 'Brand')),
            const SizedBox(height: 14),
            TextFormField(
              controller: _price,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Purchase Price'),
            ),
            const SizedBox(height: 14),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Purchase Date *'),
              subtitle: Text('${_purchaseDate.toLocal()}'.split(' ').first),
              onTap: () => _pickDate(isWarranty: false),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Warranty Expiry'),
              subtitle: Text(_warrantyExpiry == null
                  ? 'Not set'
                  : '${_warrantyExpiry!.toLocal()}'.split(' ').first),
              onTap: () => _pickDate(isWarranty: true),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _journal,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText:
                    'Purchase Journal — why did you buy it, alternatives, concerns, expectations',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: _save, child: const Text('Save Product'))),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}