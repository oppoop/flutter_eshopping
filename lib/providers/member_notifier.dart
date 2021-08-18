import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MemberDetailsNotifier with ChangeNotifier{
  String? _nickName;
  get nickName => _nickName;
  String? _account;
  get account => _account;
  String? _imgUrl;
  get imgUrl => _imgUrl;
  bool? _imgLocal;
  get imgLocal => _imgLocal;


  Future<void> accountRegist({required String nickname,required String account,required String password,required String phone,required String head,required bool headType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nickName', nickname);
    prefs.setString('account', account);
    prefs.setString('password', password);
    prefs.setString('phone', phone);
    prefs.setString('head',head);
    prefs.setBool('headType', headType);
    print(nickname);
    print(account);
    print(password);
    print(phone);
    print(head);
    print(headType);
    notifyListeners();
  }

  Future<void> getDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nickName = prefs.getString('nickName');
    print(_nickName);
    _account = prefs.getString('account');
    print(_account);
    _imgUrl = prefs.getString('head');
    print(_imgUrl);
    _imgLocal = prefs.getBool('headType');
    print(_imgLocal);
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