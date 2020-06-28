import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/time_and_view_string.dart';
import 'package:instagramxflutter/helper/icon/icon_data.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/providers/provider_user.dart';
import 'package:instagramxflutter/providers/provider_video_comment.dart';

class CommentVideoPage extends StatefulWidget {
  final idVideo;

  const CommentVideoPage({Key key, this.idVideo}) : super(key: key);

  @override
  _CommentVideoPageState createState() => _CommentVideoPageState();
}

class _CommentVideoPageState extends State<CommentVideoPage> {
  TextEditingController inputComment = TextEditingController();
  bool isfav = false;
  List dataUser = List();
  List dataComment = List();
  PreferencesData preferencesData = PreferencesData();
  bool isLoad = false;

  loadingData() {
    setState(() {
      isLoad = true;
    });
  }

  addComment() {
    loadingData();
    ProviderVideoComment.addComment(widget.idVideo, inputComment.text)
        .then((_) {
      getAllComments();
      setState(() {
        isLoad = false;
      });
    });
    setState(() {
      inputComment.clear();
    });
  }

  getUser() {
    preferencesData.getUsername().then((username) {
      ProviderUser.getUserProfile(username).then((res) {
        var jsonObject = res.data;
        setState(() {
          dataUser.add(jsonObject);
        });
      });
    });
  }

  getAllComments() {
    ProviderVideoComment.getAllComment(widget.idVideo).then((value) {
      dataComment.clear();
      var jsonObject = value.data;
      for (var i = 0; i < jsonObject.length; i++) {
        setState(() {
          dataComment.add(jsonObject[i]);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getAllComments();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Commennt",
          style: TextStyle(fontSize: screenSize.width * 0.04),
        ),
      ),
      body: Stack(
        children: <Widget>[
          dataComment.length > 0
              ? Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  margin: EdgeInsets.only(bottom: screenSize.height * 0.06),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: dataComment.length,
                    itemBuilder: (context, i) {
                      return listComments(context, dataComment[i]);
                    },
                  ),
                )
              : Center(
                  child: Text(
                    "Empty Comment",
                    style: TextStyle(fontSize: screenSize.width * 0.04),
                  ),
                ),
          isLoad
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox()
        ],
      ),
      floatingActionButton: dataUser.length > 0
          ? commentSection(
              context,
              inputComment,
              dataUser[0]['image'],
            )
          : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  commentSection(BuildContext context, comment, image) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
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
                                  image: NetworkImage(image),
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
                      onSubmitted: (value) {
                        addComment();
                      },
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
                "${HelperString.getTimeSinceUpload(data['createdAt'])} ago",
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
}
