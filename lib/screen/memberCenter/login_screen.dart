import 'package:flutter_eshopping/providers/login_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/model/textfied_look.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign Up',style:GoogleFonts.dancingScript().copyWith(color: Colors.white,fontSize: 50) ,),
              SizedBox(height: 50,),
              Column(
                children: [
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
                          style: GoogleFonts.notoSerif().copyWith(color: Colors.white),
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
                          style: GoogleFonts.notoSerif().copyWith(color: Colors.white),
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.grey,
                                  content: Text('帳號密碼錯誤'),
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
                              side: BorderSide(color: Colors.blue, width: 2)),
                          textColor: Colors.white,
                          child: Text("送出"),
                        );
                      })),],
              ),
            ],
          ),],
      ),
    );
  }
}
