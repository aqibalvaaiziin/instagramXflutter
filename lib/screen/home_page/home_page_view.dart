import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';
import 'package:instagramxflutter/screen/detail_feet/detail_feet.dart';
import 'package:instagramxflutter/screen/home_page/widgets/sotry.dart';
import '../../widgets/route_animation.dart';
import './home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
              expandedHeight: screenSize.height * 0.213,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.08),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: DataStory.dataStory.length,
                    itemBuilder: (context, i) {
                      return dataStory(
                        context,
                        DataStory.dataStory[i]['image'],
                        DataStory.dataStory[i]['name'],
                        true,
                        DataStory.dataStory[i]['id'],
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(DataFeet.dataFeet
                  .map(
                    (item) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          routeTo(
                            DetailFeet(
                              avatar: item['avatar'],
                              name: item['name'],
                              time: item['time'],
                              comments: item['comment'],
                              likes: item['likes'],
                              image: item['image'],
                              caption: item['caption'],
                              view: item['view'],
                            ),
                          ),
                        );
                      },
                      child: datafeet(context, item),
                    ),
                  )
                  .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
