import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';

dataStory(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return ListView.builder(
    padding: EdgeInsets.zero,
    scrollDirection: Axis.horizontal,
    itemCount: DataStory.dataStory.length,
    itemBuilder: (context, i) => Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.025,
        vertical: screenSize.width * 0.01,
      ),
      width: screenSize.width * 0.17,
      height: screenSize.width * 0.17,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              DataStory.dataStory[i]['image'],
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xffd6d6d6).withOpacity(0.4),
              spreadRadius: 0.4,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ]),
    ),
  );
}

datafeet(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: DataFeet.dataFeet.length,
      itemBuilder: (context, i) {
        return Container(
          margin: EdgeInsets.only(
            bottom: screenSize.height * 0.014,
            left: screenSize.width * 0.05,
            right: screenSize.width * 0.05,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: screenSize.width * 0.03,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: screenSize.width * 0.11,
                            height: screenSize.width * 0.11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    DataFeet.dataFeet[i]['avatar'],
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: screenSize.width * 0.03),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  DataFeet.dataFeet[i]['name'],
                                  style: TextStyle(
                                      fontSize: screenSize.width * 0.05,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${DataFeet.dataFeet[i]['time']} min",
                                  style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(
                          icon: Icon(
                            Icons.view_module,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.asset(
                    DataFeet.dataFeet[i]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              i % 2 == 1
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: i % 2 == 1 ? Colors.black : Colors.red,
                              size: screenSize.width * 0.07,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: screenSize.width * 0.01),
                          Text(
                            DataFeet.dataFeet[i]['likes'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.width * 0.04,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: screenSize.width * 0.04),
                          IconButton(
                            icon: Icon(
                              Icons.comment,
                              color: Colors.black,
                              size: screenSize.width * 0.07,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: screenSize.width * 0.01),
                          Text(
                            DataFeet.dataFeet[i]['likes'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.width * 0.04,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(
                          icon: Icon(
                            i % 2 == 0 ? Icons.bookmark_border : Icons.bookmark,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
