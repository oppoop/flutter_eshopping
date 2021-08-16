import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/login_notifier.dart';
import 'package:flutter_eshopping/providers/regist_notifier.dart';
import 'package:flutter_eshopping/utils/pop_widget.dart';
import 'package:flutter_eshopping/utils/app_libs.dart';
import 'drawer_change.dart';
import 'package:flutter_eshopping/screen/memberCenter/login_screen.dart';
import 'package:flutter_eshopping/screen/memberCenter/regist_screen.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
Widget member() {
  return Consumer<LoginNotifier>(builder: (
      context,
      login,
      _,
      ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                await popWidget.imageViewerDialog(
                  context: context,
                  path:
                  'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: AppLibScreen.imageContent(
                    imageOnePath:
                    'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                  ),
                ),
              ),
            ),
            /*ClipOval(
                child: Image.network(
                  'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),*/
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NMSL',
    style: GoogleFonts.notoSerif()
        .copyWith(fontSize: 17,color: Colors.white)
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'yan@gmail.com',
          style: GoogleFonts.notoSerif()
        .copyWith(fontSize: 17,color: Colors.white)
              ),
          ],
        ),
        Row(
          children: [
            Text(
              '@fuckUbitch',
                style: GoogleFonts.notoSerif()
                    .copyWith(fontSize: 12,color: Colors.grey)
            )
          ],
        )
      ],
    );
  });
}

Widget visitors(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Image.network(
              'https://cdn0.popo.tw/uc/default_icons/userpic_L_200x200.jpg',
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 25,
        width: 70,
        child: FlatButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login()
            ),
          ),
          child: Text(S().login,style: GoogleFonts.notoSerif()
      .copyWith()),
          color: Colors.blue,
          textColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
      SizedBox(
        height: 25,
        width: 70,
        child: FlatButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider<RegistNotifier>(
                create: (context) => RegistNotifier(),
                child: regist(),
              ),
            ),
          ),
          child: Text(S().signUp,style: GoogleFonts.notoSerif()
              .copyWith(),),
          color: Colors.blue,
          textColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ],
  );
}