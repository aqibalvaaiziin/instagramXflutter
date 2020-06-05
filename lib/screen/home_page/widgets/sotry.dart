import 'package:flutter/material.dart';

headerBar(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.fromLTRB(
      screenSize.width * 0.01,
      screenSize.width * 0.021,
      screenSize.width * 0.01,
      screenSize.width * 0.01,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Text(
            "Instagram",
            style: TextStyle(
              fontSize: screenSize.width * 0.05,
              fontFamily: "vegan",
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.live_tv,
                  size: screenSize.width * 0.05,
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: screenSize.width * 0.02,
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  size: screenSize.width * 0.05,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

dataStory(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.17,
    height: screenSize.width * 0.17,
    margin: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.02,
        vertical: screenSize.height * 0.014),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(data),
        fit: BoxFit.fill,
      ),
    ),
  );
}
