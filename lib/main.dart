import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hopex_progx/app_localizations.dart';
import 'package:hopex_progx/screens/SignIn.dart';
import 'package:hopex_progx/screens/onboarding.dart';
import 'package:hopex_progx/screens/signup.dart';
import 'package:hopex_progx/views/trades/trades_handler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/users_api.dart';
bool testSize = false;
bool isOnBoardingSeen;
bool isLoggedIn;
bool isSignUpPressed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs =  await SharedPreferences.getInstance();
  isOnBoardingSeen = prefs.getBool('isOnBoardingSeen') ?? false;
  isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  isSignUpPressed = prefs.getBool('isSignUpPressed') ?? false;
  runApp(testSize ? DevicePreview(builder: (context) => MyApp(),): MyApp());
}


class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: DevicePreview.appBuilder,
        /*builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },*/
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "JF",
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          backgroundColor: Colors.grey.shade100,
          primarySwatch: Colors.blue,
        ),
        //home: HomeView(),
        initialRoute: isOnBoardingSeen == false ? '/OnBoarding' : (isLoggedIn ? '/Trades' : isSignUpPressed ? '/SignIn' : '/SignUp'),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/OnBoarding': (context) => OnBoarding(),
          '/SignUp': (context) => SignUp(),
          '/SignIn': (context) => SignIn(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/Trades': (context) => Trades(),
          /*'/Finances': (context) => FinancesView(),
          '/Profile': (context) => ProfileView(),
          '/Analytics': (context) => AnalyticsView(),
          '/Help': (context) => HelpView(),
          '/Settings': (context) => SettingsView(),*/
        },
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
