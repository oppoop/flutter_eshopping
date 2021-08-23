import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget memberField({required context,required String textTittle,required bool enabled,required TextEditingController controller,required String fieldText,required IconButton iconButton}){
  return Container(
    padding: EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textTittle),
        Container(
          padding: EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width*0.6,
          child: TextFormField(
            enabled:enabled,
            style: GoogleFonts.notoSerif().copyWith(color: Colors.black),
            controller:controller..text = fieldText,
            decoration: InputDecoration(
              contentPadding:EdgeInsets.only(left: 20),
              hintStyle: GoogleFonts.notoSerif().copyWith(color: Colors.black),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ),
        iconButton,
      ],
    ),
  );
}

