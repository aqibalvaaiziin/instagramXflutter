import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/responsive/size_config.dart';
import 'package:instagramxflutter/screen/home_page/widgets/sotry.dart';
import './home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.03,
                        vertical: screenSize.height * 0.01,
                      ),
                      color: Color(0xff3d3d3d),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Instagram",
                              style: TextStyle(
                                fontSize: screenSize.width * 0.06,
                                fontFamily: "vegan",
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.live_tv),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: dataStory(context),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: Container(
                child: datafeet(context),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}
