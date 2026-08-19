import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../providers/database_provider.dart';

class ExportService {
  static Future<void> exportProductJson(WidgetRef ref, String productId) async {
    final db = ref.read(databaseProvider);
    final product = await db.getProduct(productId);
    if (product == null) return;
    final events = await db.watchEventsForProduct(productId).first;
    final journal = await db.watchJournalHistory(productId).first;
    final attachments = await db.getAttachmentsForProduct(productId);
    final warranties = await db.getWarrantiesForProduct(productId);

    final payload = {
      'product': product.toJson(),
      'events': events.map((e) => e.toJson()).toList(),
      'journal': journal.isEmpty ? null : journal.first.toJson(),
      'attachments': attachments.map((a) => a.toJson()).toList(),
      'warranties': warranties.map((w) => w.toJson()).toList(),
    };

    final file = await _writeExportFile(
      '${_fileSafe(product.name)}.json',
      const JsonEncoder.withIndent('  ').convert(payload),
    );
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: 'Keeps export: ${product.name}',
      ),
    );
  }

  static Future<void> exportProductMarkdown(
    WidgetRef ref,
    String productId,
  ) async {
    final db = ref.read(databaseProvider);
    final product = await db.getProduct(productId);
    if (product == null) return;
    final events = await db.watchEventsForProduct(productId).first;
    final journal = await db.watchJournalHistory(productId).first;
    final attachments = await db.getAttachmentsForProduct(productId);
    final warranties = await db.getWarrantiesForProduct(productId);
    final df = DateFormat.yMMMd();
    final money = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
    final buffer = StringBuffer()
      ..writeln('# ${product.name}')
      ..writeln()
      ..writeln('- Brand: ${_valueOrNotSet(product.brand)}')
      ..writeln('- Category: ${_valueOrNotSet(product.category)}')
      ..writeln('- Status: ${product.status}')
      ..writeln('- Purchase date: ${df.format(product.purchaseDate)}')
      ..writeln('- Purchase price: ${money.format(product.purchasePrice)}');

    if (product.warrantyExpiry != null) {
      buffer.writeln(
        '- Product warranty expires: ${df.format(product.warrantyExpiry!)}',
      );
    }

    if (journal.isNotEmpty && journal.first.content.trim().isNotEmpty) {
      buffer
        ..writeln()
        ..writeln('## Journal')
        ..writeln()
        ..writeln(journal.first.content.trim());
    }

    if (warranties.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln('## Warranties');
      for (final warranty in warranties) {
        buffer.writeln(
          '- ${warranty.kind}: expires ${df.format(warranty.expiryDate)}; reminders ${warranty.reminderDaysBefore} days before',
        );
      }
    }

    buffer
      ..writeln()
      ..writeln('## Timeline')
      ..writeln()
      ..writeln('### Purchase - ${df.format(product.purchaseDate)}')
      ..writeln('- Cost: ${money.format(product.purchasePrice)}');

    for (final event in events) {
      final eventAttachments = attachments
          .where((attachment) => attachment.eventId == event.id)
          .toList();
      buffer
        ..writeln()
        ..writeln('### ${event.type} - ${df.format(event.date)}');
      if (event.cost != null) {
        buffer.writeln('- Cost: ${money.format(event.cost)}');
      }
      if (event.warrantyExpiry != null) {
        buffer
            .writeln('- Warranty expires: ${df.format(event.warrantyExpiry!)}');
      }
      if (event.markdownNote?.trim().isNotEmpty == true) {
        buffer
          ..writeln()
          ..writeln(event.markdownNote!.trim());
      }
      if (eventAttachments.isNotEmpty) {
        buffer
          ..writeln()
          ..writeln('Photos:');
        for (final attachment in eventAttachments) {
          buffer.writeln('- ${attachment.filePath}');
        }
      }
    }

    final file = await _writeExportFile(
      '${_fileSafe(product.name)}.md',
      buffer.toString(),
    );
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: 'Keeps Markdown export: ${product.name}',
      ),
    );
  }

  static Future<void> exportAllJson(WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    final products = await db.getAllProducts();
    final productPayloads = [];

    for (final product in products) {
      final events = await db.watchEventsForProduct(product.id).first;
      final journal = await db.watchJournalHistory(product.id).first;
      final attachments = await db.getAttachmentsForProduct(product.id);
      final warranties = await db.getWarrantiesForProduct(product.id);
      productPayloads.add({
        'product': product.toJson(),
        'events': events.map((e) => e.toJson()).toList(),
        'journal': journal.isEmpty ? null : journal.first.toJson(),
        'attachments': attachments.map((a) => a.toJson()).toList(),
        'warranties': warranties.map((w) => w.toJson()).toList(),
      });
    }

    final file = await _writeExportFile(
      'keeps_library_backup.json',
      const JsonEncoder.withIndent('  ').convert({
        'exportedAt': DateTime.now().toIso8601String(),
        'products': productPayloads,
      }),
    );
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: 'Keeps full-library backup',
      ),
    );
  }

  static Future<File> _writeExportFile(String fileName, String contents) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsString(contents);
    return file;
  }

  static String _valueOrNotSet(String? value) =>
      value?.trim().isNotEmpty == true ? value!.trim() : 'Not set';

  static String _fileSafe(String value) =>
      value.trim().replaceAll(RegExp(r'[^A-Za-z0-9._-]+'), '_');
}
