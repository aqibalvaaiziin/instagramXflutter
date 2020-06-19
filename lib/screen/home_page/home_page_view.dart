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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.2,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: screenSize.width * 0.18,
                              height: screenSize.width * 0.18,
                              child: Stack(
                                alignment: Alignment(0, 0),
                                children: <Widget>[
                                  Container(
                                    width: screenSize.width * 0.172,
                                    height: screenSize.width * 0.172,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: screenSize.width * 0.16,
                                    height: screenSize.width * 0.16,
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff1c1c1c),
                                    ),
                                  ),
                                  Container(
                                    width: screenSize.width * 0.14,
                                    height: screenSize.width * 0.14,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/person.png"),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: screenSize.width * 0.06,
                                      height: screenSize.width * 0.06,
                                      child: Stack(
                                        alignment: Alignment(0, 0),
                                        children: <Widget>[
                                          Container(
                                            width: screenSize.width * 0.05,
                                            height: screenSize.width * 0.05,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            width: screenSize.width * 0.04,
                                            height: screenSize.width * 0.04,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  size: screenSize.width * 0.04,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: Colors.transparent,
                                    heroTag: "btn add story",
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.004),
                            Container(
                              width: screenSize.width * 0.19,
                              child: Center(
                                child: Text(
                                  "Add new",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: screenSize.width * 0.03),
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
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
                    ],
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
