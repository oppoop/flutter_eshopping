import 'package:flutter/cupertino.dart';

class CustomServiceNotify extends ChangeNotifier{
  String? _questionsErrorMsg = '';
  String? get questionsErrorMsg => _questionsErrorMsg;

  bool? _questionsValid;
  bool? get questionsValid => _questionsValid;

  void questionsValiding({required String fiedValue}){
    if(fiedValue.length > 10){
      _questionsValid = true;
      _questionsErrorMsg = '';
    }else{
      _questionsValid = false;
      _questionsErrorMsg = '請最少輸入10個字';
    }
    notifyListeners();
  }
}