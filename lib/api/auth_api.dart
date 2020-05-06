import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI {

  Future<bool> isUserExist(String email, String password) async {
    String url = HOME + TOKEN;
    var response = await http.post(url, headers: {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'},
    body: {'email': email, 'password': password});
    if(response.statusCode == 200){
      try {
        var token = jsonDecode(response.body)["data"]["token"];
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', token);
        sharedPreferences.setBool('isLoggedIn', true);
        return true;
      }catch(e){
        return false;
      }
    }
    return false;
  }


}