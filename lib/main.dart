import 'package:flutter/material.dart';
import 'services/authentication.dart';
import 'screens/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Color(0xff2f2ea6),
          primaryColorLight: Color(0xff4241a6),
          accentColor: Color(0xffe6e5f5),
          scaffoldBackgroundColor: Color(0xffffffff),
        ),
        home: new RootPage(auth: new Auth()));
  }
}