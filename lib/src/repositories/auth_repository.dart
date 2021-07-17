import 'package:final_project/src/common/constants.dart';
import 'package:final_project/src/shared_preferences/user_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class AuthRepository {
  UserPreferences _prefs = UserPreferences();
  Future<bool> login() async {
    bool response = false;
    final url = getFitbitUrl();
    final callBackUrlScheme = "https://francisforte.cl/callback/";
    try {
      final result = await FlutterWebAuth.authenticate(
          url: url, callbackUrlScheme: callBackUrlScheme);
      final urlParsed = result.replaceFirst("#", "?");
      final String token =
          Uri.parse(urlParsed).queryParameters['access_token'].toString();
      final String userId =
          Uri.parse(urlParsed).queryParameters['user_id'].toString();
      _prefs.token = token;
      _prefs.userId = userId;
      response = true;
      print(_prefs);
    } on PlatformException catch (e) {
      print(e);
    }
    return response;
  }
}
