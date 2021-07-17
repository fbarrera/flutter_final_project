import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter{
  @override 
  void paint(Canvas canvas, Size size){
    var paint = Paint(); //Lapiz
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 15;

    var path = Path(); 
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width / 2, size.height * 0, size.width, size.height * 0.30);
    path.lineTo(size.width, size.height);


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}