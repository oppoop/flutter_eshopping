import 'product.dart';

class OrderItem {
  Product product;

  /// Selected size of product; This can be null
  String? selectedSize;

  /// Selected color of product; This can be null
  String? selectedColor;

  int? selectedNum;

  double? totalCost;

  OrderItem({required this.product, this.selectedSize, this.selectedColor,this.selectedNum,this.totalCost});
}