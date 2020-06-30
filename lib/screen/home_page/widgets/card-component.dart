import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/dataShare.dart';
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
                      fit: BoxFit.cover,
                    ),
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
              shareModal(context, data['user']['image'], data['user']['name'],
                  data['imageLink']);
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

Future shareModal(BuildContext context, imageUser, username, dataShare) async {
  final screenSize = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      width: screenSize.width,
      height: screenSize.height * 0.4,
      child: Column(
        children: <Widget>[
          // send to
          Expanded(
            flex: 3,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
              color: Color(0xff222222),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Send to",
                    style: TextStyle(
                        fontSize: screenSize.width * 0.035,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.01),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: screenSize.width * 0.1,
                              height: screenSize.width * 0.1,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(imageUser),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            Text(
                              username,
                              style:
                                  TextStyle(fontSize: screenSize.width * 0.03),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width * 0.035),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: screenSize.width * 0.1,
                              height: screenSize.width * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.search,
                                size: screenSize.width * 0.06,
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.015),
                            Text(
                              'More',
                              style:
                                  TextStyle(fontSize: screenSize.width * 0.03),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //share to
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: screenSize.height * 0.015),
                  Text(
                    "Share to",
                    style: TextStyle(
                      fontSize: screenSize.width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.018),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: DataShare.dataShare.length,
                      itemBuilder: (context, i) => GestureDetector(
                        onTap: () {
                          print(DataShare.dataShare[i]['name']);
                          if (i == 0 || i == 1) {
                            onWhatsAppPressed("$dataShare");
                          }
                        },
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.02,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: screenSize.width * 0.09,
                                  height: screenSize.width * 0.09,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          DataShare.dataShare[i]['logo'],
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.015,
                                ),
                                Container(
                                  width: screenSize.width * 0.15,
                                  child: Text(
                                    DataShare.dataShare[i]['name'],
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.03,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: () {
                print("Report");
              },
              child: Container(
                width: screenSize.width * 0.6,
                margin: EdgeInsets.only(bottom: screenSize.height * 0.01),
                decoration: BoxDecoration(
                  color: Colors.red[600],
                  borderRadius: BorderRadius.all(
                    Radius.circular(screenSize.width * 0.05),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.report,
                      size: screenSize.width * 0.05,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.02,
                    ),
                    Text(
                      "Report this content",
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

onWhatsAppPressed(String data) {
  SocialShare.shareWhatsapp("$data").then((data) {
    print(data);
  });
}
