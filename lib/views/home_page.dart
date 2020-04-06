import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hopex_progx/widgets/left_tabbar/vertical_tab.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: Icon(Icons.menu, size: 30, color: Colors.black,),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
            ),
            VerticalTabs(
              tabsWidth: 50,
              direction: TextDirection.ltr,
              contentScrollAxis: Axis.vertical,
              changePageDuration: Duration(milliseconds: 1),
              tabs: <Tab>[
                Tab(/*child: Text('Trade',),*/ icon: Icon(EvaIcons.activityOutline, size: 30,),),
                Tab(/*child: Text('Finances'),*/ icon: Icon(EvaIcons.creditCardOutline, size: 30,),),
                Tab(/*child: Text('Profile'),*/ icon: Icon(EvaIcons.personOutline, size: 30,),),
                Tab(/*child: Text('Analytics'),*/ icon: Icon(EvaIcons.pieChartOutline, size: 30,),),
                Tab(/*child: Text('Help'),*/ icon: Icon(EvaIcons.questionMarkCircleOutline, size: 30,),),
                Tab(/*child: Text('Settings'),*/ icon: Icon(EvaIcons.settingsOutline, size: 30,),),
                Tab(/*child: Text('Logout'),*/ icon: Icon(EvaIcons.logOutOutline, size: 30,),),
              ],
              contents: <Widget>[
                Container(color: Colors.red, child: SafeArea(child: Text("jjj", style: TextStyle(fontSize: 35),),),),
                Container(color: Colors.yellow,),
                Container(color: Colors.green,),
                Container(color: Colors.pink,),
                Container(color: Colors.blue,),
                Container(color: Colors.purpleAccent,),
                Container(color: Colors.cyan,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
Widget tabsContent(String caption, [String description = 'iho8hp0h']) {
  return Container(
    margin: EdgeInsets.all(1),
    padding: EdgeInsets.all(2),
    child: Column(
      children: <Widget>[
        Text(
          caption,
          style: TextStyle(fontSize: 25),
        ),
        Divider(
          height: 20,
          color: Colors.black45,
        ),
        Text(
          description,
          style: TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ],
    ),
  );
}

Icon TabIcon(IconData iconData){
  return Icon(iconData, size: 30,);
}