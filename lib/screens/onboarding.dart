import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

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
        title: "Title of first page",
        body: "Here you can write the description of the page, to explain someting...",
        image: Center(child: Image.asset("assets/images/slider_1.png", height: 175.0)),
      ),
      PageViewModel(
        title: "Title of first page",
        body: "Here you can write the description of the page, to explain someting...",
        image: Center(child: Image.asset("assets/images/slider_2.png", height: 175.0)),
      ),
      PageViewModel(
        title: "Title of first page",
        body: "Here you can write the description of the page, to explain someting...",
        image: Center(child: Image.asset("assets/images/slider_3.png", height: 175.0)),
      )
    ];
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          Navigator.pushNamed(context, "/SignUp");
        },
        onSkip: () {
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
    );
  }
}
