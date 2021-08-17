import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
ListTile _listTile(IconData icon, String tittle,) {
  return ListTile(
    title: Row(mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon, color: Colors.black,size: 17,),
      SizedBox(width: 5,),
      Text(tittle, style: GoogleFonts.notoSerif().copyWith(color: Colors.black,fontSize: 17),),
    ],),
  );
}
List<Widget> productSupport = <Widget>[
  _listTile(Icons.add_moderator, '百分百正品'),
  _listTile(Icons.ac_unit_outlined, '免費退貨換貨'),
  _listTile(Icons.directions_car, '提供貨到付款'),
  _listTile(Icons.all_inclusive_outlined, '可使用優惠券'),
  _listTile(Icons.airplanemode_active, '包裹從國外發貨'),
];


