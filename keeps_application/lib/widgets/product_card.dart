import 'package:flutter/material.dart';
import '../data/database.dart';
import '../models/event_types.dart';
import '../theme/app_theme.dart';
import 'warranty_badge.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final years =
        (DateTime.now().difference(product.purchaseDate).inDays / 365).toStringAsFixed(1);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(product.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  WarrantyBadge(product: product),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                [
                  if ((product.brand ?? '').isNotEmpty) product.brand!,
                  if ((product.category ?? '').isNotEmpty) product.category!,
                  '${years}y old',
                  prettyStatus(product.status),
                ].join(' · '),
                style: const TextStyle(color: AppColors.text2, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}