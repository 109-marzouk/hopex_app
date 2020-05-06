import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hopex_progx/app_localizations.dart';
import 'package:hopex_progx/screens/SignIn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child,
      AxisDirection axisDirection) {
    return child;
  }
}


class _SignUpState extends State<SignUp> {


  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String error = '';

  int _validPosition(int position) {
    if (position < 0) return 0;
    return position;
  }
  int currIndex = 0;
  bool isInputValid(String input, String type)
  {
    Map regxType = {
      "email": r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      "password": r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
      "fname": r"^[a-zA-Z].{1,}$",
    };
    return RegExp(regxType[type]).hasMatch(input);
  }
  @override
  Widget build(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = (currentDirection == TextDirection.rtl);
    List<IconData> stepIcon(){
      List<IconData> result = [
        EvaIcons.arrowRightOutline,
        EvaIcons.arrowLeftOutline,
      ];
      return isRTL ? result.toList() : result.reversed.toList();
    }
    List<Widget> formInputs = [
      Column(
        children: <Widget>[
          TextFormField(
            cursorColor: Colors.green,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              hintText: AppLocalizations.of(context).translate("first_name"),
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              focusColor: Colors.green,
              enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                  borderSide: BorderSide(
                    color: Colors.black26,
                  )
              ),
            ),
            onChanged: (val) {
              setState(() => firstName = val);
            },
            validator: (val) {
              if(!isInputValid(firstName, "name")) return "Invalid Name";
              else return null;
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            cursorColor: Colors.green,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              hintText: AppLocalizations.of(context).translate("last_name"),
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              focusColor: Colors.green,
              enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                  borderSide: BorderSide(
                    color: Colors.black26,
                  )
              ),
            ),
            onChanged: (val) {
              setState(() => lastName = val);
            },
            validator: (val) {
              if(!isInputValid(lastName, "name")) return "Invalid Name";
              else return null;
            },
          ),
        ],
      ),
      Column(
        children: <Widget>[
          TextFormField(
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
              focusColor: Colors.green,
              enabledBorder: OutlineInputBorder(
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
              if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) return "Invalid Email";
              else return null;
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            cursorColor: Colors.green,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              hintText: AppLocalizations.of(context).translate("confirm_email"),
              //filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              focusColor: Colors.green,
              enabledBorder: OutlineInputBorder(
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
              if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) return "Invalid Email";
              else return null;
            },
          ),
        ],
      ),
      Column(
        children: <Widget>[
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
              enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                  borderSide: BorderSide(
                      color: Colors.black26
                  )
              ),
            ),
            onChanged: (val) {
              setState(() => password = val);
            },
            validator: (val) {
              if(!RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)) return "Invalid Password";
              else return null;
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            obscureText: true,
            cursorColor: Colors.green,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              hintText: AppLocalizations.of(context).translate("confirm_password"),
              focusedBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                  borderSide: BorderSide(
                      color: Colors.black26
                  )
              ),
            ),
            onChanged: (val) {
              setState(() => password = val);
            },
            validator: (val) {
              if(!RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)) return "Invalid Password";
              else return null;
            },
          ),
        ],
      )
    ];
    CarouselSlider formSlider = CarouselSlider.builder(
      scrollDirection: Axis.vertical,
      enableInfiniteScroll: false,
      initialPage: 0,
      enlargeCenterPage: false,
      viewportFraction: 1.0,
      aspectRatio: 2.0,
      scrollPhysics: NeverScrollableScrollPhysics(),
      itemCount: formInputs.length,
      itemBuilder: (BuildContext context, int itemIndex) =>
          Container(
            child: formInputs[itemIndex],
          ),
    );
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
                              //key: _formKey,
                              child: ScrollConfiguration(
                                behavior: CustomScrollBehavior(),
                                child: formSlider,
                              ),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              MaterialButton(
                                elevation: 0,
                                hoverElevation: 0,
                                highlightElevation: 0,
                                focusElevation: 0,
                                child: Row(
                                  children: <Widget>[
                                    Icon(stepIcon()[0], size: 40,
                                    color: currIndex > 0 ? Colors.green : Colors.black54,),
                                    Text(AppLocalizations.of(context).translate("pervious"), style: TextStyle(fontSize: 18, color: currIndex > 0 ? Colors.green : Colors.black54,),),
                                  ],
                                ),
                                color: Colors.white,
                                disabledColor: Colors.white,
                                onPressed: currIndex > 0 ? () {
                                  setState(() => currIndex = _validPosition(--currIndex));
                                  print(currIndex);
                                  formSlider.previousPage(
                                    duration: Duration(milliseconds: 300), curve: Curves.linear);
                                } : null,
                              ),
                              Directionality(
                                textDirection: isRTL ? TextDirection.ltr : TextDirection.rtl,
                                child: MaterialButton(
                                  elevation: 0,
                                  hoverElevation: 0,
                                  highlightElevation: 0,
                                  focusElevation: 0,
                                  color: Colors.white,
                                  disabledColor: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(stepIcon()[1], size: 40,
                                        color: currIndex <= 1 ? Colors.green : Colors.black54,),
                                      Text(AppLocalizations.of(context).translate("next"), style: TextStyle(fontSize: 18, color: currIndex <= 1 ? Colors.green : Colors.black54,),),
                                    ],
                                  ),
                                    onPressed: currIndex <= 1 ? () {
                                      setState(() => currIndex = _validPosition(++currIndex));
                                      print(currIndex);
                                      formSlider.nextPage(
                                          duration: Duration(milliseconds: 300), curve: Curves.linear);
                                    } : null,
                                ),
                              ),
                            ]),
                          ],
                        ),
                        MaterialButton(
                          hoverElevation: 0,
                          highlightElevation: 0,
                          focusElevation: 0,
                          onPressed: currIndex == 2 ? () async {
                            /*if(_formKey.currentState.validate()){
                              dynamic result = await _auth.loginWithEmailAndPassword(email, password);
                              if(result == null){
                                setState(() => error = "user not found!");
                              }
                              else{
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Home()));
                              }
                            }*/
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool('isSignUpPressed', true);
                          } : null,
                          child: Text(AppLocalizations.of(context).translate("sign_up").toUpperCase(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          color: Colors.green,
                          disabledColor: Colors.grey,
                          elevation: 0,
                          minWidth: MediaQuery.of(context).size.width,
                          height: 45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context).translate("or_sign_up_using"),
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
                                        text: AppLocalizations.of(context).translate("already_have_an_account"),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        )
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context).translate("sign_in").toLowerCase(),
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 15,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () =>
                                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SignIn(), duration: Duration(seconds: 0))),
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