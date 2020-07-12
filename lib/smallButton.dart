import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:DesForm/models/profileModel.dart';
import 'package:DesForm/screens/yourCourses.dart';
import 'screens/allCourses.dart';

class SmallButton extends StatelessWidget {
  SmallButton({this.text, this.p});

  final double buttonCurve = 6.0;
  final String text;
  final Profile p;

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
          onPressed: () {
            if(p == null)
              Navigator.of(context).push(_createRoute1());
            else
              Navigator.of(context).push(_createRoute2(p));
          },
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

Route _createRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AllCourses(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute2(Profile pr) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => YourCourses(p: pr),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}