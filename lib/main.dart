import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'services/authentication.dart';
import 'screens/root_page.dart';
import 'screens/home.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: Color(0xff2f2ea6),
      primaryColorLight: Color(0xff4241a6),
      accentColor: Color(0xffe6e5f5),
      scaffoldBackgroundColor: Color(0xffffffff),
    ),
    home: MyApp(),
    routes: {
      '/home' : (context) => new Home(),
    }
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: AfterSplash(),
      image: new Image.asset('assets/images/logo.png'),
      backgroundColor: Colors.white,
      photoSize: 150.0
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RootPage(auth: new Auth());
  }
}