import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'card.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class CourseCards extends StatelessWidget {
  final bool all;
  bool feat;

  CourseCards({this.all, this.feat});

  var count = 0;
  final int limit = 3;
  FirebaseUser user;
  String userEmail;

  _loadUser() async{
    user = await FirebaseAuth.instance.currentUser();
    userEmail = user.email;
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();
    _loadUser();

    return Container(
      alignment: Alignment.centerLeft,
      height: scaler.getHeight(15.0),
      child: StreamBuilder(
        stream: Firestore.instance.collection('courses').orderBy('code').snapshots(),
        // ignore: missing_return
        builder: (context, snapshot){ // stream containing course details.
          try{
            if(!snapshot.hasData)
              return Container(height: 0.0, width: 0.0,);
            return StreamBuilder(
              stream: Firestore.instance.collection('featured').snapshots(),
              builder: (context, snap){
                if(snap.hasData && snap.connectionState != ConnectionState.waiting){
                  var fc =  snap.data.documents[0];
                  return StreamBuilder(
                    stream: Firestore.instance.collection('users').where('email', isEqualTo: userEmail).snapshots(),
                    // ignore: missing_return
                    builder: (context, snapshoT){
                      // stream containing user details.
                      if(snapshoT.hasData && snapshoT.connectionState != ConnectionState.waiting){
                        var user = snapshoT.data.documents[0];
                        return  ListView.builder(
                          shrinkWrap: false,
                          cacheExtent: 2000.0,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.documents.length,
                          // ignore: missing_return
                          itemBuilder: (context, index) {
                            var course = snapshot.data.documents[index];
                            try{
                              if(feat == true && fc['list'].contains(course['code']) && count<=limit){
                                count++;
                                return CCard(course: course);
                              }
                              else if(all == true && count<limit){
                                count++;
                                return CCard(course: course);
                              }
                              // return only cards containing courses the user has subscribed to.
                              else if(feat == false && user['courses'].contains(course['code'].toString()) && count<limit){ 
                                count++;
                                return CCard(course: course);
                              }
                              else{
                                return Container(width: 0, height: 0);
                              }
                            }catch(e){
                              return Container(height: 0.0, width: 0.0,);
                            }
                          },
                        );
                      }
                      return Container(height: 0.0, width: 0.0,);
                    },
                  );
                }
                return Container(height: 0.0, width: 0.0,);
              }
            );
          } catch(e){
            return Container(height: 0.0, width: 0.0,);
          }
        },
      )
      
    );
  }
}