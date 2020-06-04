import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/home_page/home_page.dart';
import 'package:instagramxflutter/screen/profile_page/profile_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';

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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(
              Icons.home,
              size: screenSize.width * 0.07,
            ),
            onPressed: () {
              Navigator.of(context).push(routeTo(HomePage()));
            },
          ),
        ),
        Container(
          child: IconButton(
            icon: Icon(
              Icons.search,
              size: screenSize.width * 0.07,
            ),
            onPressed: () {},
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
            width: screenSize.width * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(screenSize.width * 0.02))),
            child: InkWell(
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: screenSize.width * 0.07,
                ),
              ),
            )),
        Container(
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              size: screenSize.width * 0.07,
            ),
            onPressed: () {},
          ),
        ),
        Container(
          child: IconButton(
            icon: Icon(
              Icons.person,
              size: screenSize.width * 0.07,
            ),
            onPressed: () {
              Navigator.of(context).push(routeTo(ProfilePage()));
            },
          ),
        ),
      ],
    ),
  );
}
