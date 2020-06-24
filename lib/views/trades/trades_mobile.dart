import 'dart:math';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hopex_progx/utils/api_utils.dart';
import 'package:hopex_progx/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
//import '../../api/rounds_api.dart';


class TradesMobile extends StatefulWidget {
  @override
  _TradesMobileState createState() => _TradesMobileState();
}

class _TradesMobileState extends State<TradesMobile> {

  Container test = Container();

  @override
  Widget build(BuildContext context) {
    //RoundsAPI roundsAPI = RoundsAPI();
    return Expanded(
        child: Column(
          children: [
            Container(
              height: 263,
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
                  Container(
                    margin: EdgeInsets.only(bottom: 20, left: 30, right: 30, top: 50),
                    padding: EdgeInsets.only(top: 20, bottom: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade300, width: 1),
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
                        Divider(height: 25, thickness: 1,),
                        _drawRound(true, 0, "Gold", "01/06/2020", "01/06/2021"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                        padding: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 0), // changes position of shadow
                            ),
                          ],
                          border: Border.all(color: Colors.grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text("Round's History",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Divider(height: 0, thickness: 1,),
                            Column(
                              children: [
                                _drawRound(false, 1, "Silver", "01/03/2020", "01/06/2020"),
                                _drawRound(false, 2, "Bronze", "01/02/2020", "01/03/2020"),
                                _drawRound(false, 3, "Bronze", "01/01/2020", "01/02/2020"),
                                _drawRound(false, 4, "Gold", "01/01/2019", "01/01/2020"),
                                _drawRound(false, 5, "Bronze", "01/12/2019", "01/01/2020"),
                              ],
                            ),
//                            FutureBuilder(
//                              future: roundsAPI.getAllRounds(),
//                              builder: (context, AsyncSnapshot asyncSnap){
//                                switch(asyncSnap.connectionState){
//                                  case ConnectionState.waiting:
//                                  case ConnectionState.active:
//                                    return _dataLoading();
//                                    break;
//                                  case ConnectionState.none:
//                                    return _noneData();
//                                    break;
//                                  case ConnectionState.done:
//                                    List<Container> result = List<Container>();
//                                    if(asyncSnap.hasData) {
//                                      List<Round> rounds = asyncSnap.data;
//                                      int roundCount = 1;
//                                      for(Round round in rounds){
//                                        String from = round.from.substring(0, round.from.toString().indexOf(" "));
//                                        String to = round.to.substring(0, round.to.toString().indexOf(" "));
//                                        if(round.isDone == 1) {
//                                          result.add(_drawRound(roundCount, round.kg, from, to));
//                                          roundCount++;
//                                        }else{
////                                          setState(() {
////                                            test = _drawRound(roundCount, round.kg, from, to);
////                                          });
//                                        }
//                                      }
//                                      return rounds.length > 0 ? Column(
//                                        children: result,
//                                      ) : _noneData();
//                                    }
//                                    break;
//                                }
//                                return _noneData();
//                              },
//
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
//  Widget _dataLoading(){
//    return Container(
//      padding: EdgeInsets.only(top: 20, bottom: 20),
//      child: Center(
//        child: CircularProgressIndicator(),
//      ),
//    );
//  }
//
//  Widget _noneData(){
//    return Container(
//      padding: EdgeInsets.only(top: 20, bottom: 20),
//      child: Center(
//        child: Text("No Rounds found!"),
//      ),
//    );
//  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  Container _drawRound(bool isCurrent, int id, String plan, String from, String to){
    double earnings = 0;
    switch(plan){
      case "Bronze":
        earnings = BRONZE_EARNINGS;
        break;
      case "Silver":
        earnings = SILVER_EARNINGS;
        break;
      case "Gold":
        earnings = GOLD_EARNINGS;
        break;
      default:
        break;
    }
    earnings = roundDouble(earnings, 2);
    return Container(
      child: Column(
        children: [
          isCurrent ? Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LinearPercentIndicator(
                            width: 220.0,
                            lineHeight: 8.0,
                            percent: 0.01,
                            progressColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Icon(Icons.business, color: Colors.white,),
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
                              color: Colors.grey,
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
              SizedBox(height: 10,),
            ],
          ) : Container(),
          !isCurrent ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(id.toString()),
          ) : Container(),
          Container(
            child: Table(
              border: TableBorder(
                top: BorderSide(width: 2.0, color: Colors.grey.shade200),
                verticalInside: BorderSide(width: 2.0, color: Colors.grey.shade200),
                horizontalInside: BorderSide(width: 2.0, color: Colors.grey.shade200),
                bottom: BorderSide(width: 2.0, color: Colors.grey.shade200),
              ),
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
                      child: Row(
                        children: [
                          Text("Plan Type: ", style: TextStyle(color: Colors.green, fontSize: 16),),
                          Text(plan, style: TextStyle(fontSize: 16),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
                      child: Row(
                        children: [
                          Text("Earnings: ", style: TextStyle(color: Colors.green, fontSize: 16),),
                          Text("$earnings" + "LE", style: TextStyle(fontSize: 16),)
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
                          Text(from, style: TextStyle(fontSize: 16),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
                      child: Row(
                        children: [
                          Text("to: ", style: TextStyle(color: Colors.green, fontSize: 16),),
                          Text(to, style: TextStyle(fontSize: 16),)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
