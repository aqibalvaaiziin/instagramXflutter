import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/dataFilter.dart';
import 'package:instagramxflutter/screen/control_post_page/control_post_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import './post_image_page_view_model.dart';

class PostImagePageView extends PostImagePageViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Image"),
        flexibleSpace: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                  icon: Icon(
                    Icons.check,
                    size: screenSize.width * 0.065,
                  ),
                  onPressed: () async {
                    setLoading();
                    try {
                      await capturePng();
                      Navigator.of(context).push(routeTo(ControlPostPage(
                        dataPost: decodeBytes,
                        isImage: true,
                      )));
                    } catch (e) {
                      print(e.toString());
                    }
                    if (mounted) {
                      setState(() {
                        isLoadImage = false;
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.067),
            child: Column(
              children: <Widget>[
                getImageContent(),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: DataFilter.colorFilter.length,
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: () => changeSelected(i),
                      child: colorsPreset(i),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isLoadImage ? isLoading() : Container()
        ],
      ),
    );
  }

  Widget getImageContent() {
    final screenSize = MediaQuery.of(context).size;
    if (widget.dataImage != null) {
      return Stack(
        children: <Widget>[
          RepaintBoundary(
            key: globalKey,
            child: Container(
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix(
                    DataFilter.colorFilter[selectedIndex]['color']),
                child: Image.file(
                  widget.dataImage,
                  width: screenSize.width * 0.9,
                  height: screenSize.height * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      );
    } else
      return Container();
  }

  Widget colorsPreset(data) {
    final screenSize = MediaQuery.of(context).size;
    if (widget.dataImage != null) {
      return Container(
        width: screenSize.width * 0.3,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            ColorFiltered(
                colorFilter:
                    ColorFilter.matrix(DataFilter.colorFilter[data]['color']),
                child: Container(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(screenSize.width * 0.03),
                    child: Image.file(
                      widget.dataImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            SizedBox(height: screenSize.height * 0.01),
            Text(
              DataFilter.colorFilter[data]['name'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: screenSize.width * 0.043,
              ),
            )
          ],
        ),
      );
    } else
      return Container();
  }
}
