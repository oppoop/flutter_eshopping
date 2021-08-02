import 'package:flutter/material.dart';

BoxDecoration blueBoxDecoration(){
  return BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color(0xFF0D47A1),
        Color(0xFF1976D2),
        Color(0xFF42A5F5),
      ],
    ),
  );
}