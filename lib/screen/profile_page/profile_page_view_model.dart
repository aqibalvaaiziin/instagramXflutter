import 'package:flutter/material.dart';
import './profile_page.dart';

abstract class ProfilePageViewModel extends State<ProfilePage> {
  ScrollController scrollController = ScrollController();
  double dataOffset = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
