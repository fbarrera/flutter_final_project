import 'package:final_project/src/widgets/curve_painter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      verticalDirection: VerticalDirection.up,
      children: [_backgroundInfo()],
    ));
  }

  Widget _backgroundInfo() {
    return Container(
      width: double.infinity,
      height: 400,
      // decoration: BoxDecoration(
      //   color: Colors.red,
      //   borderRadius: BorderRadius.vertical(
      //     top: Radius.elliptical(200, 100)
      //   )
      // ),
      child: CustomPaint(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '112',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'bpm',
              style: TextStyle(
                  color: Colors.white30,
                  fontSize: 60,
                  fontWeight: FontWeight.w100),
            )
          ],
        ),
        painter: CurvePainter(),
      ),
    );
  }
}
