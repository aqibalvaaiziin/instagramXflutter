import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/time_and_view_string.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';
import 'package:instagramxflutter/screen/profile_page/profile_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import 'package:social_share/social_share.dart';

cardHeader(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(routeTo(ProfilePage(
              username: data['user']['username'],
              isMe: false,
            )));
          },
          child: Container(
            padding: EdgeInsets.only(
              left: screenSize.width * 0.03,
              top: screenSize.height * 0.02,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: screenSize.width * 0.12,
                  height: screenSize.width * 0.12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          data['user']['image'],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.02),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['user']['name'],
                        style: TextStyle(
                          fontSize: screenSize.width * 0.04,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ), 
                      Text(
                        "${HelperString.getTimeSinceUpload(data['createdAt'])} ago",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.03,
                          color: Colors.grey[600],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            right: screenSize.width * 0.03,
            top: screenSize.height * 0.02,
          ),
          child: IconButton(
            icon: CustomIcon.iconMore(
              size: screenSize.width * 0.055,
              color: Colors.black,
            ),
            onPressed: () {
              SocialShare.shareWhatsapp("${data['imageLink']}")
                  .then((data) {
                print(data);
              });
            },
          ),
        ),
      ],
    ),
  );
}

imageCard(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: screenSize.width * 0.03,
      vertical: screenSize.width * 0.02,
    ),
    width: screenSize.width,
    height: screenSize.height * 0.487,
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(screenSize.width * 0.02)),
      child: Image.network(
        data['imageLink'],
        fit: BoxFit.cover,
      ),
    ),
  );
}
