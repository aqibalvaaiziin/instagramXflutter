import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import './post_image_page.dart';

abstract class PostImagePageViewModel extends State<PostImagePage> {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });
        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      } else {
        print("Camera is not available");
      }
    }).catchError((err) {
      print(err.toString());
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);
    controller.addListener(() {
      if (mounted) setState(() {});

      if (controller.value.hasError)
        print("camera error ${controller.value.errorDescription}");
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e.toString());
    }

    if (mounted) setState(() {});
  }
}
