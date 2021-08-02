import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/login_status_notifier.dart';
import 'drawer_status.dart';
import 'drawer_header.dart';
bool drawerBottom = false;

class DrawerChange extends StatefulWidget {
  @override
  _DrawerChange createState() => _DrawerChange();
}

class _DrawerChange extends State<DrawerChange> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginStatusNotifier>(
          create: (context) => LoginStatusNotifier(),
        ),
      ],
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Consumer<LoginStatusNotifier>(builder: (
                  context,
                  status,
                  _,
                  ) {
                return status.loginStatus ? member() : visitors(context);
              }),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            Container(child: drawerBottom?DrawerStatus().drawerClose(context):DrawerStatus().drawerOpen(context),),
          ],
        ),
      ),
    );
  }



}
