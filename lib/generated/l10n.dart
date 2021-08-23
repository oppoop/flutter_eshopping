// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TEST`
  String get test {
    return Intl.message(
      'TEST',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Regist`
  String get regist {
    return Intl.message(
      'Regist',
      name: 'regist',
      desc: '',
      args: [],
    );
  }

  /// `Member Center`
  String get membercenter {
    return Intl.message(
      'Member Center',
      name: 'membercenter',
      desc: '',
      args: [],
    );
  }

  /// `Custom Service`
  String get customservice {
    return Intl.message(
      'Custom Service',
      name: 'customservice',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get languagechange {
    return Intl.message(
      'Change Language',
      name: 'languagechange',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the email`
  String get enteremail {
    return Intl.message(
      'Please enter the email',
      name: 'enteremail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the password`
  String get enterpassword {
    return Intl.message(
      'Please enter the password',
      name: 'enterpassword',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter the password`
  String get reenterpasswoed {
    return Intl.message(
      'Please re-enter the password',
      name: 'reenterpasswoed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone numbre`
  String get enterphone {
    return Intl.message(
      'Please enter the phone numbre',
      name: 'enterphone',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get submit {
    return Intl.message(
      'submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `NickName`
  String get nickName {
    return Intl.message(
      'NickName',
      name: 'nickName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Birth`
  String get birth {
    return Intl.message(
      'Birth',
      name: 'birth',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mail {
    return Intl.message(
      'Mail',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get emptyCart {
    return Intl.message(
      'Your cart is empty',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `{number} items`
  String cartItems(Object number) {
    return Intl.message(
      '$number items',
      name: 'cartItems',
      desc: '',
      args: [number],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkOut {
    return Intl.message(
      'Check Out',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `NEW Product`
  String get newProduct {
    return Intl.message(
      'NEW Product',
      name: 'newProduct',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite`
  String get myFavorite {
    return Intl.message(
      'My Favorite',
      name: 'myFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Men`
  String get men {
    return Intl.message(
      'Men',
      name: 'men',
      desc: '',
      args: [],
    );
  }

  /// `Women`
  String get women {
    return Intl.message(
      'Women',
      name: 'women',
      desc: '',
      args: [],
    );
  }

  /// `Pet`
  String get pet {
    return Intl.message(
      'Pet',
      name: 'pet',
      desc: '',
      args: [],
    );
  }

  /// `Choose your size`
  String get chooseSize {
    return Intl.message(
      'Choose your size',
      name: 'chooseSize',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Model Sizes`
  String get modelSize {
    return Intl.message(
      'Model Sizes',
      name: 'modelSize',
      desc: '',
      args: [],
    );
  }

  /// `Edit Number`
  String get numEdit {
    return Intl.message(
      'Edit Number',
      name: 'numEdit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Size`
  String get sizeEdit {
    return Intl.message(
      'Edit Size',
      name: 'sizeEdit',
      desc: '',
      args: [],
    );
  }

  /// `Tap to Upload`
  String get tapUpload {
    return Intl.message(
      'Tap to Upload',
      name: 'tapUpload',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Nickname`
  String get inputNickName {
    return Intl.message(
      'Please enter Nickname',
      name: 'inputNickName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Mail`
  String get inputMail {
    return Intl.message(
      'Please enter Mail',
      name: 'inputMail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Password`
  String get inputPassword {
    return Intl.message(
      'Please enter Password',
      name: 'inputPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Password again`
  String get inputPasswordAgain {
    return Intl.message(
      'Please enter Password again',
      name: 'inputPasswordAgain',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Phone`
  String get inputPhone {
    return Intl.message(
      'Please enter Phone',
      name: 'inputPhone',
      desc: '',
      args: [],
    );
  }

  /// `Sign up Successful`
  String get registSuccess {
    return Intl.message(
      'Sign up Successful',
      name: 'registSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Input data Error`
  String get inputDataError {
    return Intl.message(
      'Input data Error',
      name: 'inputDataError',
      desc: '',
      args: [],
    );
  }

  /// `Account Or Password Error`
  String get accountPassError {
    return Intl.message(
      'Account Or Password Error',
      name: 'accountPassError',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Mini Game`
  String get miniGame {
    return Intl.message(
      'Mini Game',
      name: 'miniGame',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Album`
  String get album {
    return Intl.message(
      'Album',
      name: 'album',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Man Avatar`
  String get manHead {
    return Intl.message(
      'Man Avatar',
      name: 'manHead',
      desc: '',
      args: [],
    );
  }

  /// `Woman Avatar`
  String get womanHead {
    return Intl.message(
      'Woman Avatar',
      name: 'womanHead',
      desc: '',
      args: [],
    );
  }

  /// `Please select your size`
  String get noneSelectSize {
    return Intl.message(
      'Please select your size',
      name: 'noneSelectSize',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `You haven't choose any product for Favorite`
  String get emptyFavorite {
    return Intl.message(
      'You haven\'t choose any product for Favorite',
      name: 'emptyFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Log in Successful`
  String get loginSuccess {
    return Intl.message(
      'Log in Successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Log out Success`
  String get logOutSuccess {
    return Intl.message(
      'Log out Success',
      name: 'logOutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Birth Day`
  String get birthDay {
    return Intl.message(
      'Birth Day',
      name: 'birthDay',
      desc: '',
      args: [],
    );
  }

  /// `Account Authentication`
  String get accountAuthentication {
    return Intl.message(
      'Account Authentication',
      name: 'accountAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Please login first`
  String get loginFirst {
    return Intl.message(
      'Please login first',
      name: 'loginFirst',
      desc: '',
      args: [],
    );
  }

  /// `Browsing records`
  String get browsingRecords {
    return Intl.message(
      'Browsing records',
      name: 'browsingRecords',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
