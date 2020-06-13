import 'package:flutter/material.dart';

import '../../../helper/icon/icon_data.dart';

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
                width: screenSize.width * 0.1,
                height: screenSize.width * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        data.avatar,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(width: screenSize.width * 0.02),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data.name,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${data.time.toString()} min",
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
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(screenSize.width * 0.02)),
      child: Hero(
        tag: data,
        child: Image.asset(
          data.image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

titleFeet(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Text(
      data.name,
      style: TextStyle(
        fontSize: screenSize.width * 0.05,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget listComments(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: ListTile(
      leading: Container(
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
      title: Container(
        child: RichText(
          maxLines: 3,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "${data['name']} ",
                style: TextStyle(
                  fontSize: screenSize.width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: "${data['comment']} ",
                style: TextStyle(
                  fontSize: screenSize.width * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
      subtitle: Container(
        margin: EdgeInsets.only(top: screenSize.width * 0.01),
        child: Row(
          children: <Widget>[
            Text(
              "${data['time'].toString()} min",
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.02,
            ),
            Text(
              "${data['likes'].toString()} likes",
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
