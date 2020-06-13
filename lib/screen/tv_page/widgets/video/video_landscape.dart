import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:instagramxflutter/screen/tv_page/widgets/video/video_control.dart';
import 'package:provider/provider.dart';

class AnimationPlayerLandscapeControls extends StatelessWidget {
  const AnimationPlayerLandscapeControls(
      {Key key, @required this.animationPlayerDataManager})
      : super(key: key);

  final AnimationPlayerDataManager animationPlayerDataManager;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    FlickVideoManager flickVideoManager =
        Provider.of<FlickVideoManager>(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.02,
          vertical: screenSize.height * 0.04),
      color: Colors.transparent,
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
        ),
        child: IconTheme(
          data:
              IconThemeData(color: Colors.white, size: screenSize.width * 0.06),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      (animationPlayerDataManager).playPreviousVideo();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.keyboard_arrow_left,
                          size: screenSize.width * 0.04,
                        ),
                        Text(
                          'Previous',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * 0.022,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      (animationPlayerDataManager).playNextVideo();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * 0.022,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: screenSize.width * 0.04,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: FlickShowControlsAction(
                  child: FlickSeekVideoAction(
                    child: Center(
                      child: flickVideoManager.nextVideoAutoPlayTimer != null
                          ? FlickAutoPlayCircularProgress(
                              colors: FlickAutoPlayTimerProgressColors(),
                            )
                          : FlickVideoBuffer(),
                    ),
                  ),
                ),
              ),
              FlickAutoHideChild(
                child: Column(
                  children: <Widget>[
                    FlickVideoProgressBar(
                      flickProgressBarSettings:
                          FlickProgressBarSettings(height: 5),
                    ),
                    Row(
                      children: [
                        FlickPlayToggle(size: 30),
                        SizedBox(
                          width: 10,
                        ),
                        FlickSoundToggle(size: 30),
                        SizedBox(
                          width: 20,
                        ),
                        DefaultTextStyle(
                          style: TextStyle(color: Colors.white54),
                          child: Row(
                            children: <Widget>[
                              FlickCurrentPosition(
                                fontSize: 16,
                              ),
                              Text('/'),
                              FlickTotalDuration(
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        FlickFullScreenToggle(
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
