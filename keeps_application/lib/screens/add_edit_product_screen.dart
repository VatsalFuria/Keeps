import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' hide Column;
import '../data/database.dart';
import '../providers/database_provider.dart';
import '../services/notification_service.dart';
import '../services/settings_service.dart';
import '../theme/app_theme.dart';

class AddEditProductScreen extends ConsumerStatefulWidget {
  final Product? product; // null = create, non-null = edit
  final String initialJournal;
  const AddEditProductScreen({super.key, this.product, this.initialJournal = ''});

  @override
  ConsumerState<AddEditProductScreen> createState() =>
      _AddEditProductScreenState();
}

class _AddEditProductScreenState extends ConsumerState<AddEditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _category;
  late final TextEditingController _brand;
  late final TextEditingController _price;
  late final TextEditingController _journal;

  late DateTime _purchaseDate;
  DateTime? _warrantyExpiry;
  bool _isSaving = false;

  bool get _isEditing => widget.product != null;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _name = TextEditingController(text: p?.name ?? '');
    _category = TextEditingController(text: p?.category ?? '');
    _brand = TextEditingController(text: p?.brand ?? '');
    _price = TextEditingController(
        text: (p != null && p.purchasePrice != 0)
            ? p.purchasePrice.toString()
            : '');
    _journal = TextEditingController(text: widget.initialJournal);
    _purchaseDate = p?.purchaseDate ?? DateTime.now();
    _warrantyExpiry = p?.warrantyExpiry;
  }

  @override
  void dispose() {
    _name.dispose();
    _category.dispose();
    _brand.dispose();
    _price.dispose();
    _journal.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isWarranty}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate:
          isWarranty ? (_warrantyExpiry ?? DateTime.now()) : _purchaseDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.accent,
              onPrimary: Colors.white,
              surface: AppColors.bg2,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(
          () => isWarranty ? _warrantyExpiry = picked : _purchaseDate = picked);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    try {
      final db = ref.read(databaseProvider);
      final now = DateTime.now();
      final id = widget.product?.id ?? const Uuid().v4();

      await db.upsertProduct(ProductsCompanion(
        id: Value(id),
        name: Value(_name.text.trim()),
        category: Value(_category.text.trim()),
        brand: Value(_brand.text.trim()),
        purchasePrice: Value(double.tryParse(_price.text) ?? 0),
        purchaseDate: Value(_purchaseDate),
        warrantyExpiry: Value(_warrantyExpiry),
        createdAt: Value(widget.product?.createdAt ?? now),
        updatedAt: Value(now),
      ));

      await db.setProductJournal(
          id: const Uuid().v4(),
          productId: id,
          content: _journal.text.trim(),
          createdAt: now,
      );

      if (_warrantyExpiry != null) {
        final reminderDays =
            await SettingsService.instance.reminderDaysBefore();
        await db.upsertWarranty(WarrantiesCompanion.insert(
          id: 'product-$id',
          productId: Value(id),
          kind: 'product',
          expiryDate: _warrantyExpiry!,
          reminderDaysBefore: Value(reminderDays.join(',')),
        ));
        await NotificationService.instance.scheduleWarrantyReminders(
          ownerId: id,
          productName: _name.text.trim(),
          expiry: _warrantyExpiry!,
          reminderDaysBefore: reminderDays,
        );
      } else if (_isEditing) {
        await NotificationService.instance.cancelReminders(id);
        await db.deleteWarranty('product-$id');
      }

      if (mounted) Navigator.of(context).pop(id);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving product: $e')),
        );
        setState(() => _isSaving = false);
      }
    }
  }

  InputDecoration _buildInputDecoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: AppColors.bg2,
      labelStyle: const TextStyle(color: AppColors.text2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.bg, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final df = DateFormat.yMMMd();

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Product' : 'New Product',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            const Text('PRODUCT DETAILS',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: AppColors.text2)),
            const SizedBox(height: 12),
            TextFormField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              decoration: _buildInputDecoration('Name *'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _brand,
                    textCapitalization: TextCapitalization.words,
                    decoration: _buildInputDecoration('Brand'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _category,
                    textCapitalization: TextCapitalization.words,
                    decoration: _buildInputDecoration('Category'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('PURCHASE INFO',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: AppColors.text2)),
            const SizedBox(height: 12),
            TextFormField(
              controller: _price,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: _buildInputDecoration('Purchase Price (\$)'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _pickDate(isWarranty: false),
                    borderRadius: BorderRadius.circular(12),
                    child: InputDecorator(
                      decoration: _buildInputDecoration('Purchase Date *'),
                      child: Text(df.format(_purchaseDate),
                          style: const TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: () => _pickDate(isWarranty: true),
                    borderRadius: BorderRadius.circular(12),
                    child: InputDecorator(
                      decoration: _buildInputDecoration('Warranty Expiry'),
                      child: Text(
                        _warrantyExpiry == null
                            ? 'Not set'
                            : df.format(_warrantyExpiry!),
                        style: TextStyle(
                          fontSize: 15,
                          color:
                              _warrantyExpiry == null ? AppColors.text2 : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(_isEditing ? 'JOURNAL' : 'INITIAL THOUGHTS',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: AppColors.text2)),
            const SizedBox(height: 12),
            TextFormField(
              controller: _journal,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: _buildInputDecoration(
                _isEditing ? 'Journal note (optional)' : 'Purchase Journal',
                hint: _isEditing
                    ? 'Current notes about this product...'
                    : 'Why did you buy it? Alternatives, expectations, concerns...',
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed:
                        _isSaving ? null : () => Navigator.of(context).pop(),
                    child: const Text('Cancel', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _isSaving ? null : _save,
                    child: _isSaving
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white))
                        : Text(_isEditing ? 'Save Changes' : 'Save Product',
                            style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
