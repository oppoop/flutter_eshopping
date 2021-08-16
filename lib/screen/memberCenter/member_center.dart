import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/utils/app_libs.dart';
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
          flexibleSpace: Container(
              decoration:BoxDecoration(
                  gradient: LinearGradient(
                      colors:[Colors.indigo,Colors.purple],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft
                  )
              )
          ),
        ),
        body: memberCenter()
    );
  }
  Widget memberCenter(){
    return Container(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: Border(bottom: BorderSide(color: Colors.black,width: 3))
                    ),
                    height: MediaQuery.of(context).size.height*0.17,
                    child: Center(
                      child: IconButton(icon: Icon(Icons.camera_enhance,size: 30,),onPressed: (){},),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height*0.09,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black,width: 4)
                    ),
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: AppLibScreen.imageContent(
                        imageOnePath:
                        'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
