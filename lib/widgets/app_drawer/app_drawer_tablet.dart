import 'package:flutter/material.dart';

import 'app_drawer.dart';

class AppDrawerTabletLandscape extends StatelessWidget {
  const AppDrawerTabletLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 16,
          color: Colors.black12,
        ),
      ]),
      child: Column(
        children: AppDrawer.getDrawerOptions(context),
      ),
    );
  }
}
