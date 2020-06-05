import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';
import 'package:instagramxflutter/screen/home_page/widgets/sotry.dart';
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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: headerBar(context),
              pinned: true,
              expandedHeight: screenSize.height * 0.185,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: screenSize.height * 0.01),
                background: Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.08),
                  width: screenSize.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: DataStory.dataStory.length,
                    itemBuilder: (context, i) {
                      return dataStory(
                          context, DataStory.dataStory[i]['image']);
                    },
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(DataFeet.dataFeet
                  .map((item) => datafeet(context, item))
                  .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
