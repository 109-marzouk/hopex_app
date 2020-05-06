import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart';
import 'dart:convert';
import '../utils/api_utils.dart';


class Round{
  String kg, created_at;
  Round(this.kg, this.created_at);
}


class RoundsAPI {
  Future<List<Round>> getAllRounds() async {
    String url = "https://hopex.company/api/user/1/rounds";
    var response = await http.get(url, headers: {'Accept': 'application/json', HttpHeaders.authorizationHeader: "4e85ad537adc9e5708a4ea877fda2684c8066a9b7dd2c2d49d76e2c5ab9a"});
    List<Round> data_result = List<Round>();
    print(response.statusCode);
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
}