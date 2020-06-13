import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:instagramxflutter/helper/data/dataJson_video.dart';
import 'package:instagramxflutter/screen/tv_page/widgets/component_video.dart';
import 'package:instagramxflutter/screen/tv_page/widgets/video/video_control.dart';
import 'package:instagramxflutter/screen/tv_page/widgets/video/video_landscape.dart';
import 'package:instagramxflutter/screen/tv_page/widgets/video/video_potrait.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:video_player/video_player.dart';

class AnimationPlayer extends StatefulWidget {
  AnimationPlayer({Key key}) : super(key: key);

  @override
  _AnimationPlayerState createState() => _AnimationPlayerState();
}

class _AnimationPlayerState extends State<AnimationPlayer> {
  FlickManager flickManager;
  AnimationPlayerDataManager dataManager;
  static List items = DataVideo.dataVideo;
  bool _pauseOnTap = true;
  bool isSlideDown = true;
  VideoPlayerController data = VideoPlayerController.network(items[0]['video']);
  int selectedIndex = 0;
  String name;
  String caption;
  String avatar;
  int likes;
  int comment;

  dataValue() {
    setState(() {
      name = items[selectedIndex]['name'];
      caption = items[selectedIndex]['caption'];
      avatar = items[selectedIndex]['avatar'];
      likes = items[selectedIndex]['likes'];
      comment = items[selectedIndex]['comment'];
    });
  }

  dataValueNext() {
    setState(() {
      selectedIndex++;
      isSlideDown = false;
      name = items[selectedIndex]['name'];
      caption = items[selectedIndex]['caption'];
      avatar = items[selectedIndex]['avatar'];
      likes = items[selectedIndex]['likes'];
      comment = items[selectedIndex]['comment'];
    });
  }

  dataValuePrev() {
    setState(() {
      selectedIndex--;
      isSlideDown = true;
      name = items[selectedIndex]['name'];
      caption = items[selectedIndex]['caption'];
      avatar = items[selectedIndex]['avatar'];
      likes = items[selectedIndex]['likes'];
      comment = items[selectedIndex]['comment'];
    });
  }

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: data,
      onVideoEnd: () => dataManager.playNextVideo(
        Duration(milliseconds: 1500),
      ),
    );
    dataValue();
    dataManager = AnimationPlayerDataManager(flickManager, items);
  }

  @override
  void dispose() {
    flickManager.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager.autoResume();
        }
      },
      child: SwipeDetector(
        onSwipeUp: () {
          dataValueNext();
          dataManager.playNextVideo();
        },
        onSwipeDown: () {
          dataValuePrev();
          dataManager.playPreviousVideo();
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                width: screenSize.width,
                height: screenSize.height,
                child: FlickVideoPlayer(
                  flickManager: flickManager,
                  flickVideoWithControls: AnimationPlayerPortraitVideoControls(
                    dataManager: dataManager,
                    pauseOnTap: _pauseOnTap,
                    isSlide: isSlideDown,
                  ),
                  flickVideoWithControlsFullscreen: FlickVideoWithControls(
                    controls: AnimationPlayerLandscapeControls(
                      animationPlayerDataManager: dataManager,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: screenSize.height * 0.03,
                left: screenSize.width * 0.05,
                child: dataText(context, name, caption),
              ),
              Positioned(
                bottom: screenSize.height * 0.13,
                right: screenSize.width * 0.02,
                child: buttonControl(context, avatar, likes, comment),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
