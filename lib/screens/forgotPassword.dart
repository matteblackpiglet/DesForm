import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff2f2ea6),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.chevron_left),
                    color: Color(0xffffffff),
                    iconSize: scaler.getWidth(3.0),
                  ),
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Montserrat',
                      fontSize: scaler.getTextSize(8.5),
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: scaler.getHeight(32.16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: TextField(
                          controller: editController,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter email',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: scaler.getHeight(1.0),
                      ),
                      RaisedButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'Reset password',
                            style: TextStyle(
                                fontFamily: 'Montserrat', color: Colors.white),
                          ),
                          color: Theme.of(context).primaryColorLight,
                          onPressed: () {
                            resetPassword(context);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      Fluttertoast.showToast(
        msg: "Enter valid email",
      );
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
        msg: "Reset password link has been sent to your mail.");
    Navigator.pop(context);
  }
}
