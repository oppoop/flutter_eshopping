import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/change_language_notifier.dart';
import 'package:flutter_eshopping/providers/custom_service_notifier.dart';
import 'package:flutter_eshopping/providers/login_notifier.dart';
import 'package:flutter_eshopping/screen/leftListScreen/custom_service.dart';
import 'package:flutter_eshopping/screen/memberCenter/login_screen.dart';
import 'package:flutter_eshopping/screen/memberCenter/member_center.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_header.dart';

class DrawerChange extends StatefulWidget {
  @override
  _DrawerChange createState() => _DrawerChange();
}

class _DrawerChange extends State<DrawerChange> {
  final double _listSize = 20;
  List<DropdownMenuItem> _localList() {
    List<DropdownMenuItem> items = [];
    DropdownMenuItem item1 = new DropdownMenuItem(
      value: Locale('zh', 'TW'),
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: ClipOval(
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/255px-Flag_of_the_Republic_of_China.svg.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
    DropdownMenuItem item2 = new DropdownMenuItem(
      value: Locale('en'),
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: ClipOval(
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/300px-Flag_of_the_United_States.svg.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
    items.add(item1);
    items.add(item2);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    var _selectLocal = Locale(
      context.watch<LanguageProvider>().languageCode,
      context.watch<LanguageProvider>().countryCode,
    );
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/drawer_background.jpg'),
              fit: BoxFit.cover)),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Consumer<LoginNotifier>(builder: (
            context,
            login,
            _,
          ) {
            return Column(
              children: <Widget>[
                Center(
                  child: DrawerHeader(
                    child: login.loginStatus ? member() : visitors(context),
                  ),
                ),
                Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text(
                          S.of(context).membercenter,
                          style: GoogleFonts.notoSerif()
                              .copyWith(fontSize: _listSize),
                        ),
                        onTap: () {
                          login.loginStatus
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MemberCenter()),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              S().loginFirst,
                                              style: GoogleFonts.notoSerif(),
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.blueAccent,
                                                    onPrimary: Colors.white,
                                                    shadowColor:
                                                        Colors.grey.shade700,
                                                    elevation: 5,
                                                    shape: const BeveledRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)))),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Login()),
                                                  );
                                                },
                                                child: Text(
                                                  S().login,
                                                  style:
                                                      GoogleFonts.notoSerif(),
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.videogame_asset),
                        title: Text(
                          S().miniGame,
                          style: GoogleFonts.notoSerif()
                              .copyWith(fontSize: _listSize),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.assignment_ind_sharp),
                        title: Text(
                          S.of(context).customservice,
                          style: GoogleFonts.notoSerif()
                              .copyWith(fontSize: _listSize),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChangeNotifierProvider<CustomServiceNotify>(
                                create: (context) =>
                                    CustomServiceNotify()..imageLoad(),
                                child: CustomerCenter(),
                              ),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(
                          S().settings,
                          style: GoogleFonts.notoSerif()
                              .copyWith(fontSize: _listSize),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                          leading: Icon(Icons.star),
                          title: Text(
                            S().logOut,
                            style: GoogleFonts.notoSerif()
                                .copyWith(fontSize: _listSize),
                          ),
                          onTap: () =>
                              Provider.of<LoginNotifier>(context, listen: false)
                                  .loginOutNotifier()),
                    ],
                  ),
                ),
              ],
            );
          }),
          DropdownButtonHideUnderline(
            child: new DropdownButton(
              dropdownColor: Colors.transparent,
              value: _selectLocal,
              items: _localList(),
              onChanged: (dynamic T) {
                _selectLocal = T;
                if (T == Locale('zh', 'TW'))
                  Provider.of<LanguageProvider>(context, listen: false)
                      .changeLanguage(locale: Locale('zh', 'TW'));
                if (T == Locale('en'))
                  Provider.of<LanguageProvider>(context, listen: false)
                      .changeLanguage(locale: Locale('en'));
              },
            ),
          )
        ],
      ),
    );
  }
}
