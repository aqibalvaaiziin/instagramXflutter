import 'package:flutter/material.dart';
import './control_post_page_view_model.dart';

class ControlPostPageView extends ControlPostPageViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Post",
          style: TextStyle(fontSize: screenSize.width * 0.05),
        ),
        centerTitle: false,
        flexibleSpace: Stack(
          children: <Widget>[
            Positioned(
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.15),
                  child: FlatButton(
                      onPressed: () async {
                        setLoading();
                        if (widget.isImage) {
                          try {
                            await convertImage();
                            pushImage();
                          } catch (e) {
                            print(e.toString());
                          }
                        } else {
                          pushVideo();
                        }
                      },
                      child: Text(
                        "Post",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ))
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.01,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      widget.isImage
                          ? Container(
                              width: screenSize.width * 0.2,
                              height: screenSize.width * 0.2,
                              child: Image.memory(widget.dataPost),
                            )
                          : Container(
                              width: screenSize.width * 0.2,
                              height: screenSize.width * 0.2,
                              color: Colors.black,
                              child: Center(
                                child: Icon(
                                  Icons.videocam,
                                  size: screenSize.width * 0.055,
                                ),
                              ),
                            ),
                      Container(
                        width: screenSize.width * 0.7,
                        child: TextField(
                          controller: captionController,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write a caption",
                              hintStyle: TextStyle(
                                fontSize: screenSize.width * 0.04,
                                letterSpacing: 0.5,
                                color: Colors.grey[400],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.07,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.01,
                        vertical: screenSize.width * 0.03,
                      ),
                      child: Text(
                        "Tag people",
                        style: TextStyle(fontSize: screenSize.width * 0.04),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.07,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.01,
                        vertical: screenSize.width * 0.03,
                      ),
                      child: Text(
                        "Add Location",
                        style: TextStyle(fontSize: screenSize.width * 0.04),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isLoading ? isLoad() : Container(),
        ],
      ),
    );
  }
}
