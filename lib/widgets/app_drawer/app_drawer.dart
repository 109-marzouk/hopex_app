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
        title: AppLocalizations.of(context).translate("trades"),
        iconData: EvaIcons.activityOutline,
        toPage: '/Trades',
      ),
      DrawerOption(
        title: AppLocalizations.of(context).translate("finances"),
        iconData: EvaIcons.creditCardOutline,
        toPage: '/Finances',
      ),
      DrawerOption(
        title: AppLocalizations.of(context).translate("profile"),
        iconData: EvaIcons.personOutline,
        toPage: '/Profile',
      ),
      DrawerOption(
        title: AppLocalizations.of(context).translate("analytics"),
        iconData: EvaIcons.pieChartOutline,
        toPage: '/Analytics',
      ),
      DrawerOption(
        title: AppLocalizations.of(context).translate("help"),
        iconData: EvaIcons.questionMarkCircleOutline,
        toPage: '/Help',
      ),
      DrawerOption(
        title: AppLocalizations.of(context).translate("settings"),
        iconData: EvaIcons.settingsOutline,
        toPage: '/Settings',
      ),
      DrawerOption(
        title: AppLocalizations.of(context).translate("logout"),
        iconData: EvaIcons.logOutOutline,
      ),
    ];
  }
}
