import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';

void modalPage(BuildContext context, int comment) {
  var screenSize = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height * 0.8,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff1b1b1b),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(screenSize.width * 0.06),
                    bottomLeft: Radius.circular(screenSize.width * 0.06),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: screenSize.width * 0.06),
                      child: Text(
                        "${comment.toString()} comments",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        splashColor: Colors.white,
                        icon: Icon(
                          FontAwesome.times,
                          size: screenSize.width * 0.05,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenSize.height * 0.073,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  child: ListView.builder(
                    itemCount: DataComment.dataComment.length,
                    itemBuilder: (context, i) {
                      return listComments(context, DataComment.dataComment[i]);
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 0,
                right: 0,
                child: commentSection(context),
              ),
            ],
          ),
        ),
      );
    },
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
              image: AssetImage(
                data['avatar'],
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
                text: "${data['name']} ",
                style: TextStyle(
                  fontSize: screenSize.width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: "${data['comment']} ",
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
              "${data['time'].toString()} min",
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.02,
            ),
            Text(
              "${data['likes'].toString()} likes",
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

commentSection(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  TextEditingController controller = TextEditingController();
  return Container(
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
            controller: controller,
            maxLines: 5,
            minLines: 1,
            style: TextStyle(
              fontSize: screenSize.width * 0.035,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Add comment",
              hintStyle: TextStyle(
                fontSize: screenSize.width * 0.035,
                fontWeight: FontWeight.w600,
              ),
            ),
            onChanged: (value) {},
          ),
        ),
        Container(
          child: IconButton(
              icon: Icon(
                Icons.send,
                size: screenSize.width * 0.055,
              ),
              onPressed: () {}),
        ),
      ],
    ),
  );
}
