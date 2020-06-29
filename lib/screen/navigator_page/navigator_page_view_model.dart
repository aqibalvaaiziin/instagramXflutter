import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import './navigator_page.dart';

abstract class NavigatorPageViewModel extends State<NavigatorPage> {
  String username;
  PreferencesData preferencesData = PreferencesData();

  @override
  void initState() {
    super.initState();
    preferencesData.getUsername().then((value) {
      setState(() {
        username = value;
      });
    });
  }
}
