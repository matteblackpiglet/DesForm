import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../models/profileModel.dart';
import '../heading.dart';
import '../profilePhotoPlain.dart';
import '../statusCard.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double mainCurve = 25.0;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor
                  ]),
            ),
            child: SafeArea(
              child: SizedBox(
                height: scaler.getHeight(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.chevron_left),
                      iconSize: 30.0,
                      color: Theme.of(context).accentColor,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30.0, bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ProfilePhotoPlain(
                              url:
                                  profile.profileUrl),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child: Heading(
                              text: profile.name,
                              color: Color(0xffffffff),
                              weight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        StatusCard(
                          text: 'Ongoing Courses',
                          count: profile.ongoingCourses,
                        ),
                        StatusCard(
                          text: 'Courses Finished',
                          count: profile.completedCourses,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(mainCurve),
                      topRight: Radius.circular(mainCurve)),
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 25.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'ABOUT',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: scaler.getTextSize(8.0)),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(children: <Widget>[
                              Tag(
                                title: 'Name:',
                                value: profile.name,
                              ),
                              Tag(
                                title: 'User ID:',
                                value: profile.username,
                              ),
                              Tag(
                                title: 'DOB:',
                                value: profile.dob,
                              ),
                              Tag(
                                title: 'Sex:',
                                value: profile.gender,
                              ),
                              Tag(
                                title: 'Email:',
                                value: profile.email,
                              ),
                            ]),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.exit_to_app),
                            iconSize: 40.0,
                            color: Theme.of(context).primaryColorLight,
                            onPressed: () {},
                          ),
                          Text(
                            'Sign Out',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -1.0,
                              fontSize: scaler.getTextSize(8.0)),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({this.title, this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();

    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: scaler.getWidth(8.0),
            child: Heading(
              text: title,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            width: scaler.getWidth(19.0),
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: scaler.getTextSize(8.0)),
            ),
          ),
        ],
      ),
    );
  }
}
