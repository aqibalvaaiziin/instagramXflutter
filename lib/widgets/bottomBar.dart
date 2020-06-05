import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

bottomBar(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    decoration: BoxDecoration(
      color: Color(0xff3d3d3d),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(screenSize.width * 0.06),
        topRight: Radius.circular(screenSize.width * 0.06),
      ),
    ),
    child: TabBar(
      labelColor: Colors.white,
      tabs: <Widget>[
        Tab(icon: Icon(FontAwesome.home,size: screenSize.width * 0.06,)),
        Tab(icon: Icon(FontAwesome.search,size: screenSize.width * 0.06,)),
        Tab(icon: Icon(FontAwesome.plus_square,size: screenSize.width * 0.06,)),
        Tab(icon: Icon(FontAwesome.heart,size: screenSize.width * 0.06,)),
        Tab(icon: Icon(FontAwesome.user,size: screenSize.width * 0.06,)),
      ],
    ),
  );
}
