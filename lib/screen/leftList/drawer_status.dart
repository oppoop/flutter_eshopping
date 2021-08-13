import 'package:flutter/material.dart';
import 'package:flutter_eshopping/providers/custom_service_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/screen/leftListScreen/custom_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/screen/memberCenter/member_center.dart';
import 'package:flutter_eshopping/providers/member_notifier.dart';
class DrawerStatus {
  final double listSize = 20;
  Widget drawerOpen(context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              S.of(context).membercenter,
              style: TextStyle(fontSize: listSize),
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
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_ind_sharp),
            title: Text(
              S.of(context).customservice,
              style: TextStyle(fontSize: listSize),
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
              S.of(context).languagechange,
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  Widget drawerClose(context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              '我已經有帳號了',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              '立即加入 > < ',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

}
