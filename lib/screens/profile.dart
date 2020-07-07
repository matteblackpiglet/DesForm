import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../heading.dart';
import '../profilePhotoPlain.dart';
import '../statusCard.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);

        if(!currentFocus.hasPrimaryFocus)
          currentFocus.unfocus();
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
      body: SingleChildScrollView(
        child: Column(
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
                  ]
                ),
              ),
              child: SafeArea(
                child: SizedBox(
                  height: scaler.getHeight(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 30.0, bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ProfilePhotoPlain(
                              url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM--hVamcJhFyQcqARua0LV9c-opvPKdxCZw&usqp=CAU'
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.0),
                              child: Heading(
                                text: 'X Æ A-12',
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
                            count: '3',
                          ),
                          StatusCard(
                            text: 'Courses Finished',
                            count: '1',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(mainCurve), topRight: Radius.circular(mainCurve)),
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 25.0, 
                    spreadRadius: 1.0, 
                  ),
                ]
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: scaler.getHeight(24.7),
                    child: Container(
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
                              fontSize: scaler.getTextSize(8.0)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              children: <Widget>[
                                Tag(
                                  title: 'Name:',
                                  value: 'X Æ A-12',
                                ),
                                Tag(
                                  title: 'User ID:',
                                  value: 'xaea12',
                                ),
                                Tag(
                                  title: 'DOB:',
                                  value: '12-2-1994',
                                ),
                                Tag(
                                  title: 'Sex:',
                                  value: 'Male',
                                ),
                                Tag(
                                  title: 'Email:',
                                  value: 'XÆA12@gmail.com',
                                ),
                              ]
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                fontSize: scaler.getTextSize(8.0)
              ),
            ),
          ),
        ],
      ),
    );
  }
}