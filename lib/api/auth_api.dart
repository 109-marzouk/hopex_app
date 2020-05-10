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
        var data = jsonDecode(response.body)["data"];
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['token']);
        sharedPreferences.setBool('isLoggedIn', true);
        sharedPreferences.setInt('userID', data['id']);
        print(data['token']);
        return true;
      }catch(e){
        return false;
      }
    }
    return false;
  }

  Future<bool> isSignedUp(String firstName, String lastName, String email, String password) async {
    String url = HOME + SIGN_UP;
    var response = await http.post(url, headers: {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'first_name': firstName, 'last_name': lastName, 'email': email, 'password': password});
    if(response.statusCode == 200){
      try {
        if(response.body.isEmpty == false)
          {
            var data = jsonDecode(response.body)["data"];
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.setString('token', data['api_token']);
            sharedPreferences.setBool('isLoggedIn', true);
            sharedPreferences.setBool('userID', data['id']);
            return true;
          }
        return false;
      }catch(e){
        return false;
      }
    }
    return false;
  }
}