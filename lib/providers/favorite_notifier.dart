import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FavoriteNotify with ChangeNotifier{
  List<String> favoriteList = [];

  Future<void> favoriteAdd(String productID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteList.add(productID);
    print(favoriteList);
    bool favoriteSet = await prefs.setStringList('favorite', favoriteList);
    print(favoriteSet);
    notifyListeners();
  }

  Future<void> favoriteRemove(String productID)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteList.remove(productID);
    print(favoriteList);
    bool favoriteSet = await prefs.setStringList('favorite', favoriteList);
    print(favoriteSet);
    notifyListeners();
  }

  Future<void> getFavorite(String productID)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteList = prefs.getStringList('favorite')!;
    print(favoriteList);
    notifyListeners();
  }
}