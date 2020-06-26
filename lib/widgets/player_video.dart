import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerVideo extends StatefulWidget {
  final VideoPlayerController video;

  const PlayerVideo({Key key, this.video}) : super(key: key);

  @override
  _PlayerVideoState createState() => _PlayerVideoState();
}

class _PlayerVideoState extends State<PlayerVideo> {
  FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: widget.video,
    );
  }

  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: FlickVideoPlayer(
        flickManager: flickManager,
      ),
    );
  }
}
