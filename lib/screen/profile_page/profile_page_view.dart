import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
          child: dataProfile.length == 0 && dataImageProfile.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    SliverAppBar(
                      title: dataProfile.length > 0
                          ? dataTitle(
                              context,
                              dataOffset > screenSize.height * 0.2,
                              dataProfile[0])
                          : SizedBox(),
                      pinned: true,
                      expandedHeight: dataProfile[0]['username'] != username
                          ? screenSize.height * 0.43
                          : screenSize.height * 0.37,
                      flexibleSpace: FlexibleSpaceBar(
                        background: dataProfile.length > 0
                            ? headerControl(context, dataProfile[0], username)
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ),
                    dataImageProfile.length > 0
                        ? SliverGrid.count(
                            mainAxisSpacing: 3,
                            crossAxisCount: 3,
                            children: dataImageProfile
                                .map(
                                  (item) => GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        routeTo(
                                          DetailFeet(
                                            id: item['_id'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: dataFeet(context, item),
                                  ),
                                )
                                .toList(),
                          )
                        : SliverList(
                            delegate: SliverChildListDelegate([
                              Container(
                                width: screenSize.width,
                                height: screenSize.height * 0.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesome.camera,
                                      size: screenSize.width * 0.2,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      child: Text(
                                        "No post available",
                                        style: TextStyle(
                                            fontSize: screenSize.width * 0.05),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
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
