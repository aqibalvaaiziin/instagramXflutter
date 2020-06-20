import 'package:flutter/material.dart';

Widget dataFeet(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.1,
    height: screenSize.width * 0.1,
    child: Image.network(
      data['image'],
      fit: BoxFit.cover,
    ),
  );
}
