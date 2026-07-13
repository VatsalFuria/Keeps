import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../models/stats.dart';

part 'database.g.dart';

class Products extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text().nullable()();
  TextColumn get brand => text().nullable()();
  TextColumn get model => text().nullable()();
  TextColumn get serialNumber => text().nullable()();
  TextColumn get seller => text().nullable()();
  TextColumn get purchaseLocation => text().nullable()();
  RealColumn get purchasePrice => real().withDefault(const Constant(0))();
  DateTimeColumn get purchaseDate => dateTime()();
  DateTimeColumn get warrantyExpiry => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('Active'))();
  IntColumn get expectedLifetimeMonths => integer().nullable()();
  TextColumn get tags => text().nullable()(); // comma-separated, per spec
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Events extends Table {
  TextColumn get id => text()();
  TextColumn get productId => text().references(Products, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()(); // free string, extensible
  RealColumn get cost => real().nullable()();
  DateTimeColumn get warrantyExpiry => dateTime().nullable()();
  TextColumn get markdownNote => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Journal is append-only: editing creates a new revision rather than
/// overwriting, per Principle 4 (immutable history) in the spec.
class JournalRevisions extends Table {
  TextColumn get id => text()();
  TextColumn get productId => text().references(Products, #id)();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Attachments extends Table {
  TextColumn get id => text()();
  TextColumn get productId => text().nullable().references(Products, #id)();
  TextColumn get eventId => text().nullable().references(Events, #id)();
  TextColumn get type => text()(); // invoice | manual | photo | warrantyCard | other
  TextColumn get filePath => text()();
  TextColumn get thumbnailPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Warranties extends Table {
  TextColumn get id => text()();
  TextColumn get productId => text().nullable().references(Products, #id)();
  TextColumn get eventId => text().nullable().references(Events, #id)();
  TextColumn get kind => text()(); // product | repair | extended | accessory
  DateTimeColumn get expiryDate => dateTime()();
  TextColumn get reminderDaysBefore => text().withDefault(const Constant('30,7,0'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Products, Events, JournalRevisions, Attachments, Warranties])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'keeps_db'));

  @override
  int get schemaVersion => 1;

  // ---- Products ----
  Stream<List<Product>> watchAllProducts() =>
      (select(products)..orderBy([(p) => OrderingTerm.desc(p.updatedAt)])).watch();

  Future<Product?> getProduct(String id) =>
      (select(products)..where((p) => p.id.equals(id))).getSingleOrNull();

  Stream<Product?> watchProduct(String id) =>
      (select(products)..where((p) => p.id.equals(id))).watchSingleOrNull();

  Future<void> upsertProduct(ProductsCompanion product) =>
      into(products).insertOnConflictUpdate(product);

  Future<void> deleteProductCascade(String id) => transaction(() async {
        await (delete(events)..where((e) => e.productId.equals(id))).go();
        await (delete(journalRevisions)..where((j) => j.productId.equals(id))).go();
        await (delete(attachments)..where((a) => a.productId.equals(id))).go();
        await (delete(warranties)..where((w) => w.productId.equals(id))).go();
        await (delete(products)..where((p) => p.id.equals(id))).go();
      });

  // ---- Events ----
  Stream<List<Event>> watchEventsForProduct(String productId) =>
      (select(events)
            ..where((e) => e.productId.equals(productId))
            ..orderBy([(e) => OrderingTerm.asc(e.date)]))
          .watch();

  Future<void> insertEvent(EventsCompanion event) => into(events).insert(event);

  Future<void> deleteEvent(String id) =>
      (delete(events)..where((e) => e.id.equals(id))).go();

  // ---- Journal (versioned, never overwritten) ----
  Stream<List<JournalRevision>> watchJournalHistory(String productId) =>
      (select(journalRevisions)
            ..where((j) => j.productId.equals(productId))
            ..orderBy([(j) => OrderingTerm.desc(j.createdAt)]))
          .watch();

  Future<void> appendJournalRevision(JournalRevisionsCompanion revision) =>
      into(journalRevisions).insert(revision);

  // ---- Derived stats — computed at query time, never stored (Principle 5) ----
  Future<ProductStats> computeStats(String productId) async {
    final product = await getProduct(productId);
    if (product == null) return ProductStats.empty();

    final eventRows =
        await (select(events)..where((e) => e.productId.equals(productId))).get();

    final now = DateTime.now();
    final reflections = eventRows.where((e) => e.type == 'Reflection').toList()
      ..sort((a, b) => a.date.compareTo(b.date));
    final endDate = product.status != 'Active' && reflections.isNotEmpty
        ? reflections.first.date
        : now;

    final ownershipDays =
        endDate.difference(product.purchaseDate).inDays.clamp(0, 1 << 30);
    final eventCost = eventRows.fold<double>(0, (sum, e) => sum + (e.cost ?? 0));
    final totalCost = product.purchasePrice + eventCost;
    final costPerDay = ownershipDays > 0 ? totalCost / ownershipDays : totalCost;

    int? warrantyDays;
    if (product.warrantyExpiry != null && product.status == 'Active') {
      warrantyDays = product.warrantyExpiry!.difference(now).inDays;
    }

    return ProductStats(
      ownershipDays: ownershipDays,
      totalCost: totalCost,
      costPerDay: costPerDay,
      repairs: eventRows.where((e) => e.type == 'Repair').length,
      maintenance: eventRows.where((e) => e.type == 'Maintenance').length,
      warrantyDays: warrantyDays,
    );
  }
}