import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:DesForm/screens/courseVideos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class SCCard extends StatelessWidget {
  SCCard({this.course});

  DocumentSnapshot course;

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
            bottom: scaler.getHeight(0.0),
            child: Container(
              height: scaler.getHeight(5.6),
              width: scaler.getWidth(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).accentColor,
              ),
              child: FlatButton(
                onPressed: (){
                  Navigator.of(context).push(_createRoute(course));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        course['dur'],
                        style: TextStyle(
                          fontSize: scaler.getTextSize(7.0),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        course['desc'],
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
                      Navigator.of(context).push(_createRoute(course));
                    },
                    child: Container(
                      height: scaler.getHeight(4.6),
                      width: scaler.getWidth(8.0),
                      child: FutureBuilder(
                        future: _loadUrl(course['image']),
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return Image(
                              image: NetworkImage(snapshot.data),
                              fit: BoxFit.fitWidth,
                            );
                          }
                          return Center(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
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
                        course['name'],
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

_loadUrl(String loc) async{
  var ref = FirebaseStorage.instance.ref().child(loc);
  return (await ref.getDownloadURL()).toString();
}

Route _createRoute(DocumentSnapshot c) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CourseVideos(course: c),
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