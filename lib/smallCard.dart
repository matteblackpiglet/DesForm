import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:uiPractice/screens/courseVideos.dart';
import 'models/courseModel.dart';

class SCCard extends StatelessWidget {
  const SCCard({this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();
    
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      width: scaler.getWidth(14.0),
      height: scaler.getHeight(10.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: scaler.getHeight(0),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute(course.code));
              },
              splashColor: Color.fromARGB(0, 0, 0, 0),
              child: Container(
                height: scaler.getHeight(5.6),
                width: scaler.getWidth(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).accentColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        course.duration,
                        style: TextStyle(
                          fontSize: scaler.getTextSize(7.0),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        course.description,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: scaler.getTextSize(5.8),
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColor
                ]
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 8.0),
                  blurRadius: 12.0,
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute(course.code));
                    },
                    child: Container(
                      height: scaler.getHeight(4.6),
                      width: scaler.getWidth(8.0),
                      child: Image(
                        image: AssetImage(course.imgUrl),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: scaler.getWidth(1.0),
                  bottom: scaler.getHeight(0.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        course.name,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: scaler.getTextSize(6.4),
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute(String c) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CourseVideos(courseCode: c),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}