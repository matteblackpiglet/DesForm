import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class Heading extends StatelessWidget {
  const Heading({this.text, this.color, this.weight});

  final String text;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    final double fontSize = scaler.getTextSize(8.2);

    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Montserrat',
          fontWeight: weight,
          letterSpacing: -0.6,
        ),
      ),
    );
  }
}