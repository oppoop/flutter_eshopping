import 'package:flutter_eshopping/providers/login_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/model/textfied_look.dart';
import 'package:flutter_eshopping/providers/member_notifier.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_eshopping/generated/l10n.dart';


class Login extends StatelessWidget {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail_outline_outlined,color: Colors.white,size: 30,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        padding:
                        const EdgeInsets.symmetric(vertical: 10),
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
                                  Icons.mail_outline_outlined, S().inputMail, login.accountErrorMsg,null),
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock,color: Colors.white,size: 30,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        padding:
                        const EdgeInsets.symmetric(vertical: 10),
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
                                  Icons.lock, S().inputPassword, login.passwordErrorMsg,null),
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
                    ],
                  ),
                  SizedBox(height: 50,),
                  SizedBox(
                      width: 100,
                      height: 50,
                      child: Consumer<LoginNotifier>(builder: (
                          context,
                          login,
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
                          onPressed: () async{
                            if (login.accountValid && login.passwordValid) {
                              await Provider.of<LoginNotifier>(
                                context,
                                listen: false,
                              ).loginSubmit(
                                accountField: accountController.text,
                                passwordFied: passwordController.text,
                              );
                              if(login.loginStatus){
                                Provider.of<MemberDetailsNotifier>(context,listen: false).getDetail();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.grey,
                                    content: Text(S().loginSuccess),
                                  ),
                                ).closed.then((value) => Navigator.pop(context))
                                ;}
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.grey,
                                    content: Text(S().accountPassError),
                                  ),
                                );
                              }
                            } else {
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
                      })),],
              ),
            ],
          ),],
      ),
    );
  }
}
