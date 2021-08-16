import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier with ChangeNotifier {

  String? _accountErrorMsg;
  String? get accountErrorMsg => _accountErrorMsg;

  String? _passwordErrorMsg;
  String? get passwordErrorMsg => _passwordErrorMsg;

  bool _accountValid = false;
  bool get accountValid => _accountValid;

  bool _passwordValid = false;
  bool get passwordValid => _passwordValid;


  bool? _loginStatus;
  bool get loginStatus => _loginStatus!;

  bool hidePassword = true;

  void accountValidating({
    required String fieldValue,
  }) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(fieldValue)) {
      _accountValid = true;
      _accountErrorMsg = null;
    } else {
      _accountValid = false;
      _accountErrorMsg = "帳號格式錯誤";
    }
    notifyListeners();
  }


  void passwordValidating({
    required String fieldValue,
  }) {
    if (fieldValue.length > 9) {
      _passwordValid = true;
      _passwordErrorMsg = null;
    } else {
      _passwordValid = false;
      _passwordErrorMsg = "少於10個字元";
    }
    notifyListeners();
  }

  Future<void> loginSubmit({required String accountField,required String passwordFied})
  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var account = prefs.getString('account');
    var password = prefs.getString('password');
    if(accountField ==  account && passwordFied == password)
    {
      _loginStatus = true;
      prefs.setBool('loginStatus', _loginStatus!);
    }
    print(_loginStatus);
    notifyListeners();
  }

  Future<void> getLoginStatus()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if( prefs.getBool('loginStatus') == null){_loginStatus=false;}
    else{_loginStatus=true;}
    print('登入狀態:$_loginStatus');
    notifyListeners();
  }


  void changeHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}