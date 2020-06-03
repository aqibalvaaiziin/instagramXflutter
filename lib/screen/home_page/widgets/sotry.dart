import 'package:flutter/material.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';

dataStory(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return ListView.builder(
    padding: EdgeInsets.zero,
    scrollDirection: Axis.horizontal,
    itemCount: DataStory.dataStory.length,
    itemBuilder: (context, i) => Container(
      width: screenSize.width * 0.2,
      height: screenSize.width * 0.2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            DataStory.dataStory[i]['image'],
          ),
        ),
      ),
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
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02,
            horizontal: screenSize.width * 0.05,
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
                            width: screenSize.width * 0.15,
                            height: screenSize.width * 0.15,
                            child: Image.asset(
                              DataFeet.dataFeet[i]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
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
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.asset(DataFeet.dataFeet[i]['image']),
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
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: screenSize.width * 0.07,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            DataFeet.dataFeet[i]['likes'],
                            style: TextStyle(color: Colors.black),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.comment,
                              color: Colors.black,
                              size: screenSize.width * 0.07,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            DataFeet.dataFeet[i]['likes'],
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(
                          icon: Icon(
                            Icons.bookmark_border,
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
