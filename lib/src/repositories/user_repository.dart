import 'dart:convert';
import 'dart:io';

import 'package:final_project/src/shared_preferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  UserPreferences _prefs = UserPreferences();
  String _url = "api.fitbit.com";
  Future<Map<String, dynamic>> getUserData() async{

    final url = Uri.https(this._url, "1/user/-/profile.json");
    final token = this._prefs.token;
    Map<String,dynamic> responseData = {};
    final response = await http.get(url,headers: {
      HttpHeaders.authorizationHeader: "Bearer $token"
    });
    if(response.statusCode == 200){
      responseData = jsonDecode(response.body);
      print("data usuario $responseData");


    }
    print("estado de la peticion ${response.statusCode}");
    
    return responseData;

  }
  
}