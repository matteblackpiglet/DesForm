import 'package:DesForm/services/videoPlayer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:DesForm/heading.dart';
import 'package:DesForm/screens/courseVideos.dart';

// ignore: must_be_immutable
class VideoPage extends StatelessWidget {
  VideoPage({this.video, this.course});

  DocumentSnapshot video, course;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Color(0xffe6e5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: scaler.getHeight(3.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.chevron_left),
                            iconSize: 30.0,
                            color: Theme.of(context).primaryColor,
                            onPressed: () => Navigator.pop(context),
                          ),
                          Text(
                            'Lesson ${video['lesson']}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: scaler.getTextSize(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                      child: FutureBuilder(
                        future: _loadUrl(video['loc']),
                        builder: (context, snapshoT) {
                          if (snapshoT.hasData) {
                            return VidPlayer(
                              url: snapshoT.data.toString(),
                            );
                          }
                          return Container(
                              margin: EdgeInsets.only(top: 30.0),
                              child: CircularProgressIndicator());
                        },
                      ),
                    ),
                    SizedBox(
                      height: scaler.getHeight(0.8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.0),
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: scaler.getWidth(28.0),
                            child: Text(
                              '${video['title']}',
                              style: TextStyle(
                                fontSize: scaler.getTextSize(9.0),
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      child: Text(
                        'This is just random text like.  text just to see how the video player screen actually looks like. is going somehow.. This is just random text just to see how the video player screen we still have work to do..on the player screen itself',
                        style: TextStyle(
                          fontSize: scaler.getTextSize(7.0),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //upcomin course
            StreamBuilder(
              stream: course.reference
                  .collection('videos')
                  .orderBy('lesson')
                  .snapshots(),
              builder: (context, snapshot) {
                // stream to access course vids directory.
                if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) return const Text('');
                int count = 0;
                if(video['lesson']<snapshot.data.documents.length-1){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 20.0),
                          child: Heading(
                            text: 'Upcoming Videos',
                            color: Theme.of(context).primaryColor,
                            weight: FontWeight.w900,
                          ),
                        ),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          // ignore: missing_return
                          itemBuilder: (context, index) {
                            var videO = snapshot.data.documents[index];
                            if (videO['lesson'] > video['lesson'] && count <= 4) {
                              count++;
                              return Stack(children: <Widget>[
                                VideoBar(
                                  video: videO,
                                  course: course,
                                ),
                                ]);
                                } else {
                                  return Container(
                                    width: 0.0,
                                    height: 0.0,
                                  );
                                }
                              },
                            ),
                          ],
                        )
                      );
                      }
                      return Container(height: 0.0, width: 0.0,);
                    },
                  )
                ],
              ),
            )
          );
  }
}

_loadUrl(String loc) async {
  var ref = FirebaseStorage.instance.ref().child(loc);
  return await ref.getDownloadURL();
}
