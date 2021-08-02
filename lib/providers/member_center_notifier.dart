import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MemberDetails with ChangeNotifier{

  bool _memberNickname = true;
  bool get memberNickname => _memberNickname;

  bool _memberPhone = true;
  bool get memberPhone => _memberPhone;

  bool _memberBirth = true;
  bool get memberBirth => _memberBirth;



  Future<void> getDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nickName = prefs.getString('nickName');
    print(nickName);
    var phone = prefs.getString('phone');
    print(phone);
    var birth = prefs.getString('birth');
    print(birth);
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