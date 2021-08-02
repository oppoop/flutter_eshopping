import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageProvider with ChangeNotifier {
  String languageCode = "zh";
  String? countryCode = "TW";

  Future<void> changeLanguage ({required Locale locale}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("languageCode", locale.languageCode,);
    prefs.setString("countryCode", locale.countryCode??'',);
    languageCode = locale.languageCode;
    countryCode = locale.countryCode;
    notifyListeners();
  }

  Future<void> setLanguageToDefault() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("languageCode");
    prefs.remove("countryCode");
    countryCode = "TW";
    languageCode = "zh";
    notifyListeners();
  }

  Future<void> getLocale () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("languageCode") != null) {
      languageCode = prefs.getString("languageCode")!;
    }
    if (prefs.getString("countryCode") != null) {
      countryCode = prefs.getString("countryCode") == '' ? null : prefs.getString("countryCode") ;
    }
  }
}