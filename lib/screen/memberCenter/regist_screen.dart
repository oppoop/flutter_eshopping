import 'dart:io';
import 'package:flutter_eshopping/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/model/textfied_look.dart';
import 'package:flutter_eshopping/providers/regist_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/member_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_eshopping/utils/getImage.dart';
import 'package:flutter_eshopping/generated/l10n.dart';


class regist extends StatefulWidget {
  @override
  _regist createState() => _regist();
}

class _regist extends State<regist> {
  TextEditingController nickNameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode accountFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _fieldVer =15;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MemberDetailsNotifier>(
          create: (context) => MemberDetailsNotifier(),
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/background_deppsky.jpg'),
                          fit: BoxFit.cover)),
                ),
                IconButton(onPressed:(){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,))
              ],
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /*ElevatedButton(
                            onPressed: () => Provider.of<RegistNotifier>(
                                    context,
                                    listen: false)
                                .headImgChange(
                              headImgUrl:
                                  'assets/member_head/man.jpg',
                              imgLocal:false,
                            ),
                            child: Text('man'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent[700],
                                onPrimary: Colors.white,
                                shadowColor: Colors.grey.shade700,
                                elevation: 5,
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                          ),*/
                          Consumer<RegistNotifier>(
                            builder: (
                              context,
                              regist,
                              _,
                            ) {
                              return GestureDetector(
                                onTap: () =>
                                    GetImage().getActionSheet(context: context),
                                child: ClipOval(
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      regist.imgLocal
                                          ? Container(
                                              child: Image.file(
                                                File(
                                                  regist.headImgUrl,
                                                ),
                                                fit: BoxFit.cover,
                                                width: 130,
                                                height: 130,
                                              ),
                                            )
                                          : Container(
                                              child: Image.asset(
                                                regist.headImgUrl,
                                                fit: BoxFit.cover,
                                                width: 130,
                                                height: 130,
                                              ),
                                            ),
                                      Container(
                                        width: 130,
                                        height: 20,
                                        child: Text(
                                          S().tapUpload,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.notoSerif()
                                              .copyWith(fontSize: 12,color: Colors.white),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0x80000000)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          /*ElevatedButton(
                            onPressed: () {
                              Provider.of<RegistNotifier>(context,
                                      listen: false)
                                  .headImgChange(
                                headImgUrl:
                                    'assets/member_head/woman.jpg',
                                imgLocal:false,
                              );
                            },
                            child: Text('woman'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.pinkAccent,
                                onPrimary: Colors.white,
                                shadowColor: Colors.grey.shade700,
                                elevation: 5,
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                          ),*/
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,color: Colors.white,size: 30,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            padding: EdgeInsets.symmetric(vertical: _fieldVer),
                            child: Consumer<RegistNotifier>(
                              builder: (
                                  context,
                                  regist,
                                  _,
                                  ) {
                                return TextFormField(
                                  style: GoogleFonts.notoSerif().copyWith(color: Colors.white),
                                  keyboardType: TextInputType.text,
                                  controller: nickNameController,
                                  decoration: memberInputDecoration(
                                      Icons.person, S().inputNickName, regist.nickNameErrorMsg, null),
                                  onChanged: (text){
                                    Provider.of<RegistNotifier>(context,listen: false).nickNameValidating(fieldValue: nickNameController.text);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mail_outline_outlined,color: Colors.white,size: 30,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            padding: EdgeInsets.symmetric(vertical: _fieldVer),
                            child: Consumer<RegistNotifier>(
                              builder: (
                                  context,
                                  regist,
                                  _,
                                  ) {
                                return TextFormField(
                                  style: GoogleFonts.notoSerif().copyWith(color: Colors.white),
                                  keyboardType: TextInputType.text,
                                  controller: accountController,
                                  focusNode: accountFocus,
                                  decoration: memberInputDecoration(Icons.mail_outline,
                                      S().inputMail, regist.accountErrorMsg, null),
                                  onChanged: (text) {
                                    Provider.of<RegistNotifier>(
                                      context,
                                      listen: false,
                                    ).accountValidating(
                                      fieldValue: accountController.text,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock,color: Colors.white,size: 30,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            padding: EdgeInsets.symmetric(vertical: _fieldVer),
                            child: Consumer<RegistNotifier>(
                              builder: (
                                  context,
                                  regist,
                                  _,
                                  ) {
                                return TextFormField(
                                  style: GoogleFonts.notoSerif().copyWith(color: Colors.white),
                                  keyboardType: TextInputType.text,
                                  controller: passwordController,
                                  focusNode: passwordFocus,
                                  decoration: memberInputDecoration(Icons.lock,
                                      S().inputPassword, regist.passwordErrorMsg, null),
                                  onChanged: (text) {
                                    Provider.of<RegistNotifier>(
                                      context,
                                      listen: false,
                                    ).passwordValidating(
                                      fieldValue: passwordController.text,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock_outline_rounded,color: Colors.white,size: 30,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            padding: EdgeInsets.symmetric(vertical: _fieldVer),
                            child: Consumer<RegistNotifier>(
                              builder: (
                                  context,
                                  regist,
                                  _,
                                  ) {
                                return TextFormField(
                                  style: GoogleFonts.notoSerif().copyWith(color: Colors.white),
                                  keyboardType: TextInputType.text,
                                  controller: confirmController,
                                  focusNode: confirmFocus,
                                  decoration: memberInputDecoration(
                                      Icons.lock_outline_rounded,
                                      S().inputPasswordAgain,
                                      regist.confirmErrorMsg,
                                      null),
                                  onChanged: (text) {
                                    Provider.of<RegistNotifier>(
                                      context,
                                      listen: false,
                                    ).confirmValidating(
                                        passwordValue: passwordController.text,
                                        confirmValue: confirmController.text);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone,color: Colors.white,size: 30,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            padding: EdgeInsets.symmetric(vertical: _fieldVer),
                            child: Consumer<RegistNotifier>(
                              builder: (
                                  context,
                                  regist,
                                  _,
                                  ) {
                                return TextFormField(
                                  style: GoogleFonts.notoSerif().copyWith(color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  controller: phoneController,
                                  focusNode: phoneFocus,
                                  decoration: memberInputDecoration(Icons.phone,
                                      S().inputPhone, regist.phoneErrorMsg, null),
                                  onChanged: (text) {
                                    Provider.of<RegistNotifier>(
                                      context,
                                      listen: false,
                                    ).phoneValidating(
                                      fieldValue: phoneController.text,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      SizedBox(
                          width: 100,
                          height: 50,
                          child: Consumer<RegistNotifier>(builder: (
                            context,
                            regist,
                            _,
                          ) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.grey.shade700,
                                  elevation: 5,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                              onPressed: () async {
                                if (regist.nickNameValid &&
                                    regist.accountValid &&
                                    regist.passwordValid &&
                                    regist.confirmValid &&
                                    regist.phoneValid) {
                                  await Provider.of<MemberDetailsNotifier>(
                                    context,
                                    listen: false,
                                  ).accountRegist
                                    (nickname:nickNameController.text, account: accountController.text, password:passwordController.text, phone:phoneController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.grey,
                                      content: Text(S().registSuccess),
                                    ),
                                  ).closed.then((value) => Navigator.pop(context));
                                } else {
                                  print('nc = ${regist.nickNameValid}');
                                  print('ac = ${regist.accountValid}');
                                  print('ps = ${regist.passwordValid}');
                                  print('con = ${regist.confirmValid}');
                                  print('ph = ${regist.phoneValid}');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 1),
                                        backgroundColor: Colors.grey,
                                        content: Text(S().inputDataError),
                                      ),
                                  );
                                }
                              },
                              child: Text(S().submit),
                            );
                          })),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
