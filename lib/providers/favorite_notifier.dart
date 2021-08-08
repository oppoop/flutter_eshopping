import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> favoriteList = [];

class FavoriteNotify with ChangeNotifier{
  Future<void> favoriteAdd(String productID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteList = prefs.getStringList('favorite')!;
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

  Future<void> getFavorite()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteList = prefs.getStringList('favorite')!;
    print(favoriteList);
    notifyListeners();
  }
}