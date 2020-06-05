import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';

cardHeader(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: screenSize.width * 0.07,
            top: screenSize.height * 0.02,
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: screenSize.width * 0.12,
                height: screenSize.width * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        data['avatar'],
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(width: screenSize.width * 0.02),
              Container(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data['name'],
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${data['time'].toString()} min",
                      style: TextStyle(
                        fontSize: screenSize.width * 0.03,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            right: screenSize.width * 0.07,
            top: screenSize.height * 0.02,
          ),
          child: IconButton(
            icon: CustomIcon.iconMore(
              size: screenSize.width * 0.055,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

imageCard(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: screenSize.width * 0.03,
      vertical: screenSize.width * 0.02,
    ),
    width: screenSize.width,
    height: screenSize.height * 0.487,
    decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(screenSize.width * 0.02)),
        image: DecorationImage(
          image: AssetImage(data['image']),
          fit: BoxFit.cover,
        )),
  );
}
