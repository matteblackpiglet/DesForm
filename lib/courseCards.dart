import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'card.dart';
import 'package:DesForm/services/authentication.dart';

// ignore: must_be_immutable
class CourseCards extends StatelessWidget {
  final bool all;

  CourseCards({this.all});

  var count = 0;
  final int limit = 3;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return Container(
      height: scaler.getHeight(15.0),
      child: StreamBuilder(
        stream: Firestore.instance.collection('courses').orderBy('code').snapshots(),
        // ignore: missing_return
        builder: (context, snapshot){ // stream containing course details.
          try{
          if(!snapshot.hasData)
            return const Text('');
          
          return StreamBuilder(
            stream: Firestore.instance.collection('users').where('email', isEqualTo: emailAdd).snapshots(),
            // ignore: missing_return
            builder: (context, snapshoT){ // stream containing user details.
              if(snapshoT.hasData){
                var user = snapshoT.data.documents[0];
                return  ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.documents.length,
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    var course = snapshot.data.documents[index];
                    try{
                      if(all == true && count<limit){
                        count++;
                        return CCard(course: course);
                      }
                      // return only cards containing courses the user has subscribed to.
                      else if(user['courses'].contains(course['code'].toString()) && count<limit){ 
                        count++;
                        return CCard(course: course);
                      }
                      else{
                        return Container(width: 0, height: 0);
                      }
                    }catch(e){}
                  },
                );
              }
              return Container(height: 0.0, width: 0.0,);
            },
          );
          } catch(e){}
        },
      )
      
    );
  }
}