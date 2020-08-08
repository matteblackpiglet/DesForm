import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

// video player widget
class VidPlayer extends StatefulWidget {
  VidPlayer({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _VidPlayerState createState() => _VidPlayerState();
}

class _VidPlayerState extends State<VidPlayer> {
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;

  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,

      // showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Color(0xff4241a6),
        handleColor: Color(0xff2f2ea6),
        bufferedColor: Colors.grey[500],
        backgroundColor: Color(0xffe6e5f5),
      ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
