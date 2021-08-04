import 'package:flutter/material.dart';

ListTile _listTile(IconData icon, String tittle,) {
  return ListTile(
    leading: Icon(icon, color: Colors.grey[200],),
    title: Text(tittle, style: TextStyle(fontSize: 10, color: Colors.grey[200]),),
  );
}
List<Widget> productSupport = <Widget>[
  _listTile(Icons.add_moderator, '百分百正品'),
  _listTile(Icons.ac_unit_outlined, '免費退貨換貨'),
  _listTile(Icons.directions_car, '提供貨到付款'),
  _listTile(Icons.all_inclusive_outlined, '可使用優惠券'),
  _listTile(Icons.airplanemode_active, '包裹從國外發貨'),
];


