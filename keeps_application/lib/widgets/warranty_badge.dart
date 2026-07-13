import 'package:flutter/material.dart';
import '../data/database.dart';
import '../theme/app_theme.dart';

class WarrantyBadge extends StatelessWidget {
  final Product product;
  const WarrantyBadge({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.warrantyExpiry == null || product.status != 'Active') {
      return const SizedBox.shrink();
    }
    final days = product.warrantyExpiry!.difference(DateTime.now()).inDays;
    Color color;
    String label;
    if (days < 0) {
      color = AppColors.text2;
      label = 'Warranty expired';
    } else if (days <= 7) {
      color = AppColors.danger;
      label = 'Warranty: ${days}d left';
    } else if (days <= 30) {
      color = AppColors.warn;
      label = 'Warranty: ${days}d left';
    } else {
      color = AppColors.accent;
      label = 'Warranty active';
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }
}