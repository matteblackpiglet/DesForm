import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  ScreenScaler scaler = new ScreenScaler();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: scaler.getWidth(100.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff36367d),
              Color(0xff2f2ea6),
              Color(0xff5555b7),
              Color(0xff4d4db3),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(50.0, 160.0, 175.0, 0.0),
              child: Text(
                'DesForm',
                style: TextStyle(
                  fontSize: scaler.getTextSize(10.6),
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Container(
              child: Text(
                'Live to Create',
                style: TextStyle(
                  fontSize: scaler.getTextSize(7.0),
                  color: Colors.white,
                  letterSpacing: -0.5,
                  fontFamily: 'Montserrat',
                ),
              ),
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 195.0, 5.0),
            ),
            Container(
              height: scaler.getHeight(16.0),
              width: scaler.getWidth(30.0),
              margin: EdgeInsets.only(
                top: 20.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 20.0),
                        blurRadius: 15.0),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, -15.0),
                        blurRadius: 10.0),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(left: 14.0, top: 40.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xff5555b7),
                          ),
                          hintText: "Email",
                          filled: true,
                          fillColor: Color(0xffe6e5f5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scaler.getHeight(1.0),
                    ),
                    Container(
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff5555b7),
                          ),
                          hintText: "Password",
                          prefixStyle: TextStyle(
                            color: Color(0xff5555b7),
                            fontFamily: 'Montserrat',
                          ),
                          filled: true,
                          fillColor: Color(0xffe6e5f5),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: scaler.getHeight(0.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xff2f2ea6),
                                fontFamily: 'Montserrat',
                                fontSize: scaler.getTextSize(7.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scaler.getHeight(1.2),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        color: Color(0xffff2f2ea6),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
