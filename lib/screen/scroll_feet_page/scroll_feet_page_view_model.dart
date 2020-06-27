import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import './scroll_feet_page.dart';

abstract class ScrollFeetPageViewModel extends State<ScrollFeetPage> {
  bool isfav = false;
  bool isbooked = false;
  List allImageData = List();
  PreferencesData preferencesData = PreferencesData();
  Map selectedItem = Map();

  getAllImage() {
    allImageData.clear();
    ProviderImage.getAllImage().then((res) {
      List jsonObject = res.data;
      if (mounted) {
        setState(() {
          selectedItem = jsonObject.singleWhere((item) {
            return item['_id'] == widget.id;
          });
          allImageData = jsonObject
              .where((item) => item['_id'] != selectedItem['_id'])
              .toList();
          allImageData.insert(0, selectedItem);
        });
      }
    }).catchError((e) => print(e.toString()));
  }

  void getProfileImage() {
    allImageData.clear();
    preferencesData.getUsername().then((username) {
      ProviderImage.getProfileImage(username).then((res) {
        List jsonObject = res.data;
        if (mounted) {
          setState(() {
            selectedItem = jsonObject.singleWhere((item) {
              return item['_id'] == widget.id;
            });
            allImageData = jsonObject
                .where((item) => item['_id'] != selectedItem['_id'])
                .toList();
            allImageData.insert(0, selectedItem);
          });
        }
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
