import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({this.url});

  final double buttonCurve = 90.0;
  final String url;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();
    
    final double size = scaler.getHeight(3);

    return Container(
      margin: EdgeInsets.only(right: 25.0),
      child: ButtonTheme(
        buttonColor: Color.fromARGB(0, 0, 0, 0),
        height: size,
        minWidth: size,
        child: RaisedButton(
          onPressed: () {},
          padding: EdgeInsets.all(0.0),
          splashColor: Color.fromARGB(30, 200, 200, 200),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonCurve)),
          animationDuration: Duration(milliseconds: 200),
          child: Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(buttonCurve),
            ),
            child: Container(
              constraints: BoxConstraints(maxHeight: size, minHeight: size, maxWidth: size, minWidth: size),
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}