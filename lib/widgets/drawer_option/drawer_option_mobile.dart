import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerOptionMobilePortrait extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String toPage;
  const DrawerOptionMobilePortrait({
    Key key,
    this.title,
    this.iconData, this.toPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currRoute = ModalRoute.of(context).settings.name;
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = (currentDirection == TextDirection.rtl);

    return Container(
      padding: const EdgeInsets.only(left: 3),
      height: 55,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.4, color: Colors.grey.shade300)
        ),
      ),
      child: MaterialButton(
        onPressed: () async {
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          if(toPage == "/SignIn"){
            sharedPreferences.setBool('isLoggedIn', false);
            sharedPreferences.remove('userID');
            sharedPreferences.remove('token');
          }
          Navigator.of(context).pushReplacementNamed(toPage);
        },
        splashColor: Colors.green.shade50,
        highlightColor: Colors.green.shade50,
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              size: 30,
              color: Colors.green,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerOptionMobileLandscape extends StatefulWidget {
  final IconData iconData;

  const DrawerOptionMobileLandscape({Key key, this.iconData}) : super(key: key);

  @override
  _DrawerOptionMobileLandscapeState createState() => _DrawerOptionMobileLandscapeState();
}

class _DrawerOptionMobileLandscapeState extends State<DrawerOptionMobileLandscape> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      alignment: Alignment.center,
      child: IconButton(
        icon: Icon(widget.iconData, color: isSelected ? Colors.green : Colors.black12,),
        onPressed: (){
      },),
    );
  }
}
