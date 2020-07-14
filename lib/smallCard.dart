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
      alignment: Alignment.center,
      child: Container(
        height: scaler.getWidth(14.0),
        width: scaler.getWidth(14.0),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute(course));
                },
                child: Container(
                  height: scaler.getWidth(10.0),
                  width: scaler.getWidth(10.0),
                  child: FutureBuilder(
                    future: _loadUrl(course['image']),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.gif',
                          image: snapshot.data,
                          fit: BoxFit.fitWidth,
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
            ),
            Text(
              course['name'],
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: scaler.getTextSize(7.8),
                fontWeight: FontWeight.w700,
                color: Theme.of(context).accentColor,
              ),
            ),
          ]
        ),
      ),
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
