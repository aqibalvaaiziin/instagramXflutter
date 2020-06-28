import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/control_post_page/control_post_page.dart';
import 'package:instagramxflutter/widgets/player_video.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import 'package:video_player/video_player.dart';
import './post_video_page_view_model.dart';

class PostVideoPageView extends PostVideoPageViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Video"),
        flexibleSpace: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.check,
                  size: screenSize.width * 0.065,
                ),
                onPressed: () {
                  setState(() {
                    dataPlay = false;
                  });
                  Navigator.of(context).push(routeTo(ControlPostPage(
                    dataPost: widget.dataVideo,
                    isImage: false,
                  )));
                },
              ),
            )
          ],
        ),
      ),
      body: Center(
          child: PlayerVideo(
        video: VideoPlayerController.file(widget.dataVideo),
        isPlaying: dataPlay,
      )),
    );
  }
}
