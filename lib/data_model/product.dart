import 'category.dart';

class Product {
  final String? name;
  final List<String>? imageUrls;
  final String? productID;
  final double? cost;
  final String? description;
  final List<String>? sizes;
  final List<String>? details;
  final List<String>? modelSize;
  /// Which overall category this product belongs in. e.g - Men, Women, Pets, etc.
  final Category? category;

  /// Represents type of product such as shirt, jeans, pet treats, etc.
  final String? productType;

  Product(
      {this.productID,
        this.name,
        this.imageUrls,
        this.cost,
        this.description,
        this.sizes,
        this.details,
        this.modelSize,
        this.category,
        this.productType});
}
