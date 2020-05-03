import 'package:eva_icons_flutter/eva_icons_flutter.dart';
/// Contains the widgets that will be used for Mobile layout of PageHandler,
///  and landscape

import 'package:flutter/material.dart';
import 'package:hopex_progx/widgets/app_drawer/app_drawer.dart';

class PageHandlerMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget pageHandlerMobileContent;
  final String pageTitle;
  PageHandlerMobile({Key key, this.pageHandlerMobileContent, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = (currentDirection == TextDirection.rtl);*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(pageTitle, style: TextStyle(fontSize: 23, fontFamily: "JF", fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(EvaIcons.menu, size: 30, color: Colors.green,),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade200,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            pageHandlerMobileContent,
          ],
        ),
      ),
    );
  }
}
