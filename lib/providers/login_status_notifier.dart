import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginStatusNotifier with ChangeNotifier{

  bool? _loginStatus = false;
  bool get loginStatus => _loginStatus!;

  Future<void> getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var account = prefs.getString('account');
    print(account);
    if(account != null){_loginStatus = true;}
    else{_loginStatus=false;}
    print('登入狀態 + $loginStatus');
    notifyListeners();
  }

  Future<void> saveAccount({required String account,required String password,}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _loginStatus = await prefs.setString('account', account);
    prefs.setString('password', password);
    print(account);
    print(password);
    print(_loginStatus);
    notifyListeners();
  }

  Future<void> removeAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('account');
    prefs.remove('password');
    _loginStatus = false;
    print('log out');
    notifyListeners();
  }
}