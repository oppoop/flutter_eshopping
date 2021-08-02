import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons,String hinttext,String? errorMsg,bool hide) {
  return InputDecoration(
    errorText: errorMsg,
    hintText: hinttext,
    suffixIcon: hide?Icon(Icons.remove_red_eye_outlined):Icon(Icons.remove_red_eye),
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
          color: Colors.green,
          width: 1.5
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}