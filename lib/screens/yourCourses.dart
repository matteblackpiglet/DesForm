import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../models/courseModel.dart';
import '../models/profileModel.dart';
import '../heading.dart';
import '../smallCard.dart';

// ignore: must_be_immutable
class YourCourses extends StatelessWidget {
  Profile p;
  List<Course> filteredCourses = [];

  YourCourses({this.p});

  void _filterCourses(){
    for(int i=0; i<courses.length; i++){
      if(p.courses.contains(courses[i].code))
        filteredCourses.add(courses[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();
    _filterCourses();

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
                  text: 'Your Courses',
                  color: Theme.of(context).primaryColor,
                  weight: FontWeight.w900,
                  fontSize: scaler.getTextSize(9.0),
                ),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                primary: false,
                shrinkWrap: true,
                itemCount: filteredCourses.length,
                itemBuilder: (context, index){
                  Course course = filteredCourses[index];
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