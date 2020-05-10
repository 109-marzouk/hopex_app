import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hopex_progx/app_localizations.dart';
import 'package:hopex_progx/screens/signup.dart';
import 'package:hopex_progx/views/trades/trades_handler.dart';
import 'package:page_transition/page_transition.dart';
import '../api/auth_api.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = '';
  String password = '';
  String error = '';
  final _singInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(height: 20,),
                        Image.asset("assets/images/logo.png", height: 80,),
                        SizedBox(height: 10,),
                        Column(
                          children: <Widget>[
                            Form(
                              key: _singInFormKey,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    child: TextFormField(
                                      cursorColor: Colors.green,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                                        hintText: AppLocalizations.of(context).translate("email"),
                                        //filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                                          borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.green,
                                          ),
                                        ),
                                        focusColor: Colors.purpleAccent,
                                        border: OutlineInputBorder(
                                            borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                                          borderSide: BorderSide(
                                            color: Colors.black26,
                                          )
                                        ),
                                      ),
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },
                                      validator: (val) {
                                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email))
                                          return "please enter a valid email";
                                        else return null;
                                      },
                                    ),
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                      cursorColor: Colors.green,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                                        hintText: AppLocalizations.of(context).translate("password"),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                                          borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.green,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                                          borderSide: BorderSide(
                                            color: Colors.black26
                                          )
                                        ),
                                      ),
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
//                                    validator: (val) {
//                                      if(!RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password))
//                                        return "it must be at least 8 characters and contains:\none letter A-Z or a-z\none symbol such as #@\$%&(), etc..";
//                                      else return null;
//                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20,bottom: 20),
                              child: Text(AppLocalizations.of(context).translate("forget_password"),
                              textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green
                                ),
                                ),
                            ),
                          ],
                        ),
                        MaterialButton(
                          hoverElevation: 0,
                          highlightElevation: 0,
                          focusElevation: 0,
                          onPressed: () async {
                            if(_singInFormKey.currentState.validate()){
                              AuthAPI authAPI = AuthAPI();
                              if(await authAPI.isUserExist(email, password)){
                                Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(seconds: 0), child: Trades()));
                              }
                            }
                          },
                          child: Text(AppLocalizations.of(context).translate("sign_in"),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          ),
                          color: Colors.green,
                          elevation: 0,
                          minWidth: MediaQuery.of(context).size.width,
                          height: 45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context).translate("or_sign_in_using"),
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MaterialButton(
                                hoverElevation: 0,
                                highlightElevation: 0,
                                focusElevation: 0,
                                onPressed: (){},
                                child: Icon(EvaIcons.facebookOutline, size: 25,),
                                color: Colors.white,
                                elevation: 0,
                                //minWidth: 350,
                                height: 55,
                                minWidth: 55,
                                textColor: Colors.blue.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: Colors.blue.shade800, width: 2.5)
                                ),
                              ),
                              SizedBox(width: 20,),
                              MaterialButton(
                                hoverElevation: 0,
                                highlightElevation: 0,
                                focusElevation: 0,
                                onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(EvaIcons.googleOutline, size: 25,),
                                  ],
                                ),
                                color: Colors.white,
                                elevation: 0,
                                //minWidth: 350,
                                height: 55,
                                minWidth: 55,
                                textColor: Colors.red.shade800,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: Colors.red.shade800, width: 2.5)
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(fontFamily: "JF"),
                                children: [
                                  TextSpan(
                                    text: AppLocalizations.of(context).translate("Don't_have_an_account"),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    )
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(context).translate("sign_up"),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () =>
                                        Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(seconds: 0), child: SignUp())),
                                  ),
                                ]
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}