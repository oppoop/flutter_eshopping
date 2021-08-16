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
                          ElevatedButton(
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
                          ),
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
                                          "點擊上傳",
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
                          ElevatedButton(
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
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
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
                                  Icons.person, '請輸入暱稱', regist.nickNameErrorMsg, null),
                              onChanged: (text){
                                Provider.of<RegistNotifier>(context,listen: false).nickNameValidating(fieldValue: nickNameController.text);
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
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
                                  '請輸入信箱', regist.accountErrorMsg, null),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
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
                                  '請輸入密碼', regist.passwordErrorMsg, null),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
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
                                  '請再次輸入密碼',
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
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
                                  '請輸入電話', regist.phoneErrorMsg, null),
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
                      SizedBox(
                          width: 200,
                          height: 50,
                          child: Consumer<RegistNotifier>(builder: (
                            context,
                            regist,
                            _,
                          ) {
                            return RaisedButton(
                              color: Colors.teal,
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
                                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (BuildContext context) =>AppPage()), (route) => false);
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
                                        content: Text('資料不正確'),
                                        action: SnackBarAction(
                                          label: '',
                                          onPressed: () {
                                          },
                                        ),
                                      ),
                                  );
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side:
                                      BorderSide(color: Colors.blue, width: 2)),
                              textColor: Colors.white,
                              child: Text("送出"),
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
