import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagramxflutter/screen/login_page/login_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import './register_page_view_model.dart';

class RegisterPageView extends RegisterPageViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: floatingBottom(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesome.user_circle_o,
                size: screenSize.width * 0.4,
              ),
              SizedBox(height: screenSize.height * 0.05),
              Container(
                color: Color(0xff666666),
                width: screenSize.width * 0.85,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: screenSize.width * 0.04),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Container(
                width: screenSize.width * 0.85,
                color: Color(0xff666666),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    labelStyle: TextStyle(fontSize: screenSize.width * 0.04),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Container(
                width: screenSize.width * 0.85,
                color: Color(0xff666666),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: screenSize.width * 0.04),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Container(
                width: screenSize.width * 0.85,
                child: Text(
                  "After you finish enter this form you will be back to login page.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.85,
      height: screenSize.height * 0.06,
      decoration: BoxDecoration(
          color: Colors.blue[700],
          borderRadius:
              BorderRadius.all(Radius.circular(screenSize.width * 0.01))),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        elevation: 5,
        height: screenSize.height * 0.06,
        clipBehavior: Clip.antiAlias,
        onPressed: () => registerButton(),
        child: Center(
          child: isClicked
              ? Container(
                  width: screenSize.width * 0.055,
                  height: screenSize.width * 0.055,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
              : Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.043,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
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
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account? ",
            style: TextStyle(
              fontSize: screenSize.width * 0.035,
              color: Color(0xffbfbfbf),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(routeTo(LoginPage())),
            child: Text(
              " Log In",
              style: TextStyle(
                fontSize: screenSize.width * 0.035,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      )),
    );
  }
}
