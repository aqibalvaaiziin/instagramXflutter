import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import './post_image_page_view_model.dart';

class PostImagePageView extends PostImagePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cameraPreviewWidget()
    );
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
}
