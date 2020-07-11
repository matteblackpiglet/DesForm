import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../models/courseModel.dart';
import '../heading.dart';
import '../smallCard.dart';

class AllCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Heading(
                  text: 'All Courses',
                  color: Theme.of(context).primaryColor,
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
      ),
    );
  }
}