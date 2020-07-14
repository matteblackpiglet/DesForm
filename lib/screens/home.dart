import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../models/profileModel.dart';
import '../heading.dart';
import '../smallButton.dart';
import '../profilePhoto.dart';
import '../searchBar.dart';
import '../courseCards.dart';
import '../services/authentication.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double mainCurve = 25.0;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    signOut() async {
      try {
        await widget.auth.signOut();
        widget.logoutCallback();
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(mainCurve),
                  bottomRight: Radius.circular(mainCurve),
                ),
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 25.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: SafeArea(
                child: SizedBox(
                  height: scaler.getHeight(12.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: ProfilePhoto(
                            url: profile.profileUrl,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 36.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'DesForm',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: scaler.getTextSize(10.6),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 2.0,
                                  ),
                                  Text(
                                    'Live to Create',
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: scaler.getTextSize(7.0),
                                      fontFamily: 'Montserrat',
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  ButtonTheme(
                                    buttonColor: Colors.grey[300],
                                    height: 5.0,
                                    minWidth: 7.0,
                                    child: RaisedButton(
                                      onPressed: signOut,
                                      padding: EdgeInsets.all(0.0),
                                      splashColor: Colors.grey[200],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      elevation: 4.0,
                                      animationDuration:
                                          Duration(milliseconds: 200),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Sign Out',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.grey[900],
                                            fontSize: 10.0,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: scaler.getHeight(0.2)),
                              SearchBar(textInside: 'Search Courses'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40.0),
                  child: Heading(
                    text: 'Your Courses',
                    color: Theme.of(context).primaryColor,
                    weight: FontWeight.w900,
                  ),
                ),
                SmallButton(
                  text: 'See All',
                  p: profile,
                ),
              ],
            ),
            CourseCards(all: false, p: profile),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40.0),
                  child: Heading(
                    text: 'All Courses',
                    color: Theme.of(context).primaryColor,
                    weight: FontWeight.w900,
                  ),
                ),
                SmallButton(
                  text: 'See All',
                ),
              ],
            ),
            CourseCards(all: true),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
