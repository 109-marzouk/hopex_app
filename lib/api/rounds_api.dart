import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart';
import 'dart:convert';
import '../utils/api_utils.dart';


class Round{
  String kg;
  var from, to; int isDone;
  Round(this.kg, this.from, this.to, this.isDone);
}


class RoundsAPI {

  /*
  *------------------------------------------------
  * Get All User's Roundes depending on his/her id
  *------------------------------------------------
  */
  Future<List<Round>> getAllRounds() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userID = sharedPreferences.getInt('userID');
    String url = HOME + "user/$userID/rounds";

    var response = await http.get(url, headers: {'Accept': 'application/json', HttpHeaders.authorizationHeader: sharedPreferences.getString('token')});
    List<Round> data_result = List<Round>();
    if(response.statusCode == 200){
      var rounds = jsonDecode(response.body)["data"];
      for(var round in rounds){
        var from = DateFormat("yyyy-MM-dd").parse(round["created_at"], true);
        var to = from.add(Duration(days: 35));
        print(from);
        Round round_api = Round(
            round["kg"].toString(),
            from.toString(),
            to.toString(),
            int.parse(round['is_done'])
        );
        data_result.add(round_api);
      }
    }else{
      print(response.statusCode);
    }
    return data_result;
  }


/*
  *------------------------------------------------
  * Add New Round
  *------------------------------------------------
  */
  Future<bool> addRound(int kg) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userID = sharedPreferences.getInt('userID');
    String url = HOME + "user/$userID/create_round";
    var response = await http.post(url, headers: {'Accept': 'application/json',
      "authorization": 'Bearer ' + sharedPreferences.getString('token')},
        body: {'kg': kg.toString()});
    if(response.statusCode == 201) return true;
    return false;

  }

}