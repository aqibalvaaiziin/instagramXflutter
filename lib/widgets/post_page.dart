import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
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
  File selectedFile;
  final picker = ImagePicker();
  bool inProcess = false;
  var file;
  GlobalKey globalKey = new GlobalKey();
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
            margin: EdgeInsets.only(top: screenSize.height * 0.05),
            height: screenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Post Something",
                  style: TextStyle(
                      fontSize: screenSize.width * 0.1, fontFamily: "vegan"),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Container(
                  child: Container(
                    width: screenSize.width * 0.65,
                    height: screenSize.width * 0.67,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            postDialog(context, true);
                          },
                          child: Container(
                            width: screenSize.width * 0.58,
                            height: screenSize.width * 0.58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenSize.width * 0.02)),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/camera.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.01),
                        Text(
                          "Post Photo",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.045,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width * 0.65,
                  height: screenSize.width * 0.67,
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          postDialog(context, false);
                        },
                        child: Container(
                          width: screenSize.width * 0.58,
                          height: screenSize.width * 0.58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(screenSize.width * 0.02)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/video.gif"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Text(
                        "Post Video",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getImage(ImageSource source) async {
    this.setState(() {
      inProcess = true;
    });
    PickedFile image = await picker.getImage(source: source);
    if (image != null) {
      File cropper = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(
          ratioX: 2,
          ratioY: 2,
        ),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.png,
      );
      this.setState(() {
        selectedFile = cropper;
        inProcess = false;
      });
      Navigator.of(context).push(routeTo(PostImagePage(
        dataImage: selectedFile,
      )));
    } else {
      this.setState(() {
        inProcess = false;
      });
    }
  }

  getVideo(ImageSource source) async {
    PickedFile video = await picker.getVideo(source: source);
    if (video != null) {
      setState(() {
        selectedFile = File(video.path);
      });
    }
    if (selectedFile != null) {
      Navigator.of(context)
          .push(routeToV(PostVideoPage(dataVideo: selectedFile)));
    }
  }

  Future postDialog(BuildContext context, bool choosed) async {
    showDialog(
        context: context,
        builder: (context) {
          var screenSize = MediaQuery.of(context).size;
          return Scaffold(
            backgroundColor: Color(0xff2f3542).withOpacity(0.4),
            body: Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    width: screenSize.width * 0.68,
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                      color: Color(0xff404040),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: screenSize.height * 0.02),
                            Container(
                              child: Center(
                                child: Text(
                                  "Choose Source",
                                  style: TextStyle(
                                      fontSize: screenSize.width * 0.06,
                                      fontFamily: "CB",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.03),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              screenSize.width * 0.01)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          screenSize.width * 0.15),
                                      child: FlatButton(
                                          onPressed: () {
                                            if (choosed == true) {
                                              getImage(ImageSource.camera);
                                            } else {
                                              getVideo(ImageSource.camera);
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.camera_alt,
                                                size: screenSize.width * 0.06,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Camera",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        0.035,
                                                    fontFamily: "FL",
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    letterSpacing: 0.9),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  SizedBox(width: screenSize.width * 0.02),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          screenSize.width * 0.15),
                                      child: FlatButton(
                                          onPressed: () async {
                                            if (choosed == true) {
                                              getImage(ImageSource.gallery);
                                            } else {
                                              getVideo(ImageSource.gallery);
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                FontAwesome.folder_open,
                                                size: screenSize.width * 0.06,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Gallery",
                                                style: TextStyle(
                                                    fontSize: screenSize.width *
                                                        0.035,
                                                    fontFamily: "FL",
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    letterSpacing: 0.9),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7,
                    right: 10,
                    child: Container(
                      width: screenSize.width * 0.1,
                      height: screenSize.width * 0.1,
                      decoration: BoxDecoration(
                        color: Color(0xff2f3542),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 17,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
