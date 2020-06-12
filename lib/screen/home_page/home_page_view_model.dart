import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';
import 'package:instagramxflutter/screen/home_page/widgets/card-component.dart';
import './home_page.dart';

abstract class HomePageViewModel extends State<HomePage> {
  bool isfav = false;
  bool isbooked = false;

  Widget datafeet(BuildContext context, data) {
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
            child: cardHeader(context, data),
          ),
          Expanded(
            flex: 6,
            child: imageCard(context, data),
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
                          data['likes'].toString(),
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
