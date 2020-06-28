import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:video_player/video_player.dart';

class PlayerVideo extends StatefulWidget {
  final VideoPlayerController video;
  final isPlaying;

  const PlayerVideo({Key key, this.video, this.isPlaying}) : super(key: key);

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
    if (mounted) {
      flickManager.flickControlManager.pause();
      flickManager.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("post video"),
      onVisibilityChanged: (info) {
        if (widget.isPlaying) {
          print("video jalan");
        } else {
          if (mounted) {
            flickManager.flickControlManager.pause();
          } else {
            flickManager.flickControlManager.play();
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: FlickVideoPlayer(
          flickManager: flickManager,
        ),
      ),
    );
  }
}
