import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../models/courseModel.dart';
import '../heading.dart';
import '../smallCard.dart';

class AllCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();
    final double mainCurve = 20.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
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
              child: Heading(
                text: 'All Courses',
                color: Color(0xffffffff),
                weight: FontWeight.w900,
                fontSize: scaler.getTextSize(9.0),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              primary: false,
              shrinkWrap: true,
              itemCount: courses.length,
              itemBuilder: (context, index){
                Course course = courses[index];
                return SCCard(course: course);
              },
            ),
          ],
        ),
      ),
    );
  }
}