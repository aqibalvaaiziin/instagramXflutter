import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagramxflutter/screen/video_comment_page/video_comment_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';

buttonControl(BuildContext context, String avatar, int likes, int comment) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    height: screenSize.height * 0.37,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          width: screenSize.width * 0.155,
          height: screenSize.width * 0.155,
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
                  image: AssetImage(
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
                    onPressed: () {
                      print("object");
                    }),
                Text(
                  likes.toString(),
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04,
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
                      Navigator.of(context).push(routeToV(VideoCommentPage()));
                    }),
                Text(
                  comment.toString(),
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04,
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
