import 'package:flutter/cupertino.dart';

class ProductNumberNotifier with ChangeNotifier{
  int _productNumber=1;
  get productNumber => _productNumber;

  void setNumber({required String productNumber}){
    print(productNumber);
    _productNumber = int.parse(productNumber);
    print("數量:${_productNumber}");
    notifyListeners();
  }

  void plusNumber({required String productNumber}){
    _productNumber = int.parse(productNumber)+1;
    print(_productNumber);
    notifyListeners();
  }

  void minusNumber({required String productNumber}){
    if(_productNumber > 1){
      _productNumber = int.parse(productNumber)-1;
    }
    print(_productNumber);
    notifyListeners();
  }
}