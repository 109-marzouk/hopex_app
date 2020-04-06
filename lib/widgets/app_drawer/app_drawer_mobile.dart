import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hopex_progx/app_localizations.dart';

import 'app_drawer.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class AppDrawerMobile extends StatelessWidget {
  const AppDrawerMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = (currentDirection == TextDirection.rtl);
    //final EdgeInsetsGeometry sts_point = isRTL ? EdgeInsets.only(value) : ;
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      //width: orientation == Orientation.portrait ? 300 : 55,
      width: 300,
      decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
        BoxShadow(
          blurRadius: 16,
          color: Colors.black12,
        )
      ]),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          physics: orientation == Orientation.landscape ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 10, left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            new Container(
                              width: 65.0,
                              height: 65.0,
                              decoration: new BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: new DecorationImage(
                                  image: new ExactAssetImage('assets/images/progx.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                                border: new Border.all(
                                  color: Colors.green.shade100,
                                  width: 4.0,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 49, left: !isRTL ? 45 : 0, right: isRTL ? 40 : 0),
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(50.0)
                                  )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: 65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Mohamed Marzouk", style: TextStyle(fontSize: 20, height: 1.7),),
                              Text("1515\$", style: TextStyle(fontSize: 15, height: 1),),
                              Text("250-726-943", style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.2),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.green,
                        onPressed: (){},
                        child: Text(AppLocalizations.of(context).translate("deposit"), style: TextStyle(color: Colors.white, fontSize: 15),),
                      )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20, child: Container(color: Colors.white,),),
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(children: AppDrawer.getDrawerOptions(context),
              mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
