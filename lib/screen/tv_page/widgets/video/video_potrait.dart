import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/tv_page/widgets/video/video_control.dart';

import 'package:provider/provider.dart';

class AnimationPlayerPortraitVideoControls extends StatelessWidget {
  const AnimationPlayerPortraitVideoControls({
    Key key,
    this.pauseOnTap,
    this.dataManager,
    this.isSlide,
  }) : super(key: key);
  final bool pauseOnTap;
  final AnimationPlayerDataManager dataManager;
  final bool isSlide;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    FlickVideoManager flickVideoManager =
        Provider.of<FlickVideoManager>(context);

    return Container(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          Animation<Offset> animationOffset;
          Animation<Offset> inAnimation =
              Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                  .animate(animation);
          Animation<Offset> outAnimation =
              Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
                  .animate(animation);

          animationOffset =
              child.key == ObjectKey(flickVideoManager.videoPlayerController) ||
                      isSlide
                  ? inAnimation
                  : outAnimation;

          return SlideTransition(
            position: animationOffset,
            child: child,
          );
        },
        child: Container(
          key: ObjectKey(
            flickVideoManager.videoPlayerController,
          ),
          child: FlickVideoWithControls(
            willVideoPlayerControllerChange: false,
            playerLoadingFallback: Center(
              child: CircularProgressIndicator(),
            ),
            controls: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.02,
                  vertical: screenSize.height * 0.01),
              child: IconTheme(
                data: IconThemeData(
                    color: Colors.white, size: screenSize.width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: pauseOnTap
                          ? FlickTogglePlayAction(
                              child: FlickSeekVideoAction(
                                child: Center(child: FlickVideoBuffer()),
                              ),
                            )
                          : FlickToggleSoundAction(
                              child: FlickSeekVideoAction(
                                child: Center(child: FlickVideoBuffer()),
                              ),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlickAutoHideChild(
                          autoHide: false,
                          showIfVideoNotInitialized: false,
                          child: FlickSoundToggle(),
                        ),
                        SizedBox(width: 10),
                        FlickAutoHideChild(
                          autoHide: false,
                          showIfVideoNotInitialized: false,
                          child: FlickFullScreenToggle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
