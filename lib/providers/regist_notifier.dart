import 'package:flutter/cupertino.dart';

class RegistNotifier with ChangeNotifier {

  String? _accountErrorMsg;
  String? get accountErrorMsg => _accountErrorMsg;

  String? _passwordErrorMsg;
  String? get passwordErrorMsg => _passwordErrorMsg;

  String? _confirmErrorMsg;
  String? get confirmErrorMsg => _confirmErrorMsg;

  String? _phoneErrorMsg;
  String? get phoneErrorMsg => _phoneErrorMsg;

  String _headImgUrl = 'https://cdn0.popo.tw/uc/default_icons/userpic_L_200x200.jpg';
  String get headImgUrl => _headImgUrl;

  bool _accountValid = false;
  bool get accountValid => _accountValid;

  bool _passwordValid = false;
  bool get passwordValid => _passwordValid;

  bool _confirmValid = false;
  bool get confirmValid => _confirmValid;

  bool _phoneValid = false;
  bool get phoneValid => _phoneValid;

  bool _finalValid = false;
  bool get finalValid => _finalValid;

  bool _imgLocal=false;
  bool get imgLocal => _imgLocal;

  bool hidePassword = true;

  void accountValidating({
    required String fieldValue,
  }) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(fieldValue)) {
      _accountValid = true;
      _accountErrorMsg = null;
    } else {
      _accountValid = false;
      _accountErrorMsg = "信箱格式不正確";
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

  void confirmValidating({
    required String passwordValue,required String confirmValue
  }) {
    if (passwordValue == confirmValue) {
      _confirmValid = true;
      _confirmErrorMsg = null;
    } else {
      _confirmValid = false;
      _confirmErrorMsg = "密碼輸入不正確";
    }
    notifyListeners();
  }
  void phoneValidating({
    required String fieldValue
  }) {
    if (RegExp( r'^09[0-9]{8}$').hasMatch(fieldValue)) {
      _phoneValid = true;
      _phoneErrorMsg = null;
    } else {
      _phoneValid = false;
      _phoneErrorMsg = "電話格式不正確";
    }
    notifyListeners();
  }

  void finalValidating(){
    if (_accountValid && _passwordValid && _confirmValid && _phoneValid){
      _finalValid = true;
    }else
    {
      _finalValid = false;
    }
    notifyListeners();
  }

  void changeHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void headImgChange({required String headImgUrl,required bool imgLocal}){
    _headImgUrl = headImgUrl;
    _imgLocal = imgLocal;
    print(_headImgUrl);
    print(_imgLocal);
    notifyListeners();
  }
}
