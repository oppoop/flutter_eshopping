import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/model/textfied_look.dart';
import 'package:flutter_eshopping/providers/regist_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/login_status_notifier.dart';
class regist extends StatefulWidget {
  @override
  _regist createState() => _regist();
}

class _regist extends State<regist> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode accountFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<LoginStatusNotifier>(
        create: (context) => LoginStatusNotifier(),
      ),
    ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "註冊",
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(top:15,bottom: 15, left: 10, right: 10),
                    child: Consumer<RegistNotifier>(
                      builder: (
                          context,
                          regist,
                          _,
                          ) {
                        return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: accountController,
                          focusNode: accountFocus,
                          decoration: memberInputDecoration(
                              Icons.person, '請輸入信箱', regist.accountErrorMsg,null),
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
                    padding:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: Consumer<RegistNotifier>(
                      builder: (
                          context,
                          regist,
                          _,
                          ) {
                        return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          focusNode: passwordFocus,
                          decoration: memberInputDecoration(
                              Icons.lock, '請輸入密碼', regist.passwordErrorMsg,null),
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
                    padding:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: Consumer<RegistNotifier>(
                      builder: (
                          context,
                          regist,
                          _,
                          ) {
                        return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: confirmController,
                          focusNode: confirmFocus,
                          decoration: memberInputDecoration(
                              Icons.lock_outline_rounded, '請再次輸入密碼', regist.confirmErrorMsg,null),
                          onChanged: (text) {
                            Provider.of<RegistNotifier>(
                              context,
                              listen: false,
                            ).confirmValidating(
                                passwordValue: passwordController.text,
                                confirmValue: confirmController.text
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: Consumer<RegistNotifier>(
                      builder: (
                          context,
                          regist,
                          _,
                          ) {
                        return TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          focusNode: phoneFocus,
                          decoration: memberInputDecoration(
                              Icons.phone, '請輸入電話', regist.phoneErrorMsg,null),
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
                          onPressed: () async{
                            if (regist.accountValid && regist.passwordValid && regist.confirmValid && regist.phoneValid) {
                              await Provider.of<LoginStatusNotifier>(
                                context,
                                listen: false,
                              ).saveAccount(
                                account: accountController.text,
                                password: passwordController.text,
                              );
                            } else {
                              print('ac = ${regist.accountValid}');
                              print('ps = ${regist.passwordValid}');
                              print('con = ${regist.confirmValid}');
                              print('ph = ${regist.phoneValid}');
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.blue, width: 2)),
                          textColor: Colors.white,
                          child: Text("送出"),
                        );
                      })),
                ],
              ),
            ),
          ),
        ),
      ),);
  }
}
