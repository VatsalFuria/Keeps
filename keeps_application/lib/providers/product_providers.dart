import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../models/stats.dart';
import 'database_provider.dart';

final allProductsProvider = StreamProvider.autoDispose<List<Product>>(
  (ref) => ref.watch(databaseProvider).watchAllProducts(),
  name: 'allProductsProvider',
);

final productProvider = StreamProvider.autoDispose.family<Product?, String>(
  (ref, id) => ref.watch(databaseProvider).watchProduct(id),
  name: 'productProvider',
);

final productEventsProvider =
    StreamProvider.autoDispose.family<List<Event>, String>(
  (ref, productId) =>
      ref.watch(databaseProvider).watchEventsForProduct(productId),
  name: 'productEventsProvider',
);

final journalHistoryProvider =
    StreamProvider.autoDispose.family<List<JournalRevision>, String>(
  (ref, productId) =>
      ref.watch(databaseProvider).watchJournalHistory(productId),
  name: 'journalHistoryProvider',
);

final productStatsProvider =
    FutureProvider.autoDispose.family<ProductStats, String>((ref, productId) {
  final db = ref.watch(databaseProvider);
  ref.watch(productEventsProvider(productId)); // recompute when events change
  return db.computeStats(productId);
}, name: 'productStatsProvider');
