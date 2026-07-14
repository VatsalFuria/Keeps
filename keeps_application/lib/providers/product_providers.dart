import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/database.dart';
import '../models/stats.dart';
import 'database_provider.dart';

part 'product_providers.g.dart';

@riverpod
Stream<List<Product>> allProducts(AllProductsRef ref) =>
    ref.watch(databaseProvider).watchAllProducts();

@riverpod
Stream<Product?> product(ProductRef ref, String id) =>
    ref.watch(databaseProvider).watchProduct(id);

@riverpod
Stream<List<Event>> productEvents(ProductEventsRef ref, String productId) =>
    ref.watch(databaseProvider).watchEventsForProduct(productId);

@riverpod
Stream<List<JournalRevision>> journalHistory(JournalHistoryRef ref, String productId) =>
    ref.watch(databaseProvider).watchJournalHistory(productId);

@riverpod
Future<ProductStats> productStats(ProductStatsRef ref, String productId) {
  final db = ref.watch(databaseProvider);
  ref.watch(productEventsProvider(productId)); // recompute when events change
  return db.computeStats(productId);
}