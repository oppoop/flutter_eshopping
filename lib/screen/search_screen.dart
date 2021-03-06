import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(),
      height: 40,
      width: 220,
      child: Row(
        children: [
          Expanded(
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: S().search,
                    hintStyle:GoogleFonts.notoSerif()
                    .copyWith(),
                    prefixIcon: Icon(Icons.search, color: Colors.black)),
              )),
        ],
      ),
    );
  }
}

class Search extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<Search> {


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
