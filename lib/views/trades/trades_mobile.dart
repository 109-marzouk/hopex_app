import 'package:bordered_text/bordered_text.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hopex_progx/utils/CustomStepper.dart';
import 'package:hopex_progx/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:async';
import '../../api/rounds_api.dart';


class TradesMobile extends StatefulWidget {
  @override
  _TradesMobileState createState() => _TradesMobileState();
}

class _TradesMobileState extends State<TradesMobile> {
  @override
  Widget build(BuildContext context) {
    RoundsAPI roundsAPI = RoundsAPI();
    double card_width = (MediaQuery.of(context).size.width - 80) / 2;
    return Expanded(
        child: Column(
          children: [
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      height: 150,
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
                  ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      padding: EdgeInsets.all(35),
                      scrollDirection: Axis.horizontal,
                      children: [
                        CardNum("164.6\$", "Earnings", LineAwesomeIcons.money),
                        SizedBox(width: 25,),
                        CardNum("42.8\$", "Balance", LineAwesomeIcons.bank),
                        SizedBox(width: 25,),
                        CardNum("3521", "Kilos Avalible", LineAwesomeIcons.balance_scale),
                        SizedBox(width: 25,),
                        CardNum("13", "Rounds", LineAwesomeIcons.history),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                padding: EdgeInsets.only(top: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text("Current Round's Status",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                        ),
                      ),
                    ),
                    Divider(height: 30, thickness: 1,),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                              CircularPercentIndicator(
                                radius: 100.0,
                                lineWidth: 10.0,
                                animation: true,
                                percent: 0.75,
                                center: new Text(
                                  "75.0%",
                                  style:
                                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          child: Table(
                            border: TableBorder(
                              top: BorderSide(width: 2.0, color: Colors.grey.shade200),
                              bottom: BorderSide(width: 2.0, color: Colors.grey.shade200),
                              verticalInside: BorderSide(width: 2.0, color: Colors.grey.shade200),
                              horizontalInside: BorderSide(width: 2.0, color: Colors.grey.shade200),
                            ),
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
                                    child: Row(
                                      children: [
                                        Text("Amount: ", style: TextStyle(color: Colors.green, fontSize: 16),),
                                        Text("29kg", style: TextStyle(fontSize: 16),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
                                    child: Row(
                                      children: [
                                        Text("Earnings: ", style: TextStyle(color: Colors.green, fontSize: 16),),
                                        Text("13.8\$", style: TextStyle(fontSize: 16),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
                                    child: Row(
                                      children: [
                                        Text("from: ", style: TextStyle(color: Colors.green, fontSize: 16),),
                                        Text("18/6/2020", style: TextStyle(fontSize: 16),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
                                    child: Row(
                                      children: [
                                        Text("to: ", style: TextStyle(color: Colors.green, fontSize: 16),),
                                        Text("23/7/2020", style: TextStyle(fontSize: 16),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LinearPercentIndicator(
                                      width: 220.0,
                                      lineHeight: 8.0,
                                      percent: 0.75,
                                      progressColor: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(height: 13,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        child: Icon(Icons.airport_shuttle, color: Colors.white,),
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(width: 5, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      child: Icon(Icons.autorenew, color: Colors.white,),
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(width: 5, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      child: Icon(Icons.account_balance_wallet, color: Colors.white,),
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(width: 5, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
//            Container(
//              color: Colors.white,
//              padding: const EdgeInsets.all(40),
//              child: ListView(
//                children: [
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: [
////            FutureBuilder(
////              future: roundsAPI.getAllRounds(),
////              builder: (context, AsyncSnapshot asyncSnap){
////                switch(asyncSnap.connectionState){
////                  case ConnectionState.waiting:
////                  case ConnectionState.active:
////                    return _dataLoading();
////                    break;
////                  case ConnectionState.done:
////                    List<DataRow> result = List<DataRow>();
////                    if(asyncSnap.hasData) {
////                      List<Round> rounds = asyncSnap.data;
////                      for(Round round in rounds){
////                        result.add(_drawRound(round.kg, round.diff));
////                      }
////                      return SingleChildScrollView(
////                        child: DataTable(
////                          columns: [
////                            DataColumn(label: Text("Amount")),
////                            DataColumn(label: Text("Data")),
////                          ],
////                          rows: result,
////                        ),
////                      );
////                    }else{
////                      return _noneData();
////                    }
////                    break;
////                  case ConnectionState.none:
////                    return _noneData();
////                    break;
////                }
////                return null;
////              }
////            ),
//                      // TODO: Create This page as look like the design.
//
//                      Column(
//                        children: [
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              CardNum("13", "Rounds"),
//                              SizedBox(width: 10,),
//                              CardNum("3245", "Kilos Avilable"),
//                            ],
//                          ),
//                          SizedBox(height: 10,),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              CardNum("97.4\$", "Earnings"),
//                              SizedBox(width: 10,),
//                              CardNum("192\$", "Balance"),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
          ],
        )
    );
  }
  Widget _dataLoading(){
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _noneData(){
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Text("لا يوجد بيانات لعرضها"),
      ),
    );
  }

  DataRow _drawRound(String kg, double diff){
    return DataRow(
      cells: [
          DataCell(Text(kg)),
          DataCell(
              LinearPercentIndicator(
                width: 100.0,
                lineHeight: 15.0,
                percent: diff,
                center: Text((diff*100).round().toString()+"%"),
                progressColor: (diff*100).round() == 100 ? Colors.green : Colors.lightGreenAccent,
              )
          ),
        ],
    );
  }

  Container CardNum(String topNum, String disc, IconData cardIcon){
    return Container(
      child: Stack(
        children: [
          Positioned(
              child: Icon(cardIcon, size: 170.0, color: Colors.green.shade50),
              right: -50,
              top: -15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 15,),
                  Wrap(
                    children: [
                      BorderedText(
                        strokeWidth: 10,
                          strokeColor: Colors.white,
                          child: Text(topNum, style: TextStyle(fontSize: 70 - topNum.length * 5.0, fontWeight: FontWeight.bold, color: Colors.green),)
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Wrap(
                    children: [
                      Text(disc, style: TextStyle(fontSize: 22, color: Colors.black38),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,)
            ],
          ),
        ],
      ),
      height: 130,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 30,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
