import 'package:flutter/material.dart';
class TradesTablet extends StatefulWidget {
  @override
  _TradesTabletState createState() => _TradesTabletState();
}

class _TradesTabletState extends State<TradesTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false ,body: Text("Trades Tablet", style: TextStyle(fontSize: 50),));
  }
}
