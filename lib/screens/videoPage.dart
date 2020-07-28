import 'package:DesForm/services/videoPlayer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

// ignore: must_be_immutable
class VideoPage extends StatelessWidget {
  VideoPage({this.video});

  DocumentSnapshot video;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return FutureBuilder(
      future: _loadUrl(video['loc']),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: ListView(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Color(0xffe6e5f5)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: ClipRRect(
                        child: FutureBuilder(
                            future: _loadUrl(video['loc']),
                            builder: (context, snapshoT) {
                              if (snapshoT.hasData) {
                                print(snapshoT.data.toString());
                                return VidPlayer(url: snapshoT.data.toString());
                              }
                              return Container(
                                height: 0.0,
                                width: 0.0,
                              );
                            }),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scaler.getHeight(0.8),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${video['lesson']} ${video['title']}',
                            style: TextStyle(
                              fontSize: scaler.getTextSize(9.0),
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 105.0,
                          ),
                          child: Text(
                            '${video['dur']}',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: scaler.getTextSize(7.0),
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
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
            ]),
          );
        }
        return Container(
          height: 0.0,
          width: 0.0,
        );
      },
    );
  }
}

_loadUrl(String loc) async {
  var ref = FirebaseStorage.instance.ref().child(loc);
  return await ref.getDownloadURL();
}
