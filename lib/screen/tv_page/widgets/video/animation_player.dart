import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:instagramxflutter/providers/provider_video.dart';
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
  static FlickManager flickManager;
  AnimationPlayerDataManager dataManager;
  static List items = List();
  bool _pauseOnTap = true;
  bool isSlideDown = true;

  int selectedIndex = 0;
  VideoPlayerController data;
  static String name;
  static String caption;
  static String avatar;
  static int likes;
  static int comment;
  bool condition = items.length == 0 &&
      name == null &&
      flickManager == null &&
      caption == null &&
      avatar == null &&
      likes == null &&
      comment == null;

  getVideo() {
    ProviderVideo.getAllVideo().then((res) {
      List jsonObnject = res.data;
      for (var item in jsonObnject) {
        setState(() {
          items.add(item);
        });
      }
    });
  }

  dataValue() {
    setState(() {
      name = items[selectedIndex]['user']['name'];
      caption = items[selectedIndex]['caption'];
      avatar = items[selectedIndex]['user']['image'];
      likes = items[selectedIndex]['like'];
      comment = items[selectedIndex]['comment'];
    });
  }

  dataValueNext() {
    setState(() {
      selectedIndex++;
      isSlideDown = false;
      name = items[selectedIndex]['user']['name'];
      caption = items[selectedIndex]['caption'];
      avatar = items[selectedIndex]['user']['image'];
      likes = items[selectedIndex]['like'];
      comment = items[selectedIndex]['comment'];
    });
  }

  dataValuePrev() {
    setState(() {
      selectedIndex--;
      isSlideDown = true;
      name = items[selectedIndex]['user']['name'];
      caption = items[selectedIndex]['caption'];
      avatar = items[selectedIndex]['user']['image'];
      likes = items[selectedIndex]['like'];
      comment = items[selectedIndex]['comment'];
    });
  }

  @override
  void initState() {
    getVideo();
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      data = VideoPlayerController.network(items[0]['videoLink']);
      flickManager = FlickManager(
        videoPlayerController: data,
        onVideoEnd: () => dataManager.playNextVideo(
          Duration(milliseconds: 1500),
        ),
      );
      dataValue();
      dataManager = AnimationPlayerDataManager(flickManager, items);
    });
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return !condition
        ? VisibilityDetector(
            key: ObjectKey(items[selectedIndex]['_id']),
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
                        flickVideoWithControls:
                            AnimationPlayerPortraitVideoControls(
                          dataManager: dataManager,
                          pauseOnTap: _pauseOnTap,
                          isSlide: isSlideDown,
                        ),
                        flickVideoWithControlsFullscreen:
                            FlickVideoWithControls(
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
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
