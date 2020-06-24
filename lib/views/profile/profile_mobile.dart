import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hopex_progx/widgets/app_drawer/app_drawer.dart';
import 'package:hopex_progx/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';



class ProfileMobile extends StatefulWidget {
  @override
  _ProfileMobileState createState() => _ProfileMobileState();
}

class _ProfileMobileState extends State<ProfileMobile> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        gradient: new LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.green,
                              Colors.lightGreenAccent
                            ]
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    margin: EdgeInsets.only(left: 35, right: 35, bottom: 0, top: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.19),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(1, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircularProfileAvatar(
                      '',
                      child: Image(image: AssetImage("assets/images/marzouk.jpg"),),
                      radius: 30,
                      backgroundColor: Colors.white,
                      borderWidth: 2,
                      initialsText: Text(
                        "AD",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),  // sets initials text, set your own style, default Text('')
                      borderColor: Colors.green, // sets border color, default Colors.white
                      elevation: 2.0, // sets elevation (shadow of the profile picture), default value is 0.0
                      cacheImage: true, // allow widget to cache image against provided url
                      onTap: () {
                        print('adil');
                      }, // sets on tap
                    ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mohamed Marzouk",
                              style: TextStyle(
                                fontSize: 19
                              ),
                            ),
                            Text(
                              "joined 7 months ago",
                              style: TextStyle(
                                color: Colors.black54
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 35, right: 35, bottom: 15, top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.19),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(1, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Table(
                border: TableBorder(
                  verticalInside: BorderSide(width: 2.0, color: Colors.grey.shade200),
                ),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 25),
                                    child: Text("13710",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Text("LE",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black45
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text("Total Investments", style: TextStyle(color: Colors.black54, fontSize: 16),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text("7542", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),),
                            Text("Rank", style: TextStyle(color: Colors.black54, fontSize: 16),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Container(
                  margin: EdgeInsets.only(left: 35, right: 35, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    children: AppDrawer.getDrawerOptions(context),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }


}
