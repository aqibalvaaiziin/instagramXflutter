import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/dataJson_video.dart';
import 'package:instagramxflutter/widgets/video_widget/video_item.dart';
import './tv_page_view_model.dart';
import 'package:video_player/video_player.dart';

class TvPageView extends TvPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: DataVideo.dataVideo.length,
        itemBuilder: (context, i) {
          return ChewieItem(
            videoPlayerController: VideoPlayerController.asset(
              DataVideo.dataVideo[i]['video'],
            ),
            avatar: DataVideo.dataVideo[i]['avatar'],
            name: DataVideo.dataVideo[i]['name'],
            caption: DataVideo.dataVideo[i]['caption'],
            comment: DataVideo.dataVideo[i]['comment'],
            likes: DataVideo.dataVideo[i]['likes'],
          );
        },
      ),
    );
  }
}
