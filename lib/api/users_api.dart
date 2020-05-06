import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_api.dart';
import '../utils/api_utils.dart';
class UsersAPI {
  Future<List<UserAPI>> getAllUsers() async{
    String url = HOME + ALL_USERS;
    var response = await http.get(url);
    List<UserAPI> data_result = List<UserAPI>();
    if(response.statusCode == 200){
      var users = jsonDecode(response.body)["data"];
      for(var user in users){
        UserAPI user_api = UserAPI(
          user["id"].toString(),
          user["first_name"].toString(),
          user["last_name"].toString(),
          user["email"].toString(),
          user["isEmailActivated"].toString(),
          user["balance"].toString(),
          user["earnings"].toString(),
          user["kg_available"].toString(),
        );
        data_result.add(user_api);
      }
    }
    return data_result;
  }
}