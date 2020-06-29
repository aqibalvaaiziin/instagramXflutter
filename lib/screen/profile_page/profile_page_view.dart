import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:instagramxflutter/redux/model/main_state_model.dart';
import 'package:instagramxflutter/screen/profile_page/widgets/all_header_widgets.dart';
import 'package:instagramxflutter/screen/profile_page/widgets/grid_data.dart';
import 'package:instagramxflutter/screen/scroll_feet_page/scroll_feet_page.dart';
import 'package:instagramxflutter/widgets/custom_drawer.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import 'package:instagramxflutter/widgets/shimmer.dart';
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
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body: FoldableSidebarBuilder(
          status: drawerStatus,
          drawerBackgroundColor: Color(0xff2c2c2c),
          drawer: CustomDrawer(closeDrawer: () {
            setState(() {
              drawerStatus = FSBStatus.FSB_CLOSE;
            });
          }),
          screenContents: NotificationListener<ScrollUpdateNotification>(
            child: StoreConnector<AppState, MainState>(
              converter: (store) => store.state.mainState,
              builder: (context, state) {
                return state.imageProfile.length == 0
                    ? ListView(
                        children: <Widget>[shimmerProfile(context)],
                      )
                    : CustomScrollView(
                        controller: scrollController,
                        slivers: <Widget>[
                          SliverAppBar(
                            automaticallyImplyLeading:
                                widget.isMe ? false : true,
                            title: widget.isMe && state.imageProfile.length > 0
                                ? dataTitle(
                                    context,
                                    dataOffset > screenSize.height * 0.2,
                                    state.imageProfile[0],
                                  )
                                : SizedBox(),
                            pinned: true,
                            expandedHeight: !widget.isMe
                                ? screenSize.height * 0.43
                                : screenSize.height * 0.378,
                            flexibleSpace: FlexibleSpaceBar(
                                background: state.imageProfile.length > 0
                                    ? headerControl(context,
                                        state.imageProfile[0], widget.isMe)
                                    : SizedBox()),
                          ),
                          state.imageProfile.length > 0
                              ? SliverGrid.count(
                                  mainAxisSpacing: 3,
                                  crossAxisCount: 3,
                                  children: state.imageProfile
                                      .map(
                                        (item) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              routeTo(
                                                ScrollFeetPage(
                                                    id: item['_id'],
                                                    from: "profile"),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                  fontSize:
                                                      screenSize.width * 0.05),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                        ],
                      );
              },
            ),
            onNotification: (notification) {
              setState(() {
                dataOffset = notification.metrics.pixels;
              });
            },
          ),
        ),
      ),
    );
  }

  dataTitle(BuildContext context, bool data, name) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              icon: CustomIcon.iconMore(
                  color: Colors.white, size: screenSize.width * 0.05),
              onPressed: () {
                setState(() {
                  drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                      ? FSBStatus.FSB_CLOSE
                      : FSBStatus.FSB_OPEN;
                });
              },
            ),
          ),
          AnimatedOpacity(
            opacity: data ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Container(
              child: Text(
                data ? name['user']['name'] : "            ",
                style: TextStyle(
                  fontSize: screenSize.width * 0.06,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
