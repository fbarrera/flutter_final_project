import 'package:final_project/src/repositories/user_repository.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserRepository _userRepository = UserRepository();
    
    return Scaffold(body: FutureBuilder(
      future: _userRepository.getUserData(),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> data) {
        if(!data.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final userData = data.data!['user'];
        return Container(
            child: Center(
          child: Text("Hola ${userData['fullName']}"),
        ));
      },
    ));
  }
}
