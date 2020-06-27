import 'package:flutter/material.dart';
import 'package:instagramxflutter/providers/provider_user.dart';
import 'package:instagramxflutter/screen/login_page/login_page.dart';
import 'package:instagramxflutter/widgets/helper_widget.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import './register_page.dart';

abstract class RegisterPageViewModel extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isClicked = false;

  registerBtnClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  registerButton() {
    bool condition = name.text.isNotEmpty &&
        username.text.isNotEmpty &&
        password.text.isNotEmpty;

    if (condition) {
      registerBtnClicked();
      ProviderUser.register(name.text, username.text, password.text).then((_) {
        toastMessage("Register Success", Colors.blue);

        Navigator.of(context).pushReplacement(routeTo(LoginPage()));
      });
    } else {
      toastMessage("Bad Input", Colors.red[600]);
    }
  }
}
