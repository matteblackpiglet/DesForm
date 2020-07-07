import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({this.textInside});

  final String textInside;
  final double curve = 16.0;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return Container(
      padding: EdgeInsets.only(top: 3.0),
      child: SizedBox(
        height: scaler.getHeight(3.0),
        child: TextField(
          style: TextStyle(
            color: Colors.grey[900],
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            fillColor: Theme.of(context).accentColor,
            filled: true,
            hintStyle: TextStyle(
              color: Colors.grey[700],
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(curve)),
            hintText: textInside,
            suffixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}