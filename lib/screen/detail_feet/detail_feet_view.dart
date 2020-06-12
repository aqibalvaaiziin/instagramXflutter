import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/detail_feet/widgets/feet_header.dart';
import '../../helper/data/dataJson.dart';
import './detail_feet_view_model.dart';

class DetailFeetView extends DetailFeetViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: Container(
              width: screenSize.width,
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.003,
              ),
              color: Color(0xff1b1b1b),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: screenSize.width * 0.087,
                    height: screenSize.width * 0.087,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: screenSize.width * 0.08,
                            height: screenSize.width * 0.08,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    DataFeet.dataFeet[1]['avatar'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.5,
                    child: TextField(
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add comment",
                        hintStyle: TextStyle(
                          fontSize: screenSize.width * 0.035,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          size: screenSize.width * 0.055,
                        ),
                        onPressed: () {
                          print("object");
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: titleFeet(context, widget),
            pinned: true,
            centerTitle: true,
            expandedHeight: screenSize.height * 0.75,
            flexibleSpace: FlexibleSpaceBar(
              background: feetHeader(context, widget),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(DataComment.dataComment
                .map((item) => listComments(context, item))
                .toList()),
          ),
        ],
      ),
    );
  }
}
