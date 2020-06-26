import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagramxflutter/screen/profile_page/widgets/all_header_widgets.dart';
import 'package:instagramxflutter/screen/profile_page/widgets/grid_data.dart';
import 'package:instagramxflutter/screen/scroll_feet_page/scroll_feet_page.dart';
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
          child: dataImageProfile.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: widget.isMe ? false : true,
                      title: widget.isMe
                          ? dataTitle(
                              context,
                              dataOffset > screenSize.height * 0.2,
                              dataImageProfile[0],
                            )
                          : SizedBox(),
                      pinned: true,
                      expandedHeight: !widget.isMe
                          ? screenSize.height * 0.43
                          : screenSize.height * 0.378,
                      flexibleSpace: FlexibleSpaceBar(
                          background: headerControl(
                              context, dataImageProfile[0], widget.isMe)),
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
                                          ScrollFeetPage(
                                              id: item['_id'], from: "profile"),
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
