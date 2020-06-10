import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:instagramxflutter/widgets/video_widget/component_video.dart';
import 'package:instagramxflutter/widgets/video_widget/custom_progress_bar.dart';
import 'package:video_player/video_player.dart';

class ChewieItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final String name;
  final String caption;
  final String avatar;
  final int likes;
  final int comment;

  const ChewieItem(
      {Key key,
      this.videoPlayerController,
      this.name,
      this.caption,
      this.avatar,
      this.likes,
      this.comment})
      : super(key: key);

  @override
  _ChewieItemState createState() => _ChewieItemState();
}

class _ChewieItemState extends State<ChewieItem> {
  ChewieController _chewieController;
  bool isPlay = true;
  double dataValue = 0;
  double totalValue = 60;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: true,
      aspectRatio: 11.5 / 23.63,
      showControls: false,
      autoInitialize: true,
      showControlsOnInitialize: false,
      looping: true,
      errorBuilder: (context, errorMessage) => Center(
        child: Text(
          errorMessage,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (isPlay == false) {
        timer.isActive;
      } else {
        setState(() {
          dataValue++;
        });
      }
      if (dataValue > totalValue) {
        setState(() {
          dataValue = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
        if (isPlay)
          widget.videoPlayerController.play();
        else
          widget.videoPlayerController.pause();
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Chewie(
                controller: _chewieController,
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomProgressBar(
                width: screenSize.width,
                value: dataValue,
                totalValue: totalValue,
              ),
            ),
            Positioned(
              bottom: screenSize.height * 0.03,
              left: screenSize.width * 0.05,
              child: dataText(context, widget.name, widget.caption),
            ),
            Positioned(
              bottom: screenSize.height * 0.13,
              right: screenSize.width * 0.02,
              child: buttonControl(
                  context, widget.avatar, widget.likes, widget.comment),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    isPlay = true;
    _chewieController.pause();
    widget.videoPlayerController.pause();
  }
}
