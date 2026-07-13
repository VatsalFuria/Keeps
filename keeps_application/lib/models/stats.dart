class ProductStats {
  final int ownershipDays;
  final double totalCost;
  final double costPerDay;
  final int repairs;
  final int maintenance;
  final int? warrantyDays;

  const ProductStats({
    required this.ownershipDays,
    required this.totalCost,
    required this.costPerDay,
    required this.repairs,
    required this.maintenance,
    this.warrantyDays,
  });

  factory ProductStats.empty() => const ProductStats(
      ownershipDays: 0, totalCost: 0, costPerDay: 0, repairs: 0, maintenance: 0);
}