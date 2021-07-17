import 'package:flutter/material.dart';

void pushAndreplaceTopage(BuildContext context, page){
  final route =  MaterialPageRoute(
    builder: (context) => page
  );
  Navigator.pushReplacement(context, route);
}

void pushTopage(BuildContext context, page){
  final route =  MaterialPageRoute(
    builder: (context) => page
  );
  Navigator.push(context, route);
}