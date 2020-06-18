import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
/// Contains the widgets that will be used for Mobile layout of PageHandler,
///  and landscape

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hopex_progx/api/rounds_api.dart';
import 'package:hopex_progx/views/trades/trades_handler.dart';
import 'package:hopex_progx/widgets/app_drawer/app_drawer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageHandlerMobile extends StatefulWidget {
  final Widget pageHandlerMobileContent;
  final String pageTitle;
  PageHandlerMobile({Key key, this.pageHandlerMobileContent, this.pageTitle}) : super(key: key);

  @override
  _PageHandlerMobileState createState() => _PageHandlerMobileState();
}

class _PageHandlerMobileState extends State<PageHandlerMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int kg = 0;
  bool _firstPress = true;
  @override
  Widget build(BuildContext context) {
    /*final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = (currentDirection == TextDirection.rtl);*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(widget.pageTitle, style: TextStyle(fontSize: 23, fontFamily: "JF", fontWeight: FontWeight.bold, color: Colors.black54)),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(EvaIcons.menu, size: 30, color: Colors.green,),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Add Round"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      title: Center(child: Text('Add New Round')),
                      content: new Row(
                        children: <Widget>[
                          new Expanded(
                          child: new TextField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter(RegExp("[0-9]"))
                            ],
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20, right: 20),
                              hintText: "Number of Kilogrames",
                              focusedBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.green,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(Radius.circular(50.0),),
                                  borderSide: BorderSide(
                                      color: Colors.black26
                                  )
                              ),
                            ),
                            onChanged: (value) {
                              setState(() => kg = int.parse(value));
                            },
                          ))
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        FlatButton(
                            child: Text('Add'),
                            onPressed: () async {
                              if(_firstPress){
                                setState(() => _firstPress = false);
                                RoundsAPI roundsAPI = new RoundsAPI();
                                if(await roundsAPI.addRound(kg)){
                                  Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(seconds: 0), child: Trades()));
                                }
                              }
                            })
                      ],
                    );
                  },
                );
              }
            ),
          )
        ],
      ),
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade100,
        child: Column(
          children: <Widget>[
            widget.pageHandlerMobileContent,
          ],
        ),
      ),
    );
  }
}
