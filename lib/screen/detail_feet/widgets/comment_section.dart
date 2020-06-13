import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';

commentSection(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Stack(
    children: <Widget>[
      Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 0,
        right: 0,
        child: Container(
          width: screenSize.width,
          padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.003,
          ),
          color: Color(0xff1b1b1b),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: screenSize.width * 0.087,
                height: screenSize.width * 0.087,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: screenSize.width * 0.08,
                        height: screenSize.width * 0.08,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                DataFeet.dataFeet[1]['avatar'],
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenSize.width * 0.5,
                child: TextField(
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add comment",
                    hintStyle: TextStyle(
                      fontSize: screenSize.width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                child: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: screenSize.width * 0.055,
                    ),
                    onPressed: () {
                      print("object");
                    }),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
