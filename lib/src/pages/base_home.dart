import 'package:final_project/src/pages/home_page.dart';
import 'package:final_project/src/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
class BaseHomePage extends StatefulWidget {
  BaseHomePage({Key? key}) : super(key: key);

  @override
  _BaseHomePageState createState() => _BaseHomePageState();
}

class _BaseHomePageState extends State<BaseHomePage> {
  int _currentIndex = 0;
  static const _widgetOptions = [
    HomePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items:<BottomNavyBarItem> [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Inicio'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
            inactiveColor: Colors.grey
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
            activeColor: Colors.blueAccent,
            textAlign: TextAlign.center,
            inactiveColor: Colors.grey
          ),
        ],
      ),
      body: _widgetOptions[_currentIndex]
    );
  }
}