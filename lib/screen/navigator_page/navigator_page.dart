import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/screen/feet_page/feet_page.dart';
import 'package:instagramxflutter/screen/home_page/home_page.dart';
import 'package:instagramxflutter/screen/profile_page/profile_page.dart';
import 'package:instagramxflutter/screen/tv_page/tv_page.dart';
import 'package:instagramxflutter/widgets/bottomBar.dart';
import 'package:instagramxflutter/widgets/post_page.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
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
            TvPage(),
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
