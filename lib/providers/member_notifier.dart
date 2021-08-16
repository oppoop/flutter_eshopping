import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MemberDetailsNotifier with ChangeNotifier{


  Future<void> accountRegist({required String nickname,required String account,required String password,required String phone}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nickName', nickname);
    prefs.setString('account', account);
    prefs.setString('password', password);
    prefs.setString('phone', phone);
    print(nickname);
    print(account);
    print(password);
    print(phone);
    notifyListeners();
  }

  Future<void> getDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nickName = prefs.getString('nickName');
    print(nickName);
    var phone = prefs.getString('phone');
    print(phone);
    notifyListeners();
  }

  Future<void> saveDetails({required String nickname,required String phone,required String birth}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nickName', nickname);
    prefs.setString('phone', phone);
    prefs.setString('birth', birth);
    print(nickname);
    print(phone);
    print(birth);
    notifyListeners();
  }
}