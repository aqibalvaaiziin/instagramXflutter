import 'package:flutter/material.dart';
import 'package:instagramxflutter/widgets/player_video.dart';
import 'package:video_player/video_player.dart';
import './post_video_page_view_model.dart';

class PostVideoPageView extends PostVideoPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlayerVideo(
          video: VideoPlayerController.file(widget.dataVideo),
        ),
      ),
    );
  }
}
