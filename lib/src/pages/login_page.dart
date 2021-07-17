import 'package:final_project/src/common/navigation_methods.dart';
import 'package:final_project/src/pages/base_home.dart';
import 'package:final_project/src/repositories/auth_repository.dart';
import 'package:final_project/src/shared_preferences/user_preferences.dart';
import 'package:final_project/src/widgets/buttom_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  AuthRepository _authRepository = AuthRepository();
  UserPreferences _prefs = UserPreferences();
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getLogo(),
            SizedBox(
              height: 40,
            ),
            Text(
              'Heart Rate',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'Conoce el estado de tu corazon, con hear rate te alerta sobre anomalias en tu ritmo cardiaco',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ButtomWidget(
              text: 'Enlaza tu reloj',
              onPresed: () async {
                if (_prefs.token.isNotEmpty) {
                  pushAndreplaceTopage(context, BaseHomePage());
                } else {
                  final data = await _authRepository.login();
                  if (data) {
                    pushAndreplaceTopage(context, BaseHomePage());
                  }
                }
              },
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getLogo() {
    return Container(
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
