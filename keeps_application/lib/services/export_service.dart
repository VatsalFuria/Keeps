import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    final payload = {
      'product': product.toJson(),
      'events': events.map((e) => e.toJson()).toList(),
      'journal': journal.map((j) => j.toJson()).toList(),
    };

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${product.name.replaceAll(RegExp(r"\s+"), "_")}.json');
    await file.writeAsString(const JsonEncoder.withIndent('  ').convert(payload));
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: 'Keeps export: ${product.name}',
      ),
    );
  }

  // Markdown and PDF export consume the same product+events+journal payload
  // above (Section 6.10). Markdown: emit a "## {type}" heading per timeline
  // entry from that map. PDF: pass the resulting Markdown string into
  // `Printing.layoutPdf` with `pdf`'s Document()/Text() widgets. Left as a
  // follow-up per the spec's own Phase 2 "PDF export polish" item — JSON is
  // fully wired and is the same data both other formats would read from.
}
