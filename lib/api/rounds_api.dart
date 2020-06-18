import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart';
import 'dart:convert';
import '../utils/api_utils.dart';


class Round{
  String kg; double diff;
  Round(this.kg, this.diff);
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
    if(response.statusCode == 201){
      var users = jsonDecode(response.body)["data"];
      for(var round in users){
        var dateTimeCreatedAt = DateFormat("yyyy-MM-dd HH:mm:ss").parse(round["created_at"], true);
        var dateLocal = dateTimeCreatedAt.toLocal();
        DateTime dateTimeNow = DateTime.now();
        int differenceInSeconds = dateTimeNow.difference(dateLocal).inSeconds;
        Round round_api = Round(
            round["kg"].toString(),
            differenceInSeconds < ROUND_DURATION_IN_SECONDES ? differenceInSeconds / ROUND_DURATION_IN_SECONDES : 1.0
        );
        data_result.add(round_api);
      }
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