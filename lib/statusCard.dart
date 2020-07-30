import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({this.text,this.count});

  final String text, count;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();

    return Container(
      height: scaler.getHeight(4.0),
      width: scaler.getWidth(18.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(80, 60, 60, 60),
                    blurRadius: 16.0, 
                    spreadRadius: 2.0, 
                  ),
                ]
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxWidth: scaler.getWidth(8.0),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: scaler.getTextSize(7.0),
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            Text(
              count,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: scaler.getTextSize(10.0),
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ]
        ),
      ),
    );
  }
}