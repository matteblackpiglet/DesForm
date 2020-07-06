import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'models/courseModel.dart';

class CourseCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return Container(
      height: scaler.getHeight(15.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          Course course = courses[index];
          return Container(
            margin: EdgeInsets.fromLTRB(8.0, 10.0, 0.0, 10.0),
            width: scaler.getWidth(19.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  bottom: scaler.getHeight(0.6),
                  child: Container(
                    height: scaler.getHeight(7.0),
                    width: scaler.getWidth(18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            course.duration,
                            style: TextStyle(
                              fontSize: scaler.getTextSize(8.0),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            course.difficulty,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: scaler.getTextSize(6.0),
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
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
                      Container(
                        padding: EdgeInsets.all(scaler.getHeight(1.4)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            height: scaler.getHeight(5.8),
                            width: scaler.getHeight(5.8),
                            image: AssetImage(course.imgUrl),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        left: scaler.getWidth(1.4),
                        bottom: scaler.getHeight(0.4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              course.name,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: scaler.getTextSize(8.4),
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
        },
      ),
    );
  }
}