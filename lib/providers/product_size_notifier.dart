import 'package:flutter/cupertino.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
class ProductSizeNotifier with ChangeNotifier{
  bool _sizeStatus = false;
  get sizeStatus => _sizeStatus;

  void  sizeSelect({required String sizeValue}){
    if(sizeValue != ""){
      _sizeStatus = true;
    }else{
      _sizeStatus = false;
    }
    notifyListeners();
  }
}