import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

instagramTitle(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Text(
      "Instagram",
      style: TextStyle(
        fontSize: screenSize.width * 0.1,
        fontFamily: "vegan",
        letterSpacing: 4,
      ),
    ),
  );
}

usernameForm(BuildContext context, username) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.85,
    decoration: BoxDecoration(
      color: Color(0xff666666),
      borderRadius: BorderRadius.all(
        Radius.circular(screenSize.width * 0.01),
      ),
    ),
    child: TextField(
      controller: username,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(screenSize.width * 0.01),
          ),
        ),
        hoverColor: Colors.white,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hintText: "Username",
      ),
    ),
  );
}

passwordForm(BuildContext context, password) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.85,
    decoration: BoxDecoration(
      color: Color(0xff666666),
      borderRadius: BorderRadius.all(
        Radius.circular(screenSize.width * 0.01),
      ),
    ),
    child: TextField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(screenSize.width * 0.01),
          ),
        ),
        hintText: "Password",
      ),
    ),
  );
}

forgotPassword(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "Forgot your login details? ",
            style: TextStyle(
              fontSize: screenSize.width * 0.035,
              color: Color(0xffbfbfbf),
            ),
          ),
          TextSpan(
            text: " Get help signing in",
            style: TextStyle(
              fontSize: screenSize.width * 0.035,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

dividerLine(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            indent: screenSize.width * 0.07,
            endIndent: screenSize.width * 0.03,
            thickness: 2,
          ),
        ),
        Text(
          "OR",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: screenSize.width * 0.045,
            color: Colors.grey,
          ),
        ),
        Expanded(
            child: Divider(
          indent: screenSize.width * 0.03,
          endIndent: screenSize.width * 0.07,
          thickness: 2,
        )),
      ],
    ),
  );
}

otherLogin(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesome.facebook_official,
                size: screenSize.width * 0.06,
                color: Color(0xff008cff),
              ),
              SizedBox(width: screenSize.width * 0.02),
              Text(
                "Log In with Facebook",
                style: TextStyle(
                  fontSize: screenSize.width * 0.042,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff008cff),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: screenSize.height * 0.015),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesome.google_plus_official,
                size: screenSize.width * 0.06,
                color: Colors.red[400],
              ),
              SizedBox(width: screenSize.width * 0.02),
              Text(
                "Log In with Google",
                style: TextStyle(
                    fontSize: screenSize.width * 0.042,
                    fontWeight: FontWeight.w700,
                    color: Colors.red[400]),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

floatingBottom(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    height: screenSize.height * 0.07,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
    ),
    child: Center(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                fontSize: screenSize.width * 0.035,
                color: Color(0xffbfbfbf),
              ),
            ),
            TextSpan(
              text: " Sign up",
              style: TextStyle(
                fontSize: screenSize.width * 0.035,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
