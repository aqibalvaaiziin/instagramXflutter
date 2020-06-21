import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';

toastMessage(text, color) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 14.0);
}

singleImagePost(
  BuildContext context,
  bool isbooked,
  bool isfav,
  avatar,
  name,
  time,
  image,
  like,
  comment,
) {
  return StatefulBuilder(
    builder: (context, setState) {
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
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: screenSize.width * 0.07,
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
                                    image,
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
                                  name,
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.04,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  time,
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
                    Container(
                      padding: EdgeInsets.only(
                        right: screenSize.width * 0.07,
                        top: screenSize.height * 0.02,
                      ),
                      child: IconButton(
                        icon: CustomIcon.iconMore(
                          size: screenSize.width * 0.055,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.03,
                  vertical: screenSize.width * 0.02,
                ),
                width: screenSize.width,
                height: screenSize.height * 0.487,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(screenSize.width * 0.02)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                          IconButton(
                            icon: CustomIcon.favourite(
                              statusIcon: isfav,
                              size: screenSize.width * 0.055,
                              statusColor: isfav,
                            ),
                            onPressed: () {
                              setState(() {
                                isfav = !isfav;
                              });
                            },
                          ),
                          Text(
                            like.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.03),
                          CustomIcon.comment(
                            size: screenSize.width * 0.055,
                            color: Colors.black,
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Text(
                            comment.toString(),
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
    },
  );
}
