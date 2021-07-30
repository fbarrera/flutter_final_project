import 'package:final_project/src/repositories/user_repository.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserRepository _userRepository = UserRepository();

    return Scaffold(
        body: FutureBuilder(
      future: _userRepository.getUserData(),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> data) {
        if (!data.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final userData = data.data!['user'];
        return Container(
          width: double.infinity,
          child: Center(
            child: Profiler(context, userData),
          ),
        );
      },
    ));
  }

  Widget Profiler(BuildContext context, dynamic data) {
    String gender(String data) {
      Map<String, String> dictionary = {
        "MALE": "Masculino",
        "FEMALE": "Femenino",
      };
      return dictionary[data] ?? '';
    }

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              CircleAvatar(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    data['avatar'].toString(),
                  ),
                  radius: 55,
                ),
                backgroundColor: Colors.grey,
                //maxRadius: 60,
                radius: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${data['fullName']}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              ProfilerData(
                context,
                'Edad',
                data['age'].toString(),
              ),
              ProfilerData(
                context,
                'Género',
                gender(
                  data['gender'],
                ),
              ),
              ProfilerData(
                context,
                'Altura',
                data['height'].toString() + ' [cm]',
              ),
              ProfilerData(
                context,
                'Peso',
                data['weight'].toString() + ' [kg]',
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget ProfilerData(
      BuildContext context, String fieldName, String fieldData) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              fieldName,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              fieldData,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
