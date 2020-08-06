import 'package:DesForm/screens/login_signup_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../heading.dart';
import '../smallButton.dart';
import '../profilePhoto.dart';
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
  FirebaseUser user;
  String userEmail;

  _loadUser() async {
    user = await FirebaseAuth.instance.currentUser();
    userEmail = user.email;
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    signOut() async {
      try {
        await widget.auth.signOut();
        widget.logoutCallback();
        Navigator.pop(
            context, CustomNavRoute(builder: (context) => LoginSignupPage()));
      } catch (e) {
        print(e);
      }
    }

    _loadUser();

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
                    color: Colors.grey[400],
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: SafeArea(
                child: SizedBox(
                  height: scaler.getHeight(9.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: ProfilePhoto(
                            signOut: signOut,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 36.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                ],
                              ),
                              SizedBox(height: scaler.getHeight(0.2)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder(
                future: Firestore.instance
                    .collection('users')
                    .where('email', isEqualTo: userEmail)
                    .getDocuments(),
                builder: (context, snapshOT) {
                  if (snapshOT.hasData) {
                    return StreamBuilder(
                        stream: Firestore.instance
                            .collection('users')
                            .where('email', isEqualTo: userEmail)
                            .getDocuments()
                            .asStream(),
                        // ignore: missing_return
                        builder: (context, snapshoT) {
                          if (snapshoT.hasData) {
                            var user = snapshoT.data.documents[0];

                            if (user['courses'].length != 0) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      SmallButton(text: 'See All', all: false),
                                      ],
                                    ),
                                    CourseCards(all: false, feat: false),
                                  ],
                                );
                              }
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Theme.of(context).primaryColorLight,
                                        Theme.of(context).primaryColor
                                      ]),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(30.0),
                                margin: EdgeInsets.all(20.0),
                                child: SizedBox(
                                  width: scaler.getWidth(1.0),
                                  height: scaler.getHeight(4.0),
                                  child: AutoSizeText(
                                    'Take your first step in learning.\nSubscribe to a course.',
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: scaler.getTextSize(8.5),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Container(
                              height: 0.0,
                              width: 0.0,
                            );
                          });
                    }
                    return Container(
                      height: 0.0,
                      width: 0.0,
                    );
                  }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    child: Heading(
                      text: 'Featured Courses',
                      color:
                          Theme.of(context).primaryColor,
                      weight: FontWeight.w900,
                    ),
                  ),
                  CourseCards(all: false, feat: true),
                ],
              ),
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
                  SmallButton(text: 'See All', all: true),
                ],
              ),
              CourseCards(all: true,feat: false),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      );
  }
}

class CustomNavRoute<T> extends MaterialPageRoute<T> {
  CustomNavRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return new SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
