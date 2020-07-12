import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

// ignore: must_be_immutable
class Heading extends StatelessWidget {
  Heading({this.text, this.color, this.weight, this.fontSize});

  var fontSize;
  final String text;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    if(fontSize == null){
      fontSize = scaler.getTextSize(8.2);
    }

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