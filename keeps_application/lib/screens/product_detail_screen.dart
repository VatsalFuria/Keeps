import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../data/database.dart';
import '../models/stats.dart';
import '../providers/product_providers.dart';
import '../providers/database_provider.dart';
import '../models/event_types.dart';
import '../theme/app_theme.dart';
import '../widgets/warranty_badge.dart';
import 'add_event_screen.dart';
import 'end_of_life_screen.dart';
import '../services/export_service.dart';

class ProductDetailScreen extends ConsumerWidget {
  final String productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider(productId));
    final eventsAsync = ref.watch(productEventsProvider(productId));
    final statsAsync = ref.watch(productStatsProvider(productId));
    final journalAsync = ref.watch(journalHistoryProvider(productId));

    return Scaffold(
      body: productAsync.when(
        data: (product) {
          if (product == null) return const Center(child: Text('Product not found'));
          final latestJournal =
              journalAsync.value?.isNotEmpty == true ? journalAsync.value!.first.content : '';

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.bg2,
                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  title: Text(
                    product.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  background: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 56, 16, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            [product.brand, product.category]
                                .where((e) => (e ?? '').isNotEmpty)
                                .join(' · '),
                            style: const TextStyle(color: AppColors.text2, fontSize: 14),
                          ),
                        ),
                        WarrantyBadge(product: product),
                      ],
                    ),
                  ),
                ),
              ),
              
              // --- STATS DASHBOARD ---
              SliverToBoxAdapter(
                child: statsAsync.when(
                  data: (stats) => _StatsRow(stats: stats),
                  loading: () => const Padding(
                      padding: EdgeInsets.all(16), child: LinearProgressIndicator()),
                  error: (e, _) =>
                      Padding(padding: const EdgeInsets.all(16), child: Text('Stats error: $e')),
                ),
              ),

              // --- ACTION BUTTONS (Add Event & 2x2 Grid) ---
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => AddEventScreen(productId: product.id))),
                        icon: const Icon(Icons.add, size: 20),
                        label: const Text('Add Event', style: TextStyle(fontSize: 16)),
                      ),
                      const SizedBox(height: 12),
                      GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 48,
                        ),
                        children: [
                          if (product.status == 'Active')
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => EndOfLifeScreen(productId: product.id))),
                              child: const Text('Mark Complete'),
                            ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () => _editJournal(context, ref, product.id, latestJournal),
                            child: const Text('Journal'),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () => ExportService.exportProductJson(ref, product.id),
                            child: const Text('Export JSON'),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.danger,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Delete product?'),
                                  content: const Text(
                                      'This deletes the product and all its events. This cannot be undone.'),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context, false),
                                        child: const Text('Cancel')),
                                    TextButton(
                                        style: TextButton.styleFrom(foregroundColor: AppColors.danger),
                                        onPressed: () => Navigator.pop(context, true),
                                        child: const Text('Delete')),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                await ref.read(databaseProvider).deleteProductCascade(product.id);
                                if (context.mounted) Navigator.of(context).pop();
                              }
                            },
                            child: const Text('Delete Product'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // --- TIMELINE HEADER ---
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 12),
                  child: Text('TIMELINE',
                      style: TextStyle(
                          fontSize: 13, 
                          fontWeight: FontWeight.w600, 
                          letterSpacing: 1.2, 
                          color: AppColors.text2)),
                ),
              ),

              // --- TIMELINE EVENTS ---
              eventsAsync.when(
                data: (events) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      if (i == 0) {
                        return _TimelineTile(
                          icon: iconFor('Purchase'),
                          date: product.purchaseDate,
                          type: 'Purchase',
                          cost: product.purchasePrice,
                          note: latestJournal,
                        );
                      }
                      final e = events[i - 1];
                      return _TimelineTile(
                        icon: iconFor(e.type),
                        date: e.date,
                        type: e.type,
                        cost: e.cost,
                        note: e.markdownNote,
                        onDelete: () => ref.read(databaseProvider).deleteEvent(e.id),
                      );
                    },
                    childCount: events.length + 1,
                  ),
                ),
                loading: () =>
                    const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
                error: (e, _) => SliverToBoxAdapter(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Error: $e'),
                )),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 60)), // Extra bottom padding
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  void _editJournal(
      BuildContext context, WidgetRef ref, String productId, String currentContent) {
    final controller = TextEditingController(text: currentContent);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: 24, bottom: MediaQuery.of(ctx).viewInsets.bottom + 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Update Journal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller, 
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Add notes about this product...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () async {
                if (controller.text.trim().isEmpty) return;
                await ref.read(databaseProvider).appendJournalRevision(
                      JournalRevisionsCompanion.insert(
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                        productId: productId,
                        content: controller.text.trim(),
                        createdAt: DateTime.now(),
                      ),
                    );
                if (ctx.mounted) Navigator.pop(ctx);
              },
              child: const Text('Save New Revision', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final ProductStats stats;
  const _StatsRow({required this.stats});

  @override
  Widget build(BuildContext context) {
    final money = NumberFormat.simpleCurrency();

    Widget buildStatCard(String label, String value, {bool isPrimary = false}) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: isPrimary ? 16 : 12, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.bg2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: isPrimary ? 24 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.text2,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: buildStatCard('Total Cost', money.format(stats.totalCost), isPrimary: true)),
              const SizedBox(width: 12),
              Expanded(child: buildStatCard('Cost per Day', money.format(stats.costPerDay), isPrimary: true)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: buildStatCard('Owned', '${(stats.ownershipDays / 365).toStringAsFixed(1)}y')),
              const SizedBox(width: 12),
              Expanded(child: buildStatCard('Repairs', '${stats.repairs}')),
              const SizedBox(width: 12),
              Expanded(child: buildStatCard('Maintenance', '${stats.maintenance}')),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineTile extends StatefulWidget {
  final String icon;
  final DateTime date;
  final String type;
  final double? cost;
  final String? note;
  final VoidCallback? onDelete;

  const _TimelineTile({
    required this.icon,
    required this.date,
    required this.type,
    this.cost,
    this.note,
    this.onDelete,
  });

  @override
  State<_TimelineTile> createState() => _TimelineTileState();
}

class _TimelineTileState extends State<_TimelineTile> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat.yMMMd();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.bg,
            child: Text(widget.icon, style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _open = !_open),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.bg2,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(df.format(widget.date),
                        style: const TextStyle(fontSize: 12, color: AppColors.text2)),
                    Text(
                      widget.cost != null
                          ? '${widget.type} · \$${widget.cost!.toStringAsFixed(2)}'
                          : widget.type,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    if (!_open && (widget.note ?? '').isNotEmpty)
                      Text(widget.note!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: AppColors.text2, fontSize: 13)),
                    if (_open) ...[
                      const SizedBox(height: 8),
                      Text(widget.note?.isNotEmpty == true ? widget.note! : '(no notes)',
                          style: const TextStyle(fontSize: 14)),
                      if (widget.onDelete != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.danger,
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text('Delete this event?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () => Navigator.pop(context, false),
                                          child: const Text('Cancel')),
                                      TextButton(
                                          style: TextButton.styleFrom(foregroundColor: AppColors.danger),
                                          onPressed: () => Navigator.pop(context, true),
                                          child: const Text('Delete')),
                                    ],
                                  ),
                                );
                                if (confirm == true) widget.onDelete!();
                              },
                              child: const Text('Delete Event'),
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}