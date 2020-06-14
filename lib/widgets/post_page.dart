import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/post_image/post_image_page.dart';
import 'package:instagramxflutter/screen/post_video/post_video_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: FadeTransition(
          opacity: animation,
          child: Container(
            height: screenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  splashColor: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(screenSize.width * 0.05),
                  ),
                  onTap: () => Navigator.of(context).push(
                    routeToV(PostImagePage()),
                  ),
                  child: Container(
                    width: screenSize.width * 0.6,
                    height: screenSize.height * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: screenSize.width * 0.015,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenSize.width * 0.05)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.image,
                          size: screenSize.width * 0.3,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Text(
                          "Add new photo",
                          style: TextStyle(
                              fontSize: screenSize.width * 0.07,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(screenSize.width * 0.05),
                  ),
                  onTap: () => Navigator.of(context).push(
                    routeToV(PostVideoPage()),
                  ),
                  child: Container(
                    width: screenSize.width * 0.6,
                    height: screenSize.height * 0.3,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: screenSize.width * 0.015,
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.05))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.live_tv,
                          size: screenSize.width * 0.3,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Text(
                          "Add new video",
                          style: TextStyle(
                              fontSize: screenSize.width * 0.07,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
