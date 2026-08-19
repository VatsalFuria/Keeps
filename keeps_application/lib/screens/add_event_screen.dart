import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../data/database.dart';
import '../providers/database_provider.dart';
import '../models/event_types.dart';
import '../theme/app_theme.dart';
import '../services/notification_service.dart';
import '../services/settings_service.dart';

class AddEventScreen extends ConsumerStatefulWidget {
  final String productId;
  final String productName;
  const AddEventScreen(
      {super.key, required this.productId, required this.productName});

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
  bool _isSaving = false;
  final List<XFile> _selectedPhotos = [];

  final _types = kEventIcons.keys.toList();

  Future<void> _pickPhotos() async {
    final photos = await ImagePicker().pickMultiImage(imageQuality: 85);
    if (photos.isEmpty) return;
    setState(() => _selectedPhotos.addAll(photos));
  }

  @override
  void dispose() {
    _customType.dispose();
    _cost.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isWarranty}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isWarranty ? (_warrantyExpiry ?? DateTime.now()) : _date,
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
      setState(() => isWarranty ? _warrantyExpiry = picked : _date = picked);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final db = ref.read(databaseProvider);
      final type = _useCustomType ? _customType.text.trim() : _type;
      final eventId = const Uuid().v4();

      await db.insertEvent(EventsCompanion.insert(
        id: eventId,
        productId: widget.productId,
        date: _date,
        type: type,
        cost: Value(double.tryParse(_cost.text)),
        warrantyExpiry: Value(_warrantyExpiry),
        markdownNote: Value(_note.text.trim()),
        createdAt: DateTime.now(),
      ));

      for (final photo in _selectedPhotos) {
        final attachmentId = const Uuid().v4();
        final dir = await getApplicationDocumentsDirectory();
        final attachmentsDir = Directory('${dir.path}/attachments');
        if (!await attachmentsDir.exists()) {
          await attachmentsDir.create(recursive: true);
        }
        final extension = p.extension(photo.path).isEmpty
            ? '.jpg'
            : p.extension(photo.path);
        final savedFile = File('${attachmentsDir.path}/$attachmentId$extension');
        await File(photo.path).copy(savedFile.path);
        await db.insertAttachment(AttachmentsCompanion.insert(
          id: attachmentId,
          productId: Value(widget.productId),
          eventId: Value(eventId),
          type: 'photo',
          filePath: savedFile.path,
          createdAt: DateTime.now(),
        ));
      }

      if (_warrantyExpiry != null) {
        final reminderDays =
            await SettingsService.instance.reminderDaysBefore();
        final isRepair = type.toLowerCase() == 'repair';
        await db.upsertWarranty(WarrantiesCompanion.insert(
          id: 'event-$eventId',
          productId: Value(widget.productId),
          eventId: Value(eventId),
          kind: isRepair ? 'repair' : 'event',
          expiryDate: _warrantyExpiry!,
          reminderDaysBefore: Value(reminderDays.join(',')),
        ));
        await NotificationService.instance.scheduleWarrantyReminders(
          ownerId: eventId,
          productName: widget.productName,
          expiry: _warrantyExpiry!,
          reminderDaysBefore: reminderDays,
          warrantyLabel: isRepair ? 'repair warranty' : '$type warranty',
        );
      }

      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Couldn\'t save this event. Check the date and try again: $e')),
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
        borderSide: const BorderSide(color: AppColors.accent, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final df = DateFormat.yMMMd();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            const Text('EVENT DETAILS',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: AppColors.text2)),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _useCustomType ? '__custom__' : _type,
              decoration: _buildInputDecoration('Event Type'),
              dropdownColor: AppColors.bg2,
              borderRadius: BorderRadius.circular(12),
              items: [
                ..._types.map((t) => DropdownMenuItem(
                    value: t, child: Text('${iconFor(t)}  $t'))),
                const DropdownMenuItem(
                    value: '__custom__', child: Text('✨  Custom…')),
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
            if (_useCustomType) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _customType,
                textCapitalization: TextCapitalization.words,
                decoration: _buildInputDecoration('Custom type name'),
                validator: (v) =>
                    _useCustomType && (v == null || v.trim().isEmpty)
                        ? 'Required'
                        : null,
              ),
            ],
            const SizedBox(height: 12),
            InkWell(
              onTap: () => _pickDate(isWarranty: false),
              borderRadius: BorderRadius.circular(12),
              child: InputDecorator(
                decoration: _buildInputDecoration('Date *'),
                child: Text(df.format(_date),
                    style: const TextStyle(fontSize: 15)),
              ),
            ),
            const SizedBox(height: 24),
            const Text('FINANCIALS & WARRANTY',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: AppColors.text2)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _cost,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: _buildInputDecoration('Cost (₹)'),
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
            const Text('ADDITIONAL NOTES',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: AppColors.text2)),
            const SizedBox(height: 12),
            TextFormField(
              controller: _note,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              decoration: _buildInputDecoration('Notes',
                  hint: 'Add details about this event...'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${_selectedPhotos.length} photo${_selectedPhotos.length == 1 ? '' : 's'} attached',
                    style: const TextStyle(color: AppColors.text2),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: _isSaving ? null : _pickPhotos,
                  icon: const Icon(Icons.photo_library_outlined, size: 18),
                  label: const Text('Add Photos'),
                ),
              ],
            ),
            if (_selectedPhotos.isNotEmpty) ...[
              const SizedBox(height: 12),
              SizedBox(
                height: 76,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedPhotos.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) => Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(_selectedPhotos[index].path),
                          width: 76,
                          height: 76,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: InkWell(
                          onTap: _isSaving
                              ? null
                              : () => setState(
                                    () => _selectedPhotos.removeAt(index),
                                  ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: const Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
                        : const Text('Save Event',
                            style: TextStyle(fontSize: 16)),
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
