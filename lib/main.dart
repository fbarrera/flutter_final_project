import 'package:final_project/src/pages/login_page.dart';
import 'package:final_project/src/shared_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userPrefs = UserPreferences();
  await userPrefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        fontFamily: 'Poppins'
      ),
      home: LoginPage(),
    );
  }
}
