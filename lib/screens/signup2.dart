import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp2 extends StatefulWidget {
  @override
  SignUp2State createState() {
    return SignUp2State();
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child,
      AxisDirection axisDirection) {
    return child;
  }
}

class SignUp2State extends State<SignUp2> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeIn;
  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String error = '';
  String nextStep = '';
  List<String> stepsList = ["email", "password", "fname", "sname"];

  bool _isValid = false;

  final _totalDots = 5;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  String getCurrentPositionPretty() {
    return (_currentPosition + 1.0).toStringAsPrecision(2);
  }

  bool isInputValid(String input, String type)
  {
    Map regxType = {
      "email": r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      "password": r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
      "fname": r"^[a-zA-Z].{1,}$",
      "lname": r"^[a-zA-Z].{1,}$"
    };
    return RegExp(regxType[type]).hasMatch(input);
  }

  stepInputCheck(){
    switch(nextStep){
      case "email":
        if(isInputValid(email, "email")) setState(() => _isValid = true);
        break;
      case "password":
        if(isInputValid(password, "password")) setState(() => _isValid = true);
        break;
      case "fname":
        if(isInputValid(firstName, "fname")) setState(() => _isValid = true);
        break;
      case "lname":
        if(isInputValid(lastName, "lname")) setState(() => _isValid = true);
        break;
      default:
        break;
    }
  }


  SizedBox formInput(String inputTitle, TextInputType inputKeyboardType, String validationType, String errorMsg){
    String initValue(){
      switch(validationType){
        case "email"    :  return email; break;
        case "password" :  return password; break;
        case "fname"    :  return firstName; break;
        case "lname"    :  return lastName; break;
      }
      return "";
    }

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: Text(inputTitle,
                style: GoogleFonts.sourceSansPro(textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
                textAlign: TextAlign.left,),
            ),
            TextFormField(
              autovalidate: initValue() == "" ? false : true,
              initialValue: initValue(),
              keyboardType: inputKeyboardType,
              obscureText: validationType == "password" ? true : false,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87
                    ),
                  ),
                  labelStyle: TextStyle(fontSize: 18,
                      color: Colors.green)
              ),
              // currValue
              onChanged: (val) {
                setState(() => _isValid = false);
                if(isInputValid(val, validationType)) {
                  switch(validationType){
                    case "email"    :  setState(() => email     = val); break;
                    case "password" :  setState(() => password  = val); break;
                    case "fname"    :  setState(() => firstName = val); break;
                    case "lname"    :  setState(() => lastName  = val); break;
                  }
                  setState(() => _isValid = true);
                }
              },
              validator: (val) {
                if(!isInputValid(val, validationType)) return errorMsg;
                else return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var decorator = DotsDecorator(
      activeColor: Colors.green,
      size: Size.square(7.0),
      spacing: const EdgeInsets.all(1.5),
      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_up, size: 40,),
                    onPressed: () {
                      _controller.previousPage(duration: _kDuration, curve: _kCurve);
                      _currentPosition = _currentPosition.ceilToDouble();
                      _updatePosition(max(--_currentPosition, 0));
                      setState(() => nextStep = stepsList[_currentPosition.toInt()]);
                      stepInputCheck();
                    },
                  ),
                ),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  axis: Axis.vertical,
                  decorator: decorator,
                ),
              ],
            ),
            Form(
              child: Flexible(
                child: SizedBox(
                  height: double.infinity,
                  child: ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: _controller,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        _isValid = false;
                        return [
                          formInput("What's your email?",
                              TextInputType.emailAddress,
                              "email",
                              "Not Valid Email"),
                          formInput("Set your password",
                              TextInputType.visiblePassword,
                              "password",
                              "Not Valid Password"),
                          formInput("First Name",
                              TextInputType.text,
                              "fname",
                              "Not Valid Name"),
                          formInput("Second Name",
                              TextInputType.text,
                              "lname",
                              "Not Valid Name"),
                          SizedBox.expand(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 40,),
                                    SizedBox(
                                        width: double.infinity,
                                        child: Text("Terms & Privacy Policy", style: GoogleFonts.sourceSansPro(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)), textAlign: TextAlign.left,),
                                    ),
                                    Text(
                                      '''
                                      There are many variations of passages of Lorem Ipsum available,
                                      but the majority have suffered alteration in some form,
                                      by injected humour, or randomised words which don't look even slightly believable.
                                      If you are going to use a passage of Lorem Ipsum,
                                      you need to be sure there isn't anything embarrassing hidden in the middle of text.
                                      ''',
                                      textAlign: TextAlign.start,
                                      //overflow: TextOverflow.visible,
                                      //maxLines: 3,
                                    ),
                                  ],
                                )
                              )
                          ),
                        ][index];
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Next'),
                  color: _isValid ? Colors.green : Colors.grey.shade500,
                  textColor: _isValid ? Colors.white : Colors.black87,
                  disabledElevation: 0,
                  onPressed: _isValid ? () {
                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                    _currentPosition = _currentPosition.floorToDouble();
                    _updatePosition(min(++_currentPosition, _totalDots.toDouble()));
                    setState(() => nextStep = stepsList[_currentPosition.toInt()]);
                    stepInputCheck();
                    print("email: $email");
                    print("password: $password");
                    print("firstName: $firstName");
                    print("firstName: $lastName");
                  }: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
