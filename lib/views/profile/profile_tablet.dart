import 'package:flutter/material.dart';
class ProfileTablet extends StatefulWidget {
  @override
  _ProfileTabletState createState() => _ProfileTabletState();
}

class _ProfileTabletState extends State<ProfileTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false ,body: Text("Profile Tablet", style: TextStyle(fontSize: 50),));
  }
}
