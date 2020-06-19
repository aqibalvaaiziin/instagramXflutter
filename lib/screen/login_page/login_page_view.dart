import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/login_page/widgets/all_widgets.dart';
import './login_page_view_model.dart';

class LoginPageView extends LoginPageViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            instagramTitle(context),
            SizedBox(height: screenSize.height * 0.05),
            loginForm(context),
            SizedBox(height: screenSize.height * 0.015),
            forgotPassword(context),
            SizedBox(height: screenSize.height * 0.02),
            dividerLine(context),
            SizedBox(height: screenSize.height * 0.01),
            otherLogin(context),
          ],
        ),
      ),
      floatingActionButton: floatingBottom(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
