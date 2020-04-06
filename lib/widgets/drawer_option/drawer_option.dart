import 'package:flutter/material.dart';
import 'package:hopex_progx/responsive/orientation_layout.dart';
import 'package:hopex_progx/responsive/screen_type_layout.dart';


import 'drawer_option_mobile.dart';
import 'drawer_option_tablet.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String toPage;
  final bool isSelected = false;
  const DrawerOption({
    Key key,
    this.title,
    this.iconData, this.toPage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: DrawerOptionMobilePortrait(
          title: title,
          iconData: iconData,
          toPage: toPage,
        ),
      tablet: DrawerOptionTabletLandscape(
          iconData: iconData,
          title: title,
        ),
    );
  }
}
