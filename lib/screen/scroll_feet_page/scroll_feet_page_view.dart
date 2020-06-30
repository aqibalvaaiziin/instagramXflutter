import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/time_and_view_string.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';
import 'package:instagramxflutter/screen/detail_feet/detail_feet.dart';
import 'package:instagramxflutter/screen/home_page/widgets/card-component.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import 'package:instagramxflutter/widgets/shimmer.dart';
import './scroll_feet_page_view_model.dart';

class ScrollFeetPageView extends ScrollFeetPageViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Explore",
            style: TextStyle(
              fontSize: screenSize.width * 0.05,
            ),
          ),
          centerTitle: false,
          primary: false,
        ),
        body: allImageData.length > 0
            ? ListView.builder(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.02,
                ),
                itemCount: allImageData.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      routeTo(
                        DetailFeet(
                          id: allImageData[i]['_id'],
                          name: allImageData[i]['user']['name'],
                          avatar: allImageData[i]['user']['image'],
                          time: allImageData[i]['createdAt'],
                          comments: allImageData[i]['comment'],
                          likes: allImageData[i]['like'],
                          image: allImageData[i]['imageLink'],
                          caption: allImageData[i]['caption'],
                          view: allImageData[i]['view'],
                        ),
                      ),
                    ),
                    child: datafeet(context, allImageData[i]),
                  );
                },
              )
            : ListView(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.02,
                ),
                children: <Widget>[
                  shimmerHome(context),
                  shimmerHome(context),
                ],
              ),
      ),
    );
  }

  Widget datafeet(BuildContext context, data) {
    final screenSize = MediaQuery.of(context).size;
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
              margin: EdgeInsets.only(
                left: screenSize.width * 0.05,
              ),
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
