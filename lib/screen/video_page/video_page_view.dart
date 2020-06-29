import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:instagramxflutter/redux/model/main_state_model.dart';
import 'package:instagramxflutter/screen/video_page/widget/comment_page.dart';
import 'package:instagramxflutter/screen/video_page/widget/video_app.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import './video_page_view_model.dart';

class VideoPageView extends VideoPageViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: StoreConnector<AppState, MainState>(
          converter: (store) => store.state.mainState,
          builder: (context, state) {
            return state.video.length > 0
                ? PageView.builder(
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    itemCount: state.video.length,
                    itemBuilder: (context, i) {
                      return Stack(
                        children: <Widget>[
                          VideoApp(
                            dataVideo: state.video[i]['videoLink'],
                          ),
                          Positioned(
                              bottom: screenSize.height * 0.05,
                              left: screenSize.width * 0.05,
                              child: dataText(
                                  context,
                                  state.video[i]['user']['name'],
                                  state.video[i]['caption'])),
                          Positioned(
                            bottom: screenSize.height * 0.1,
                            right: screenSize.width * 0.05,
                            child: buttonControl(
                              context,
                              state.video[i]['user']['image'],
                              state.video[i]['like'],
                              state.video[i]['comment'],
                              state.video[i]['_id'],
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }

  buttonControl(
      BuildContext context, String avatar, int likes, int comment, idVideo) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.37,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: screenSize.width * 0.15,
            height: screenSize.width * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: screenSize.width * 0.14,
                height: screenSize.width * 0.14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      avatar,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        FontAwesome.heart,
                        size: screenSize.width * 0.08,
                      ),
                      onPressed: () {}),
                  Text(
                    likes.toString(),
                    style: TextStyle(
                      fontSize: screenSize.width * 0.037,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        FontAwesome.commenting,
                        size: screenSize.width * 0.08,
                      ),
                      onPressed: () {
                        if (mounted) {
                          Navigator.of(context).push(
                              routeTo(CommentVideoPage(idVideo: idVideo)));
                        }
                      }),
                  Text(
                    comment.toString(),
                    style: TextStyle(
                      fontSize: screenSize.width * 0.037,
                      fontWeight: FontWeight.w600,
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

  dataText(BuildContext context, String name, String caption) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.76,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              name,
              style: TextStyle(
                fontSize: screenSize.width * 0.04,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.01),
            child: Text(
              caption,
              style: TextStyle(
                fontSize: screenSize.width * 0.035,
                height: screenSize.height * 0.0015,
              ),
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
