import 'package:flutter/material.dart';
import 'package:instagramxflutter/providers/provider_video.dart';
import './video_page.dart';

abstract class VideoPageViewModel extends State<VideoPage> {
  List dataVideo = List();
  PageController controller = PageController(initialPage: 0);

  getAllVideo() {
    ProviderVideo.getAllVideo().then((res) {
      List jsonObject = res.data;
      for (var item in jsonObject) {
        setState(() {
          dataVideo.add(item);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getAllVideo();
  }
}