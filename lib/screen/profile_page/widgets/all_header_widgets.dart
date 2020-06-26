import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';

imageProfile(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Column(
    children: <Widget>[
      Container(
        width: screenSize.width * 0.24,
        height: screenSize.width * 0.24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
            image: NetworkImage(
              data['user']['image'],
            ),
            fit: BoxFit.fitWidth,
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xff828282).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(-4, 4))
          ],
        ),
      ),
    ],
  );
}

descProfile(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: screenSize.width * 0.02),
                child: Text(
                  data['user']['name'],
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: screenSize.height * 0.015),
        Container(
          padding: EdgeInsets.only(left: screenSize.width * 0.02),
          width: screenSize.width * 0.6,
          child: Text(
            data['user']['desc'],
            maxLines: 3,
            style: TextStyle(
                color: Colors.grey,
                height: screenSize.height * 0.0013,
                fontSize: screenSize.width * 0.03),
          ),
        ),
        SizedBox(height: screenSize.height * 0.018),
        Container(
          padding: EdgeInsets.only(left: screenSize.width * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.lightbulb_outline,
                size: screenSize.width * 0.04,
              ),
              SizedBox(width: screenSize.width * 0.01),
              Text(
                data['user']['location'],
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: screenSize.width * 0.035,
                ),
              ),
              Text(
                data['user']['location'],
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: screenSize.width * 0.035,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

statsProfile(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(
      top: screenSize.height * 0.02,
      bottom: screenSize.height * 0.02,
    ),
    width: screenSize.width,
    child: Column(
      children: <Widget>[
        Divider(
          color: Colors.white,
          height: 2,
          thickness: 1,
          indent: screenSize.width * 0.05,
          endIndent: screenSize.width * 0.05,
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height * 0.085,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        data['user']['posted'].toString(),
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Posted",
                        style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        data['user']['follower'].toString(),
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        data['user']['following'].toString(),
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          height: 2,
          thickness: 1,
          indent: screenSize.width * 0.02,
          endIndent: screenSize.width * 0.02,
        ),
      ],
    ),
  );
}

followButton(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.003),
    width: screenSize.width * 0.4,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(
        Radius.circular(screenSize.width * 0.01),
      ),
    ),
    child: InkWell(
      splashColor: Colors.grey,
      onTap: () {},
      child: Center(
        child: Text(
          "Follow",
          style: TextStyle(
            fontSize: screenSize.width * 0.043,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

messageButton(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.003),
    width: screenSize.width * 0.4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(screenSize.width * 0.01),
        ),
        border: Border.all(color: Colors.white)),
    child: InkWell(
      splashColor: Colors.grey,
      onTap: () {},
      child: Center(
        child: Text(
          "Messege",
          style: TextStyle(
            fontSize: screenSize.width * 0.043,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

headerControl(BuildContext context, data, isMe) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: screenSize.height * 0.1),
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: screenSize.height * 0.01,
          ),
          width: screenSize.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              descProfile(context, data),
              imageProfile(context, data),
            ],
          ),
        ),
        statsProfile(context, data),
        !isMe
            ? Container(
                width: screenSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    followButton(context),
                    SizedBox(width: screenSize.width * 0.04),
                    messageButton(context)
                  ],
                ),
              )
            : Container(),
      ],
    ),
  );
}

dataTitle(BuildContext context, bool data, name) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    child: Row(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: CustomIcon.iconMore(
                color: Colors.white, size: screenSize.width * 0.055),
            onPressed: () {},
          ),
        ),
        AnimatedOpacity(
          opacity: data ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: Container(
            child: Text(
              data ? name['user']['name'] : "            ",
              style: TextStyle(
                fontSize: screenSize.width * 0.06,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
