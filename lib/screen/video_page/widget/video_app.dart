import 'package:flutter_icons/flutter_icons.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  final dataVideo;

  const VideoApp({
    Key key,
    this.dataVideo,
  }) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.dataVideo)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final deviceRatio = screenSize.width / screenSize.height;
    return SafeArea(
      right: false,
      left: false,
      bottom: false,
      child: Scaffold(
        body: _controller.value.initialized
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Transform.scale(
                        scale: _controller.value.aspectRatio / deviceRatio,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),
                    _controller.value.isPlaying
                        ? SizedBox()
                        : Center(
                            child: Container(
                              width: screenSize.width * 0.15,
                              height: screenSize.width * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(
                                    screenSize.width * 0.02),
                              ),
                              child: Center(
                                child: Icon(
                                  FontAwesome.play,
                                  size: screenSize.width * 0.1,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (mounted) {
      _controller.dispose();
    }
  }
}
