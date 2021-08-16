import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MemberCenter extends StatefulWidget {
  @override
  _MemberCenter createState() => _MemberCenter();
}

class _MemberCenter extends State<MemberCenter> {
  bool nameEditor = false;
  bool phoneEditor = false;
  bool birthEditor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S().membercenter,
          ),
        ),
        body: memberCenter()
    );
  }
  Widget memberCenter(){
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            height: MediaQuery.of(context).size.height*0.15,
            child: Center(
              child: IconButton(icon: Icon(Icons.camera_enhance,size: 30,),onPressed: (){},),
            ),
          ),
          ListTile(
          ),
        ],
      ),
    );
  }
}
