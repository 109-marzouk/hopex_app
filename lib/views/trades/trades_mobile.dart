import 'package:flutter/material.dart';
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
    return Expanded(
        child: FutureBuilder(
          future: roundsAPI.getAllRounds(),
          builder: (context, AsyncSnapshot asyncSnap){
            switch(asyncSnap.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.active:
                return _dataLoading();
                break;
              case ConnectionState.done:
                List<DataRow> result = List<DataRow>();
                if(asyncSnap.hasData) {
                  List<Round> rounds = asyncSnap.data;
                  for(Round round in rounds){
                    result.add(_drawRound(round.kg, round.created_at));
                  }
                  return SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text("الكمية")),
                        DataColumn(label: Text("التاريخ")),
                      ],
                      rows: result,
                    ),
                  );
                }else{
                  return _noneData();
                }
                break;
              case ConnectionState.none:
                return _noneData();
                break;
            }
            return null;
          }
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

  DataRow _drawRound(String kg, String created_at){
    return DataRow(
      cells: [
          DataCell(Text(kg)),
          DataCell(Text(created_at)),
        ],
    );
  }
}
