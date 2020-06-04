import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';
import 'package:instagramxflutter/screen/profile_page/widgets/all_header_widgets.dart';
import 'package:instagramxflutter/widgets/bottomBar.dart';
import './profile_page_view_model.dart';

class ProfilePageView extends ProfilePageViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xff3d3d3d),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xff3d3d3d),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: screenSize.height * 0.2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            descProfile(context),
                            imageProfile(context)
                          ],
                        ),
                      ),
                      statsProfile(context),
                      Container(
                        margin: EdgeInsets.only(top: screenSize.height * 0.009),
                        width: screenSize.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            followButton(context),
                            SizedBox(width: screenSize.width * 0.05),
                            messageButton(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: DataStory.dataStory
                          .map(
                            (item) => Container(
                              width: screenSize.width * 0.07,
                              height: screenSize.width * 0.07,
                              margin: EdgeInsets.symmetric(
                                  vertical: screenSize.width * 0.004,
                                  horizontal: screenSize.width * 0.004),
                              child: Image.asset(
                                item['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  child: bottomBar(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
