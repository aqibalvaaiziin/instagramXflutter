import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/video_page/widget/component_video.dart';
import 'package:instagramxflutter/screen/video_page/widget/video_app.dart';
import './video_page_view_model.dart';

class VideoPageView extends VideoPageViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: dataVideo.length > 0
          ? PageView.builder(
              controller: controller,
              scrollDirection: Axis.vertical,
              itemCount: dataVideo.length,
              itemBuilder: (context, i) {
                return Stack(
                  children: <Widget>[
                    VideoApp(
                      dataVideo: dataVideo[i]['videoLink'],
                    ),
                    Positioned(
                        bottom: screenSize.height * 0.05,
                        left: screenSize.width * 0.05,
                        child: dataText(context, dataVideo[i]['user']['name'],
                            dataVideo[i]['caption'])),
                    Positioned(
                      bottom: screenSize.height * 0.1,
                      right: screenSize.width * 0.05,
                      child: buttonControl(
                        context,
                        dataVideo[i]['user']['image'],
                        dataVideo[i]['like'],
                        dataVideo[i]['comment'],
                      ),
                    ),
                  ],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
