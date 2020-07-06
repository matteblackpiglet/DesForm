import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SmallButton extends StatelessWidget {
  SmallButton({this.text});

  final double buttonCurve = 6.0;
  final String text;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();
    
    final double height = scaler.getHeight(1.8);
    final double width = scaler.getWidth(8.0);
    final double fontSize = scaler.getTextSize(6.5);

    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 40.0, 10.0),
      child: ButtonTheme(
        buttonColor: Colors.grey[300],
        height: height,
        minWidth: width,
        child: RaisedButton(
          onPressed: () {},
          padding: EdgeInsets.all(0.0),
          splashColor: Colors.grey[200],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonCurve)),
          elevation: 4.0,
          animationDuration: Duration(milliseconds: 200),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: fontSize,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}