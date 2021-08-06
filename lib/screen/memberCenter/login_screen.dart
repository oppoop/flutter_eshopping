import 'package:flutter_eshopping/providers/login_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/model/textfied_look.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/login_status_notifier.dart';
class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode accountFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
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
            "登入",
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(top:15,bottom: 15, left: 10, right: 10),
                    child: Consumer<LoginNotifier>(
                      builder: (
                          context,
                          login,
                          _,
                          ) {
                        return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: accountController,
                          focusNode: accountFocus,
                          decoration: memberInputDecoration(
                              Icons.person, '請輸入帳號', login.accountErrorMsg,null),
                          onChanged: (text) {
                            Provider.of<LoginNotifier>(
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
                    child: Consumer<LoginNotifier>(
                      builder: (
                          context,
                          login,
                          _,
                          ) {
                        return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          focusNode: passwordFocus,
                          obscureText: login.hidePassword,
                          decoration: memberInputDecoration(
                              Icons.lock, '請輸入密碼', login.passwordErrorMsg,null),
                          onChanged: (text) {
                            Provider.of<LoginNotifier>(
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
                  SizedBox(
                      width: 200,
                      height: 50,
                      child: Consumer<LoginNotifier>(builder: (
                          context,
                          login,
                          _,
                          ) {
                        return RaisedButton(
                          color: Colors.teal,
                          onPressed: () async{
                            if (login.accountValid && login.passwordValid) {
                              await Provider.of<LoginNotifier>(
                                context,
                                listen: false,
                              ).loginSubmit(
                                accountField: accountController.text,
                                passwordFied: passwordController.text,
                              );
                            } else {
                              print('ac = ${login.accountValid}');
                              print('ps = ${login.passwordValid}');
                            };
                            if(login.loginCheck){
                              Provider.of<LoginStatusNotifier>(context,listen: false).getAccount();
                            }else{return Future.delayed(Duration(seconds: 2),()=>print('登入失敗'));}
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
      ),
    );
  }
}
