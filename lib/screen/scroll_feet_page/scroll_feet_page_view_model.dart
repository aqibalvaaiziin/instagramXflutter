import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import './scroll_feet_page.dart';

abstract class ScrollFeetPageViewModel extends State<ScrollFeetPage> {
  bool isfav = false;
  bool isbooked = false;
  List allImageData = [];

  getSelectedImage() {
    allImageData.clear();
    ProviderImage.getOneImage(widget.id).then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      setState(() {
        for (var item in jsonObject) {
          setState(() {
            allImageData.add(item);
          });
        }
      });
    });
  }

  getAllImage() {
    ProviderImage.getAllImage().then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      setState(() {
        for (var item in jsonObject) {
          setState(() {
            allImageData.add(item);
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getSelectedImage();
    getAllImage();
  }
}
