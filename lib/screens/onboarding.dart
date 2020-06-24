import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  //Create a list of PageModel to be set on the onBoarding Screens.

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> listPagesViewModel = [
      PageViewModel(
        title: "Recycling Garbage",
        body: "This application assists in managing garbage & investing money to finally recycle garbage.",
        image: Center(child: Image.asset("assets/images/slider_1.png", height: 250.0)),
      ),
      PageViewModel(
        title: "Garbage Collection",
        body: "On joining this track, we collect your garbage for free. If you separate it you earn money.",
        image: Center(child: Image.asset("assets/images/slider_2.png", height: 250.0)),
      ),
      PageViewModel(
        title: "Investing Money",
        body: "With your investment we expand our services area and you earn cash.",
        image: Center(child: Image.asset("assets/images/slider_3.png", height: 250.0)),
      )
    ];
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: Padding(
        padding: const EdgeInsets.only(top: 130.0),
        child: IntroductionScreen(
          pages: listPagesViewModel,
          onDone: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isOnBoardingSeen', true);
            Navigator.pushNamed(context, "/SignUp");
          },
          onSkip: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isOnBoardingSeen', true);
            Navigator.pushNamed(context, "/SignUp");
          },
          showSkipButton: true,
          skip: Row(
            children: <Widget>[
              Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          next: const Icon(Icons.navigate_next),
          done: const Text("Sign up", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Colors.green,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              )
          ),
        ),
      ),
    );
  }
}
