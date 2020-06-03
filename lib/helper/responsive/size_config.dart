import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double dataWidth;
  static double dataHeight;
  static double pixelRatio;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    pixelRatio = _mediaQueryData.devicePixelRatio;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    if (pixelRatio == 1.5) {
      dataWidth = screenWidth / 100;
      dataHeight = screenHeight / 90;
    } else if (pixelRatio == 2.0) {
      if (screenWidth == 414.0) {
        dataWidth = screenWidth / 80;
        dataHeight = screenHeight / 70;
      } else if (screenWidth == 375) {
        dataWidth = screenWidth / 80;
        dataHeight = screenHeight / 90;
      }
    } else if (pixelRatio == 3.0) {
      dataWidth = screenWidth / 80;
      dataHeight = screenHeight / 62;
    } else if (pixelRatio == 4.0) {
      dataWidth = screenWidth / 105;
      dataHeight = screenHeight / 100;
    }
  }
}
