import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import './profile_page.dart';

abstract class ProfilePageViewModel extends State<ProfilePage> {
  ScrollController scrollController = ScrollController();
  double dataOffset = 0.0;
  List dataImageProfile = [];
  PreferencesData preferencesData = PreferencesData();
  String username;

  void getProfile() {
    preferencesData.getUsername().then((username) {
      ProviderImage.getProfileImage(username).then((value) {
        var jsonObject = jsonDecode(jsonEncode(value.data));
        for (var i = 0; i < jsonObject.length; i++) {
          setState(() {
            dataImageProfile.add(jsonObject[i]);
          });
        }
      });
    });
  }

  void getOtherProfile() {
    ProviderImage.getProfileImage(widget.username).then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      for (var i = 0; i < jsonObject.length; i++) {
        setState(() {
          dataImageProfile.add(jsonObject[i]);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.isMe) {
      getProfile();
    } else {
      getOtherProfile();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
