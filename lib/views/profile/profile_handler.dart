import 'package:flutter/material.dart';
import 'package:hopex_progx/app_localizations.dart';
import 'package:hopex_progx/responsive/screen_type_layout.dart';
import 'package:hopex_progx/views/profile/profile_mobile.dart';
import 'package:hopex_progx/views/profile/profile_tablet.dart';

import '../page_handler/page_handler_mobile.dart';
import '../page_handler/page_handler_tablet.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final String pageTitle = "Profile";
    return ScreenTypeLayout(
      mobile: PageHandlerMobile(pageTitle: pageTitle, pageHandlerMobileContent: ProfileMobile(),),
      tablet: PageHandlerTablet(pageHandlerTabletContent: ProfileTablet()),
      desktop: PageHandlerTablet(pageHandlerTabletContent: ProfileTablet()),
    );
  }
}
