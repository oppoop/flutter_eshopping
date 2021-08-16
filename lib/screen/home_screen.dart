import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/temp_data.dart';
import 'package:flutter_eshopping/screen/category/category_tile.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(S.of(context).home,style: GoogleFonts.notoSerif()
              .copyWith()),
        ],
      ),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  EdgeInsets listViewPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: listViewPadding,
      children: [
        CategoryTile(
          imageUrl: manLookRightImageUrl,
          category: menCategory,
          imageAlignment: Alignment.topCenter,
        ),
        SizedBox(height: 16),
        CategoryTile(
          imageUrl: womanLookLeftImageUrl,
          category: womenCategory,
          imageAlignment: Alignment.topCenter,
        ),
        SizedBox(height: 16),
        CategoryTile(
          imageUrl: dogImageUrl, // TODO: Replace with your own image
          category: petCategory,
        ),
      ],
    );
  }
}


