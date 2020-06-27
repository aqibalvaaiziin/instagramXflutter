import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/providers/provider_user.dart';
import 'package:instagramxflutter/screen/login_page/widgets/all_widgets.dart';
import 'package:instagramxflutter/screen/navigator_page/navigator_page.dart';
import 'package:instagramxflutter/widgets/helper_widget.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import './login_page.dart';

abstract class LoginPageViewModel extends State<LoginPage> {
  PreferencesData preferencesData = PreferencesData();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isClicked = false;

  loginProcess() {
    Navigator.of(context).push(routeToV(NavigatorPage()));
  }

  loginForm(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        usernameForm(context, username),
        SizedBox(height: screenSize.height * 0.02),
        passwordForm(context, password),
        SizedBox(height: screenSize.height * 0.02),
        loginButton(),
      ],
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
        onPressed: () {
          if (username.text.isNotEmpty && password.text.isNotEmpty) {
            loginBtnClicked();
            ProviderUser.login(username.text, password.text).then((value) {
              var jsonObject = jsonDecode(jsonEncode(value.data));
              if (value.statusCode == 200) {
                preferencesData.setToken(jsonObject['token']);
                preferencesData.setUsername(username.text);
                Future.delayed(Duration(seconds: 1), () {
                  preferencesData.getToken().then((value) {
                    if (value != null) {
                      Navigator.of(context)
                          .pushReplacement(routeToV(NavigatorPage()));
                    }
                  });
                });
              } else {
                toastMessage("Input doesn't match", Colors.red[600]);
              }
            });
          } else {
            toastMessage("Enter the form first", Colors.red[600]);
          }
        },
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
                  "Log In",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.043,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }

  loginBtnClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }
}
