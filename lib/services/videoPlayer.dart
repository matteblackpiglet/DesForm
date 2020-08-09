import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:DesForm/customisedPlugins/flick_video_player-custom/lib/flick_video_player.dart';

// video player widget
class VidPlayer extends StatefulWidget {
  VidPlayer({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _VidPlayerState createState() => _VidPlayerState();
}

class _VidPlayerState extends State<VidPlayer> {
  FlickManager flickManager;

  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager,
        flickVideoWithControls: new FlickVideoWithControls(
          controls: FlickPortraitControls(
            progressBarSettings: FlickProgressBarSettings(
              playedColor: Color(0xff2f2ea6),
              bufferedColor: Colors.grey[400],
              handleColor: Color(0xff4241a6),
              backgroundColor: Color(0xffe6e5f5),
              handleRadius: 4.0
            ),
          ),
          playerErrorFallback: Center(child: Icon(Icons.error, color: Colors.black),),
          textStyle: TextStyle(
            color: Color(0xff2f2ea6),
          ),
          iconThemeData: IconThemeData(
            color: Color(0xff2f2ea6)
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
