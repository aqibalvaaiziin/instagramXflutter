import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

bottomBar(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    height: screenSize.height * 0.06,
    color: Color(0xff3d3d3d),
    child: TabBar(
      labelColor: Colors.white,
      tabs: <Widget>[
        Tab(
            icon: Icon(
          FontAwesome.home,
          size: screenSize.width * 0.06,
        )),
        Tab(
            icon: Icon(
          FontAwesome.image,
          size: screenSize.width * 0.06,
        )),
        Tab(
            icon: Icon(
          FontAwesome.plus_square,
          size: screenSize.width * 0.06,
        )),
        Tab(
            icon: Icon(
          FontAwesome.television,
          size: screenSize.width * 0.06,
        )),
        Tab(
            icon: Icon(
          FontAwesome.user,
          size: screenSize.width * 0.06,
        )),
      ],
    ),
  );
}
