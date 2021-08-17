import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
InputDecoration memberInputDecoration(IconData? icons,String hintText,String? errorMsg,IconData? hideIcons) {
  return InputDecoration(
    contentPadding:EdgeInsets.only(left: 20),
    errorText: errorMsg,
    hintText: hintText,
    hintStyle: GoogleFonts.notoSerif().copyWith(color: Colors.white),
    enabledBorder:UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
  );
}

InputDecoration sizeInputDecoration() {
  return InputDecoration(
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