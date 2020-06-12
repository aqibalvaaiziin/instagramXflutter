import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/detail_feet/widgets/feet_header.dart';
import '../../helper/icon/icon_data.dart';
import './detail_feet.dart';

abstract class DetailFeetViewModel extends State<DetailFeet> {
  TextEditingController controller = TextEditingController();
  bool isfav = false;
  bool isbooked = false;

  feetHeader(BuildContext context, data) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              width: screenSize.width,
              margin: EdgeInsets.only(
                top: screenSize.height * 0.12,
                bottom: screenSize.height * 0.015,
                left: screenSize.width * 0.06,
                right: screenSize.width * 0.06,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(screenSize.width * 0.05),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(flex: 1, child: cardHeader(context, data)),
                  Expanded(
                      flex: 5,
                      child: Container(
                        child: imageCard(context, data),
                      )),
                  Expanded(
                    flex: 1,
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
                                SizedBox(width: screenSize.width * 0.003),
                                Text(
                                  data.likes.toString(),
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
                                  data.comments.toString(),
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
                            margin:
                                EdgeInsets.only(right: screenSize.width * 0.05),
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
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(
                right: screenSize.width * 0.05,
                left: screenSize.width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.01),
                    child: Text(
                      "${data.caption}",
                      style: TextStyle(
                        fontSize: screenSize.width * 0.034,
                        letterSpacing: screenSize.width * 0.001,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
