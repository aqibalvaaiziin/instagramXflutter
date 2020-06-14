import 'package:flutter/material.dart';
import './post_image_page_view_model.dart';

class PostImagePageView extends PostImagePageViewModel {
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
