import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/feet_page/feet_page.dart';
import 'package:instagramxflutter/screen/home_page/home_page.dart';
import 'package:instagramxflutter/screen/profile_page/profile_page.dart';
import 'package:instagramxflutter/widgets/bottomBar.dart';

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            FeetPage(), 
            HomePage(),
            HomePage(), 
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: bottomBar(context),
      ),
    );
  }
}
