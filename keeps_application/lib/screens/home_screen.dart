import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_providers.dart';
import '../widgets/product_card.dart';
import '../theme/app_theme.dart';
import 'add_edit_product_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _query = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(allProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keeps', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products…',
                hintStyle: const TextStyle(color: AppColors.text2),
                prefixIcon: const Icon(Icons.search, color: AppColors.text2),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.bg2,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
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
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _query.isEmpty ? Icons.inventory_2_outlined : Icons.search_off_outlined,
                      size: 64,
                      color: AppColors.text2.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _query.isEmpty ? 'No products yet' : 'No matches found',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _query.isEmpty
                          ? 'Tap the + button below to add your first item.'
                          : 'Try adjusting your search terms.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.text2, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: filtered.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AddEditProductScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}