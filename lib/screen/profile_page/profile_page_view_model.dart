import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import 'package:instagramxflutter/providers/provider_user.dart';
import './profile_page.dart';

abstract class ProfilePageViewModel extends State<ProfilePage> {
  ScrollController scrollController = ScrollController();
  double dataOffset = 0.0;
  List dataImageProfile = [];
  List dataProfile = [];

  void getImageProfile() {
    ProviderImage.getLoginProfileImage().then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      for (var i = 0; i < jsonObject.length; i++) {
        setState(() {
          dataImageProfile.add(jsonObject[i]);
        });
      }
    });
  }

  void getProfile() {
    ProviderUser.getUserLoginProfile().then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      setState(() {
        dataProfile.add(jsonObject);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getImageProfile();
    getProfile();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
