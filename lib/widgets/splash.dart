import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/responsive/size_config.dart';
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
    SizeConfig().init(context);
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
              width: SizeConfig.dataWidth * 55,
              height: SizeConfig.dataWidth * 55,
            ),
            SizedBox(height: SizeConfig.dataHeight * 0.1),
            Text(
              "Instagram",
              style: TextStyle(
                  fontSize: SizeConfig.dataWidth * 6,
                  fontFamily: "vegan",
                  letterSpacing: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
