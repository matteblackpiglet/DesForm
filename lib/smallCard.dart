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

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 170.0,
          width: 170.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColor
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute(course));
            },
            child: Container(
              height: 130.0,
              width: 130.0,
              child: FutureBuilder(
                future: _loadUrl(course['image']),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image(
                      image: NetworkImage(snapshot.data),
                      fit: BoxFit.contain,
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
          bottom: 35.0,
          left: 40.0,
          child: Text(
            course['name'],
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: scaler.getTextSize(8.4),
              fontWeight: FontWeight.w700,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}

_loadUrl(String loc) async {
  var ref = FirebaseStorage.instance.ref().child(loc);
  return (await ref.getDownloadURL()).toString();
}

Route _createRoute(DocumentSnapshot c) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        CourseVideos(course: c),
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
