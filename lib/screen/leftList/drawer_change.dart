import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/login_notifier.dart';
import 'drawer_status.dart';
import 'drawer_header.dart';
bool drawerBottom = false;

class DrawerChange extends StatefulWidget {
  @override
  _DrawerChange createState() => _DrawerChange();
}

class _DrawerChange extends State<DrawerChange> {
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
                    });
                  },
                ),
              )
            ],
          ),
          Container(child: drawerBottom?DrawerStatus().drawerClose(context):DrawerStatus().drawerOpen(context),),
        ],
      ),
    );
  }



}
