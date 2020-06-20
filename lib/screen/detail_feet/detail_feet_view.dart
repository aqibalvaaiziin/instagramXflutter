import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';
import 'package:instagramxflutter/providers/provider_image_comment.dart';
import './detail_feet_view_model.dart';

class DetailFeetView extends DetailFeetViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Comments",
          style: TextStyle(fontSize: screenSize.width * 0.05),
        ),
      ),
      floatingActionButton: commentSection(context, widget.id, inputComment),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: dataComment.length > 0
          ? Container(
              height: screenSize.height,
              margin: EdgeInsets.only(bottom: screenSize.height * 0.07),
              child: AnimatedList(
                key: listKey,
                padding: EdgeInsets.zero,
                initialItemCount: dataComment.length,
                itemBuilder: (context, i, Animation animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: listComments(context, dataComment[i]),
                  );
                },
              ),
            )
          : Container(
              child: Center(
                child: Text(
                  "Empty Comment",
                  style: TextStyle(fontSize: screenSize.width * 0.05),
                ),
              ),
            ),
    );
  }

  Widget listComments(BuildContext context, data) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: ListTile(
        leading: Container(
          width: screenSize.width * 0.12,
          height: screenSize.width * 0.12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(
                  data['user']['image'],
                ),
                fit: BoxFit.fill),
          ),
        ),
        title: Container(
          child: RichText(
            maxLines: 3,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "${data['user']['name']} ",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: "${data['comment'].toString()} ",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.03,
                  ),
                ),
              ],
            ),
          ),
        ),
        subtitle: Container(
          margin: EdgeInsets.only(top: screenSize.width * 0.01),
          child: Row(
            children: <Widget>[
              Text(
                "${data['createdAt']} min",
                style: TextStyle(
                  fontSize: screenSize.width * 0.03,
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.02,
              ),
              Text(
                "${data['like'].toString()} likes",
                style: TextStyle(
                  fontSize: screenSize.width * 0.03,
                ),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          icon: CustomIcon.favourite(
            statusIcon: isfav,
            size: screenSize.width * 0.055,
            statusColor: isfav,
          ),
          onPressed: () {
            setState(() {
              isfav = !isfav;
            });
          },
        ),
      ),
    );
  }

  commentSection(BuildContext context, String dataId, comment) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
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
                    controller: comment,
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
                        addComment();
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
