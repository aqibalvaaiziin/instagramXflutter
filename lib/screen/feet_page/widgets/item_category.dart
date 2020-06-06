import 'package:flutter/material.dart';

Widget listCategory(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: screenSize.width * 0.02,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: screenSize.width * 0.02,
    ),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(screenSize.width * 0.01)),
      border: Border.all(color: Colors.white),
    ),
    child: InkWell(
      onTap: () {},
      splashColor: Colors.white,
      child: Center(
        child: Text(
          data['text'],
          style: TextStyle(
            fontSize: screenSize.width * 0.037,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
