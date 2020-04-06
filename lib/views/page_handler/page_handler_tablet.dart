import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hopex_progx/hand_cursor.dart';
import 'package:hopex_progx/widgets/app_drawer/app_drawer.dart';

class PageHandlerTablet extends StatefulWidget {
  final Widget pageHandlerTabletContent;
  const PageHandlerTablet({Key key, this.pageHandlerTabletContent}) : super(key: key);
  @override
  _PageHandlerTabletState createState() => _PageHandlerTabletState();
}

class _PageHandlerTabletState extends State<PageHandlerTablet> {
  @override
  Widget build(BuildContext context) {
    var children = [
      Container(
        height: MediaQuery.of(context).size.height,
          child: widget.pageHandlerTabletContent,
        color: Colors.grey.shade100,
      ),
      AppDrawer(),
    ];
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          title: Container(
            width: 70,
            padding: EdgeInsets.only(top: (MediaQuery.of(context).orientation == Orientation.landscape) ? 10 : 0),
            child: Icon(EvaIcons.behanceOutline, color: Colors.green, size: 50,),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 45.0,
                        height: 45.0,
                        padding: const EdgeInsets.all(3.0), // borde width
                        decoration: new BoxDecoration(
                          color:  Colors.green.shade100, // border color
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 45,
                          foregroundColor: Colors.green.shade100,
                          backgroundColor: Colors.green.shade100,
                          backgroundImage: ExactAssetImage('assets/images/progx.jpg'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 35),
                        height: 10,
                        width: 10,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Mohamed Marzouk", style: TextStyle(fontSize: 15, color: Colors.black),),
                        Text("1515\$", style: TextStyle(fontSize: 12, color: Colors.black),),
                        Text("250-726-943", style: TextStyle(fontSize: 12, color: Colors.black54),),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                      child: HandCursor(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(70.0),
                              side: BorderSide(color: Colors.green, width: 2)
                          ),
                          elevation: 0,
                          highlightElevation: 0,
                          highlightColor: Colors.white,
                          color: Colors.white,
                          onPressed: (){},
                          hoverElevation: 0,
                          child: Text("Deposit", style: TextStyle(color: Colors.green, fontSize: 15),),
                        ),
                      ),
                  ),
                  SizedBox(width: 30,),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        centerTitle: false,
        ),
      ),
      body: Column(children: children.reversed.toList()),
    );
  }
}
