import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import './home_page.dart';
import 'package:collection/collection.dart';

abstract class HomePageViewModel extends State<HomePage> {
  bool isfav = false;
  bool isbooked = false;
  Function equals = const ListEquality().equals;
  bool contains = false;
  List dataImage = [];

  getImageContentByFollowing() {
    ProviderImage.getDataImageByFollow().then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      setState(() {
        for (var i = 0; i < jsonObject.length; i++) {
          setState(() {
            dataImage.add(jsonObject[i]);
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getImageContentByFollowing();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
