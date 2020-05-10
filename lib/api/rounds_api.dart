import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart';
import 'dart:convert';
import '../utils/api_utils.dart';


class Round{
  String kg, created_at;
  Round(this.kg, this.created_at);
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
      var users = jsonDecode(response.body)["data"];
      for(var round in users){
        Round round_api = Round(
            round["kg"].toString(),
            round["created_at"].toString()
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