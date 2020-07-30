import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ProfilePhotoPlain extends StatelessWidget {
  ProfilePhotoPlain();

  final double buttonCurve = 16.0;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();
    
    final double size = scaler.getHeight(3);

    return ButtonTheme(
      buttonColor: Color.fromARGB(0, 0, 0, 0),
      height: size,
      minWidth: size,
      child: RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.all(0.0),
        splashColor: Color.fromARGB(0, 255, 255, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonCurve)),
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/dp.png'),
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
    );
  }
}