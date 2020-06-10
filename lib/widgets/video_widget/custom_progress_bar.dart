import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double width;
  final double value;
  final double totalValue;

  const CustomProgressBar({
    Key key,
    this.width,
    this.value,
    this.totalValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double ratio = value / totalValue;
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: screenSize.height * 0.005,
          color: Colors.black,
        ),
        Material(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: screenSize.height * 0.003,
            width: width * ratio,
            color: Color(0xff5eebca),
          ),
        ),
      ],
    );
  }
}
