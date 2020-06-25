import 'package:flutter/material.dart';
import './post_image_page_view_model.dart';

class PostImagePageView extends PostImagePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.file(widget.dataImage),
      ),
    );
  }
}
