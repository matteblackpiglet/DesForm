import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../heading.dart';
import '../smallButton.dart';
import '../profilePhoto.dart';
import '../searchBar.dart';
import '../courseCards.dart';

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

class HomePage extends StatelessWidget {
  final double mainCurve = 25.0;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

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
                        ProfilePhoto(
                            url:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM--hVamcJhFyQcqARua0LV9c-opvPKdxCZw&usqp=CAU'),
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
                Heading(
                  text: 'Your Courses',
                ),
                SmallButton(
                  text: 'See All',
                ),
              ],
            ),
            CourseCards(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Heading(
                  text: 'All Courses',
                ),
                SmallButton(
                  text: 'See All',
                ),
              ],
            ),
            CourseCards(),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}