import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
class BrowsingRecordsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(S().browsingRecords,style: GoogleFonts.notoSerif()
              .copyWith()),
        ],
      ),
    );
  }
}


class BrowsingRecordState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
