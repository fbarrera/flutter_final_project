

import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  final void Function()? onPresed;
  final Color color;
  final Color? texColor;
  final bool shadow;
  final String text;

  const ButtomWidget({
    required this.text,
    required this.onPresed,
    this.color = Colors.white,
    this.texColor,
    this.shadow = false

  });
  @override
  Widget build(BuildContext context) {
    
    final elevatedButtonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 13),
      shadowColor: Colors.blueAccent,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      )
    );
    return ElevatedButton(
      onPressed: this.onPresed,
      child: Text(
        this.text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14
        ),
      ),
      style: elevatedButtonStyle,
    );
  }
}