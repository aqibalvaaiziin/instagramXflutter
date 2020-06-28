import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagramxflutter/helper/data/time_and_view_string.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';
import 'package:instagramxflutter/screen/detail_feet/detail_feet.dart';
import 'package:instagramxflutter/screen/home_page/widgets/card-component.dart';
import 'package:instagramxflutter/screen/home_page/widgets/sotry.dart';
import 'package:instagramxflutter/widgets/helper_widget.dart';
import 'package:instagramxflutter/widgets/shimmer.dart';
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
        child: dataImage.length > 0
            ? CustomScrollView(
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
                                                  width:
                                                      screenSize.width * 0.05,
                                                  height:
                                                      screenSize.width * 0.05,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      screenSize.width * 0.04,
                                                  height:
                                                      screenSize.width * 0.04,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        size: screenSize.width *
                                                            0.04,
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
                            // Expanded(
                            //   child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     itemCount: DataStory.dataStory.length,
                            //     itemBuilder: (context, i) {
                            //       return dataStory(
                            //         context,
                            //         DataStory.dataStory[i]['image'],
                            //         DataStory.dataStory[i]['name'],
                            //         true,
                            //         DataStory.dataStory[i]['id'],
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  dataImage.length > 0
                      ? SliverList(
                          delegate: SliverChildListDelegate(dataImage
                              .map(
                                (item) => GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      routeTo(
                                        DetailFeet(
                                          id: item['_id'],
                                          name: item['user']['name'],
                                          avatar: item['user']['image'],
                                          time: item['createdAt'],
                                          comments: item['comment'],
                                          likes: item['like'],
                                          image: item['imageLink'],
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
                        )
                      : SliverList(
                          delegate: SliverChildListDelegate([
                          Center(
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  FontAwesome.user_times,
                                  size: screenSize.width * 0.3,
                                ),
                                Text(
                                  "You not have a friend in Instagram",
                                  style: TextStyle(
                                      fontSize: screenSize.width * 0.05),
                                )
                              ],
                            ),
                          )
                        ])),
                ],
              )
            : Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            shimmerStory(context),
                            shimmerStory(context),
                            shimmerStory(context),
                            shimmerStory(context),
                            shimmerStory(context),
                            shimmerStory(context),
                            shimmerStory(context),
                          ],
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Expanded(
                        flex: 8,
                        child: ListView(
                          children: <Widget>[
                            shimmerHome(context),
                            shimmerHome(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget datafeet(BuildContext context, data) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: screenSize.width * 0.06,
        right: screenSize.width * 0.06,
        top: screenSize.width * 0.02,
        bottom: screenSize.width * 0.03,
      ),
      width: screenSize.width,
      height: screenSize.height * 0.63,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(screenSize.width * 0.03),
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: cardHeader(context, data),
          ),
          Expanded(
            flex: 6,
            child: imageCard(context, data),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: screenSize.width * 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: CustomIcon.favourite(
                            statusIcon: isfav,
                            size: screenSize.width * 0.055,
                            statusColor: isfav,
                          ),
                          onTap: () {
                            setState(() {
                              isfav = !isfav;
                            });
                          },
                        ),
                        SizedBox(width: screenSize.width * 0.015),
                        Text(
                          HelperString.getViewCount(data['like']).toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.04),
                        CustomIcon.comment(
                          size: screenSize.width * 0.055,
                          color: Colors.black,
                        ),
                        SizedBox(width: screenSize.width * 0.018),
                        Text(
                          data['comment'].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: screenSize.width * 0.05),
                    child: IconButton(
                      icon: CustomIcon.bookmark(
                        color: Colors.black,
                        size: screenSize.width * 0.055,
                        status: isbooked,
                      ),
                      onPressed: () {
                        setState(() {
                          isbooked = !isbooked;
                          if (isbooked) {
                            toastMessage("Feet saved", Colors.grey[600]);
                          } else {
                            toastMessage("Feet unsaved", Colors.grey[600]);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
