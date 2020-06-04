import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagramxflutter/screen/home_page/widgets/sotry.dart';
import 'package:instagramxflutter/widgets/bottomBar.dart';
import './home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
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
        left: false,
        right: false,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: screenSize.width * 0.03,
                        right: screenSize.width * 0.03,
                        top: screenSize.height * 0.02,
                      ),
                      width: screenSize.width,
                      height: screenSize.height * 0.08,
                      color: Color(0xff3d3d3d),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Instagram",
                              style: TextStyle(
                                fontSize: screenSize.width * 0.05,
                                fontFamily: "vegan",
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.live_tv,
                                    size: screenSize.width * 0.06,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: screenSize.width * 0.06),
                                IconButton(
                                  icon: Icon(
                                    Icons.send,
                                    size: screenSize.width * 0.06,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    Container(
                      width: screenSize.width,
                      height: screenSize.width * 0.19,
                      child: dataStory(context),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 10,
                child: Container(
                  child: datafeet(context),
                )),
            Expanded(
              flex: 1,
              child: bottomBar(context),
            ),
          ],
        ),
      ),
    );
  }
}
