import 'package:flutter/material.dart';
import './post_video_page_view_model.dart';

class PostVideoPageView extends PostVideoPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Image Post Page",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
