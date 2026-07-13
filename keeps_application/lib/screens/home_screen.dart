import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_providers.dart';
import '../widgets/product_card.dart';
import 'add_edit_product_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(allProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keeps'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              decoration: const InputDecoration(hintText: 'Search products…'),
              onChanged: (v) => setState(() => _query = v.toLowerCase()),
            ),
          ),
        ),
      ),
      body: productsAsync.when(
        data: (products) {
          final filtered = _query.isEmpty
              ? products
              : products.where((p) {
                  final haystack =
                      '${p.name} ${p.brand ?? ''} ${p.category ?? ''} ${p.status}'
                          .toLowerCase();
                  return haystack.contains(_query);
                }).toList();

          if (filtered.isEmpty) {
            return const Center(
              child: Text('No products yet.\nTap + to add your first one.',
                  textAlign: TextAlign.center),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filtered.length,
            itemBuilder: (context, i) => ProductCard(
              product: filtered[i],
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProductDetailScreen(productId: filtered[i].id),
              )),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AddEditProductScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}