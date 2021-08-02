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

  bool _loginCheck = false;
  bool get loginCheck => _loginCheck;

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
    var _account = prefs.getString('account');
    var _password = prefs.getString('password');
    if(accountField ==  _account && passwordFied == _password)
    {
      _loginCheck = true;
    }
    notifyListeners();
  }

  void changeHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}