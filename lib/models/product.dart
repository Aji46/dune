class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.pricePerKg,
    required this.weightKg,
    required this.size,
    required this.color,
    required this.imageUrl,
    required this.description,
    this.isNew = false,
    this.isFeatured = false,
  });

  final String id;
  final String name;
  final String category;
  final double pricePerKg;
  final double weightKg;
  final String size;
  final String color;
  final String imageUrl;
  final String description;
  final bool isNew;
  final bool isFeatured;

  double get totalPrice => pricePerKg * weightKg;
}
