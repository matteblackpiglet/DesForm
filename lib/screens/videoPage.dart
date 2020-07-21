import 'package:DesForm/services/videoPlayer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VideoPage extends StatelessWidget {
  VideoPage({this.video});

  DocumentSnapshot video;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadUrl(video['loc']),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return VidPlayer(
            url: snapshot.data.toString(),
          );
        }
        return const Text('');
      },
    );
  }
}

_loadUrl(String loc) async {
  var ref = FirebaseStorage.instance.ref().child(loc);
  return await ref.getDownloadURL();
}
