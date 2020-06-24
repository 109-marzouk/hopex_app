import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hopex_progx/app_localizations.dart';
import 'package:hopex_progx/responsive/screen_type_layout.dart';
import 'package:hopex_progx/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:hopex_progx/widgets/drawer_option/drawer_option.dart';


import 'app_drawer_tablet.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: ScreenTypeLayout(
        mobile: AppDrawerMobile(),
        tablet: AppDrawerTabletLandscape(),
      ),
    );
  }

  static List<Widget> getDrawerOptions(context) {
    return [
      DrawerOption(
        title: "News",
        iconData: EvaIcons.archiveOutline,
        toPage: '/Trades',
      ),
      DrawerOption(
        title: "Verify my account",
        iconData: EvaIcons.personDoneOutline,
        toPage: '/Trades',
      ),
      DrawerOption(
        title: "Edit my personal info",
        iconData: EvaIcons.edit2Outline,
        toPage: '/Trades',
      ),
      DrawerOption(
        title: "About us",
        iconData: EvaIcons.infoOutline,
        toPage: '/Trades',
      ),
      DrawerOption(
        title: "Contact us",
        iconData: EvaIcons.messageSquareOutline,
        toPage: '/Trades',
      ),
      DrawerOption(
        title: "Terms & Conditions",
        iconData: EvaIcons.bookOutline,
        toPage: '/Trades',
      ),
      DrawerOption(
        title: "Logout",
        iconData: EvaIcons.logOutOutline,
        toPage: '/SignIn',
      ),
    ];
  }
}
