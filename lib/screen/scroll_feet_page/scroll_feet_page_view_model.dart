import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import './scroll_feet_page.dart';

abstract class ScrollFeetPageViewModel extends State<ScrollFeetPage> {
  bool isfav = false;
  bool isbooked = false;
  List allImageData = [];
  PreferencesData preferencesData = PreferencesData();

  getAllImage() {
    allImageData.clear();
    ProviderImage.getOneImage(widget.id).then((value) {
      var jsonObject2 = jsonDecode(jsonEncode(value.data));
      for (var item in jsonObject2) {
        setState(() {
          allImageData.add(item);
        });
      }
    });

    ProviderImage.getAllImage().then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          for (var i = 0; i < jsonObject.length; i++) {
            allImageData.add(jsonObject[i]);
            allImageData.remove(widget.id == jsonObject[i]['_id']);
          }
        });
      });
    });
  }

  void getProfileImage() {
    allImageData.clear();
    ProviderImage.getOneImage(widget.id).then((value) {
      var jsonObject2 = jsonDecode(jsonEncode(value.data));
      for (var item in jsonObject2) {
        setState(() {
          allImageData.add(item);
          allImageData.toSet().toList();
        });
      }
    });

    preferencesData.getUsername().then((username) {
      ProviderImage.getProfileImage(username).then((value) {
        var jsonObject = jsonDecode(jsonEncode(value.data));
        Future.delayed(Duration(milliseconds: 100), () {
          for (var item in jsonObject) {
            setState(() {
              allImageData.add(item);
              allImageData.toSet().toList();
            });
          }
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.from == "profile") {
      getProfileImage();
    } else {
      getAllImage();
    }
  }
}
