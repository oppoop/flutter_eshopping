import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
class RecommendBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(S().newProduct,style: GoogleFonts.notoSerif()
              .copyWith()),
        ],
      ),
    );
  }
}

class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
