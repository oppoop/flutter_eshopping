import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/member_notifier.dart';
import 'package:flutter_eshopping/utils/app_libs.dart';
import 'package:provider/provider.dart';

import 'member_Field.dart';

class MemberCenter extends StatefulWidget {
  @override
  _MemberCenter createState() => _MemberCenter();
}

class _MemberCenter extends State<MemberCenter> {
  TextEditingController nickNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MemberDetailsNotifier>(context, listen: false).getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S().membercenter,
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft))),
        ),
        body: memberCenter());
  }

  Widget memberCenter() {
    return Consumer<MemberDetailsNotifier>(builder: (
      context,
      member,
      _,
    ) {
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
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.transparent, width: 3))),
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_enhance,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 4)),
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
            memberField(
                context: context,
                textTittle: S().nickName,
                enabled: member.nameEditor,
                controller: nickNameController,
                fieldText: member.nickName,
                iconButton: IconButton(
                    onPressed: () => Provider.of<MemberDetailsNotifier>(context,
                            listen: false)
                        .nicknameEdit(nickname: nickNameController.text),
                    icon: member.nameEditor
                        ? Icon(
                            Icons.check_outlined,
                            color: Colors.blueAccent,
                          )
                        : Icon(
                            Icons.edit,
                            color: Colors.green,
                          ))),
            memberField(
                context: context,
                textTittle: S().gender,
                enabled: member.genderEditor,
                controller: genderController,
                fieldText: member.gender,
                iconButton: IconButton(
                    onPressed: () => Provider.of<MemberDetailsNotifier>(context,
                            listen: false)
                        .genderEdit(gender: genderController.text),
                    icon: member.genderEditor
                        ? Icon(
                            Icons.check_outlined,
                            color: Colors.blueAccent,
                          )
                        : Icon(
                            Icons.edit,
                            color: Colors.green,
                          ))),
            memberField(
                context: context,
                textTittle: S().birth,
                enabled: member.birthEditor,
                controller: birthController,
                fieldText: member.birth,
                iconButton: IconButton(
                    onPressed: () => Provider.of<MemberDetailsNotifier>(context,
                            listen: false)
                        .birthEdit(birth: birthController.text),
                    icon: member.birthEditor
                        ? Icon(
                            Icons.check_outlined,
                            color: Colors.blueAccent,
                          )
                        : Icon(
                            Icons.edit,
                            color: Colors.green,
                          ))),
            memberField(
                context: context,
                textTittle: S().phone,
                enabled: member.phoneEditor,
                controller: phoneController,
                fieldText: member.phone,
                iconButton: IconButton(
                    onPressed: () => Provider.of<MemberDetailsNotifier>(context,
                            listen: false)
                        .phoneEdit(phone: phoneController.text),
                    icon: member.phoneEditor
                        ? Icon(
                            Icons.check_outlined,
                            color: Colors.blueAccent,
                          )
                        : Icon(
                            Icons.edit,
                            color: Colors.green,
                          ))),
          ],
        ),
      );
    });
  }
}
