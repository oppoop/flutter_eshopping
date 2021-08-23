import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MemberDetailsNotifier with ChangeNotifier{
  String? _nickName;
  get nickName => _nickName;
  String? _phone;
  get phone => _phone;
  String? _birth;
  get birth => _birth;
  String? _gender;
  get gender => _gender;
  String? _account;
  get account => _account;
  String? _imgUrl;
  get imgUrl => _imgUrl;
  bool? _imgLocal;
  get imgLocal => _imgLocal;
  bool _nameEditor = false;
  get nameEditor => _nameEditor;
  bool _phoneEditor = false;
  get phoneEditor => _phoneEditor;
  bool _birthEditor = false;
  get birthEditor => _birthEditor;
  bool _genderEditor = false;
  get genderEditor => _genderEditor;


  Future<void> accountRegist({required String nickname,required String account,required String password,required String phone,required String head,required bool headType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nickName', nickname);
    prefs.setString('account', account);
    prefs.setString('password', password);
    prefs.setString('phone', phone);
    prefs.setString('head',head);
    prefs.setBool('headType', headType);
    prefs.setString('gender', '');
    prefs.setString('birth', '');
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
    _phone = prefs.getString('phone');
    _gender = prefs.getString('gender');
    _birth = prefs.getString('birth');
    notifyListeners();
  }

  Future<void> nicknameEdit({required nickname}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(_nameEditor);
    _nameEditor = !_nameEditor;
    print(_nameEditor);
    if(!_nameEditor){_nickName = nickname;prefs.setString('nickName', _nickName!);}
    print(prefs.getString('nickName'));
  }
  Future<void> genderEdit({required gender}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genderEditor = !_genderEditor;
    _gender = gender;
    if(_genderEditor){prefs.setString('gender', _gender!);}
  }
  Future<void> birthEdit({required birth}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _birthEditor = !_birthEditor;
    _birth = birth;
    if(_birthEditor){prefs.setString('birth', _birth!);}
  }
  Future<void> phoneEdit({required phone}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _phoneEditor = !_phoneEditor;
    _phone = phone;
    if(_phoneEditor){prefs.setString('phone', _phone!);}
  }

  Future<void> dataReset() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}