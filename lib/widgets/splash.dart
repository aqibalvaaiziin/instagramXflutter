import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/home_page/home_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(routeTo(HomePage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              width: screenSize.width * 0.7,
              height: screenSize.width * 0.7,
            ),
            SizedBox(height: screenSize.width * 0.01),
            Text(
              "Instagram",
              style: TextStyle(
                  fontSize: screenSize.width * 0.08,
                  fontFamily: "vegan",
                  letterSpacing: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
