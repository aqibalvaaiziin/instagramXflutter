import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';
import 'package:instagramxflutter/screen/detail_feet/detail_feet.dart';
import 'package:instagramxflutter/screen/profile_page/widgets/all_header_widgets.dart';
import 'package:instagramxflutter/screen/profile_page/widgets/grid_data.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
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
        left: false,
        right: false,
        child: NotificationListener<ScrollUpdateNotification>(
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverAppBar(
                title: dataTitle(context, dataOffset > screenSize.height * 0.2),
                pinned: true,
                expandedHeight: screenSize.height * 0.43,
                flexibleSpace: FlexibleSpaceBar(
                  background: headerControl(context),
                ),
              ),
              SliverGrid.count(
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                crossAxisCount: 3,
                children: DataFeet.dataFeet
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
                        child: dataFeet(context, item),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          onNotification: (notification) {
            setState(() {
              dataOffset = notification.metrics.pixels;
            });
          },
        ),
      ),
    );
  }
}
