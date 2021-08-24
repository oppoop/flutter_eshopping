import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> browsingRecordList = [];
class BrowsingRecordNotify with ChangeNotifier{

  Future<void> browsingAdd(String productID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(browsingRecordList.contains(productID)){
      browsingRecordList.remove(productID);
      browsingRecordList.add(productID);
    }
    else{browsingRecordList.add(productID);}
    print(browsingRecordList);
    bool browsingRecordSet = await prefs.setStringList('browsingRecord', browsingRecordList);
    print(browsingRecordSet);
    notifyListeners();
  }


  Future<void> getBrowsing()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    browsingRecordList = prefs.getStringList('browsingRecord')!;
    print(browsingRecordList);
    notifyListeners();
  }

}
