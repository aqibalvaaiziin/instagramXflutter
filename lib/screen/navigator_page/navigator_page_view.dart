import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/feet_page/feet_page.dart';
import 'package:instagramxflutter/screen/home_page/home_page.dart';
import 'package:instagramxflutter/screen/profile_page/profile_page.dart';
import 'package:instagramxflutter/screen/video_page/video_page.dart';
import 'package:instagramxflutter/widgets/bottomBar.dart';
import 'package:instagramxflutter/widgets/post_page.dart';
import './navigator_page_view_model.dart';

class NavigatorPageView extends NavigatorPageViewModel {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            FeetPage(),
            PostPage(),
            VideoPage(),
            ProfilePage(
              username: username,
              isMe: true,
            ),
          ],
        ),
        bottomNavigationBar: bottomBar(context),
      ),
    );
  }
}
