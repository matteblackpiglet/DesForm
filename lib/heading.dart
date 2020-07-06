import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class Heading extends StatelessWidget {
  const Heading({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    final double fontSize = scaler.getTextSize(8.2);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: fontSize,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,
            letterSpacing: -0.6,
          ),
        ),
      ),
    );
  }
}