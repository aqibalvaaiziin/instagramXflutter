import 'package:flutter/material.dart';

headerBar(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    height: screenSize.height * 0.1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Text(
            "Instagram",
            style: TextStyle(
              fontSize: screenSize.width * 0.055,
              fontFamily: "vegan",
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.send,
                  size: screenSize.width * 0.055,
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

dataStory(
  BuildContext context,
  String image,
  String name,
  bool isClicked,
  String id,
) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
    child: Column(
      children: <Widget>[
        Container(
          width: screenSize.width * 0.18,
          height: screenSize.width * 0.18,
          child: Stack(
            alignment: Alignment(0, 0),
            children: <Widget>[
              Container(
                width: screenSize.width * 0.172,
                height: screenSize.width * 0.172,
                child: CircleAvatar(
                  backgroundColor: isClicked ? Colors.grey : Colors.redAccent,
                ),
              ),
              Container(
                width: screenSize.width * 0.16,
                height: screenSize.width * 0.16,
                child: CircleAvatar(
                  backgroundColor: Color(0xff1c1c1c),
                ),
              ),
              Container(
                width: screenSize.width * 0.14,
                height: screenSize.width * 0.14,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                ),
              ),
              Container(
                width: screenSize.width * 0.17,
                height: screenSize.width * 0.17,
                child: FloatingActionButton(
                  heroTag: "btn $id",
                  onPressed: () {},
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: screenSize.height * 0.004),
        Container(
          width: screenSize.width * 0.19,
          child: Center(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: screenSize.width * 0.03),
              maxLines: 1,
            ),
          ),
        )
      ],
    ),
  );
}
