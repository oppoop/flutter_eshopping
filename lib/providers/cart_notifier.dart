import 'package:flutter_eshopping/data_model/order_item.dart';
import 'package:flutter/cupertino.dart';
class CartNotifier with ChangeNotifier {
  List<OrderItem> itemsInCart = [];
  int? _productNum;
  int? get productNum => _productNum;
  double? _productCost;
  double? get productCost => _productCost;


  double get totalCost {
    double total = 0;
    itemsInCart.forEach((item) {
      total += item.productCost!;
    });
    return total;
  }

  double productTotalCost({required price,required number}){
    _productCost = price * number;
    notifyListeners();
    return _productCost!;
}

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    print(orderItem.product.name);
    var t = itemsInCart.remove(orderItem);
    print(t);
    notifyListeners();
  }

  void changeSize({required }){

  }
  void changeNum(){

  }
}