import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagramxflutter/screen/profile_page/profile_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import './find_user_page_view_model.dart';

class FindUserPageView extends FindUserPageViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.005,
                  ),
                  width: screenSize.width * 0.73,
                  child: TextField(
                    onChanged: (e) {
                      dataUserFound.clear();
                      changeInput();
                      onSearchTextChanged(e);
                    },
                    controller: search,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: screenSize.width * 0.05,
                        )),
                  ),
                ),
                !isEmptyInput
                    ? SizedBox(width: screenSize.width * 0.02)
                    : SizedBox(width: screenSize.width * 0.14),
                !isEmptyInput
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height * 0.005,
                        ),
                        child: IconButton(
                          icon: Icon(
                            FontAwesome.times,
                            size: screenSize.width * 0.06,
                          ),
                          onPressed: () {
                            search.clear();
                          },
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        body: dataUserFound.length > 0 && search.text.isNotEmpty
            ? ListView.builder(
                itemCount: dataUserFound.length,
                itemBuilder: (context, i) {
                  return MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(routeTo(ProfilePage(
                        isMe: dataUserFound[i]['username'] == username
                            ? true
                            : false,
                        fromSearch: true,
                        username: dataUserFound[i]['username'],
                      )));
                    },
                    child: Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.07,
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            width: screenSize.width * 0.14,
                            height: screenSize.width * 0.14,
                            margin: EdgeInsets.only(
                                bottom: screenSize.height * 0.008),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(dataUserFound[i]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                dataUserFound[i]['username'],
                                style: TextStyle(
                                    fontSize: screenSize.width * 0.037),
                              ),
                              SizedBox(height: screenSize.height * 0.004),
                              Text(
                                dataUserFound[i]['name'],
                                style: TextStyle(
                                    fontSize: screenSize.width * 0.037,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "Find someone",
                  style: TextStyle(fontSize: screenSize.width * 0.09),
                ),
              ),
      ),
    );
  }
}
