import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class AnimationPlayerDataManager {
  bool inAnimation = false;
  final FlickManager flickManager;
  final List items;
  int currentIndex = 0;
  Timer videoChangeTimer;

  AnimationPlayerDataManager(this.flickManager, this.items);

  playNextVideo([Duration duration]) {
    String nextVideoUrl = items[currentIndex + 1]['videoLink'];

    if (currentIndex != items.length - 1) {
      if (duration != null) {
        videoChangeTimer = Timer(duration, () {
          currentIndex++;
        });
      } else {
        currentIndex++;
      }

      flickManager.handleChangeVideo(
          VideoPlayerController.network(nextVideoUrl),
          videoChangeDuration: duration, timerCancelCallback: (bool playNext) {
        videoChangeTimer.cancel();
        if (playNext) {
          currentIndex++;
        }
      });
    }
  }

  playPreviousVideo([Duration duration]) {
    if (currentIndex > 0) {
      String prevVideo = items[currentIndex - 1]['videoLink'];

      if (currentIndex != items.length) {
        if (duration != null) {
          videoChangeTimer = Timer(duration, () {
            currentIndex--;
          });
        } else {
          currentIndex--;
        }

        flickManager.handleChangeVideo(VideoPlayerController.network(prevVideo),
            videoChangeDuration: duration,
            timerCancelCallback: (bool playNext) {
          videoChangeTimer.cancel();
          if (playNext) {
            currentIndex--;
          }
        });
      }
    }
  }
}
