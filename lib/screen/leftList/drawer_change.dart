import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/login_notifier.dart';
import 'drawer_header.dart';
import 'package:flutter_eshopping/screen/memberCenter/member_center.dart';
import 'package:flutter_eshopping/providers/member_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_eshopping/screen/leftListScreen/custom_service.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/custom_service_notifier.dart';
import 'package:flutter_eshopping/providers/change_language_notifier.dart';
class DrawerChange extends StatefulWidget {
  @override
  _DrawerChange createState() => _DrawerChange();
}

class _DrawerChange extends State<DrawerChange> {
  final double _listSize = 20;
  var _selectLocal = 'zh_TW';
  List<DropdownMenuItem> _localList() {
    List<DropdownMenuItem> items = [];
    DropdownMenuItem item1 = new DropdownMenuItem(
        value:'zh_TW' ,
        child: SizedBox(
          width: 30,
          height: 30,
          child: ClipOval(
            child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/255px-Flag_of_the_Republic_of_China.svg.png',fit: BoxFit.cover,),
          ),
        ),);
    DropdownMenuItem item2 = new DropdownMenuItem(
        value: 'en',
        child: SizedBox(
          width: 30,
          height: 30,
          child: ClipOval(
            child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/300px-Flag_of_the_United_States.svg.png',fit: BoxFit.cover,),
          ),
        ),);
    items.add(item1);
    items.add(item2);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: [
              DrawerHeader(
                child: Consumer<LoginNotifier>(builder: (
                    context,
                    login,
                    _,
                    ) {
                  print(login.loginStatus);
                  return login.loginStatus ? member() : visitors(context);
                }),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/image/drawer_head_weed_2.png'),fit:BoxFit.cover)
                ),
              ),
              DropdownButtonHideUnderline(
                child: new DropdownButton(
                  value: _selectLocal,
                  items: _localList(),
                  onChanged: (dynamic T){
                    setState(() {
                      _selectLocal=T;
                      if (T == "zh_TW") Provider.of<LanguageProvider>(context, listen: false).changeLanguage(locale: Locale('zh','TW'));
                      if (T == "en") Provider.of<LanguageProvider>(context, listen: false).changeLanguage(locale: Locale('en'));
                    });
                  },
                ),
              )
            ],
          ),
      Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(
                S.of(context).membercenter,
                style: GoogleFonts.notoSerif().copyWith(fontSize: _listSize),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider<MemberDetailsNotifier>(
                      create: (context) => MemberDetailsNotifier(),
                      child: MemberCenter(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(
                '列表',
                style: GoogleFonts.notoSerif().copyWith(fontSize: _listSize),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_ind_sharp),
              title: Text(
                S.of(context).customservice,
                style: GoogleFonts.notoSerif().copyWith(fontSize: _listSize),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider<CustomServiceNotify>(
                      create: (context) => CustomServiceNotify(),
                      child: CustomerService(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                '登出',
                style: GoogleFonts.notoSerif().copyWith(fontSize: _listSize),
              ),
              onTap: () {
                setState(() {
                  Provider.of<LoginNotifier>(context,listen: false).loginOutNotifier();
                });
              },
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }



}
