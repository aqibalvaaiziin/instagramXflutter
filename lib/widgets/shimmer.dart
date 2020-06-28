import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

shimmerHome(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return Shimmer(
    gradient: LinearGradient(
        colors: [Colors.grey, Colors.grey[350], Colors.grey],
        begin: Alignment(1, 1),
        end: Alignment(-1, -1),
        stops: [0.4, 0.5, 0.6]),
    child: Container(
      width: screenSize.width * 0.9,
      height: screenSize.height * 0.7,
      child: Column(
        children: <Widget>[
          Container(
            width: screenSize.width * 0.78,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.12,
                        height: screenSize.width * 0.12,
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                      ),
                      SizedBox(width: screenSize.width * 0.03),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: screenSize.width * 0.4,
                              height: screenSize.height * 0.018,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(screenSize.width * 0.02),
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            Container(
                              width: screenSize.width * 0.3,
                              height: screenSize.height * 0.013,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(screenSize.width * 0.01),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.065,
                        height: screenSize.height * 0.007,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.005),
                      Container(
                        width: screenSize.width * 0.065,
                        height: screenSize.height * 0.007,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.005),
                      Container(
                        width: screenSize.width * 0.065,
                        height: screenSize.height * 0.007,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenSize.height * 0.03),
          Container(
            width: screenSize.width * 0.83,
            height: screenSize.height * 0.487,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:
                  BorderRadius.all(Radius.circular(screenSize.width * 0.02)),
            ),
          ),
          SizedBox(height: screenSize.height * 0.03),
          Container(
            width: screenSize.width * 0.78,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: screenSize.width * 0.5,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.02,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.03),
                      Container(
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.02,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.06,
                  height: screenSize.width * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenSize.width * 0.01),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

shimmerStory(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return Shimmer(
    gradient: LinearGradient(
        colors: [Colors.grey, Colors.grey[350], Colors.grey],
        begin: Alignment(1, 1),
        end: Alignment(-1, -1),
        stops: [0.4, 0.5, 0.6]),
    child: Container(
      width: screenSize.width * 0.14,
      height: screenSize.width * 0.14,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    ),
  );
}

shimmerFeed(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return Shimmer(
    gradient: LinearGradient(
      colors: [Colors.grey, Colors.grey[350], Colors.grey],
      begin: Alignment(1, 1),
      end: Alignment(-1, -1),
      stops: [0.4, 0.5, 0.6],
    ),
    child: Container(
      width: screenSize.width,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: screenSize.width * 0.646,
                  height: screenSize.width * 0.646,
                  color: Colors.grey,
                ),
                Container(
                  height: screenSize.width * 0.646,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.35,
                        height: screenSize.width * 0.321,
                        color: Colors.grey,
                      ),
                      Container(
                        width: screenSize.width * 0.35,
                        height: screenSize.width * 0.321,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: screenSize.width * 0.004),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: screenSize.width * 0.32,
                  height: screenSize.width * 0.321,
                  color: Colors.grey,
                ),
                Container(
                  width: screenSize.width * 0.322,
                  height: screenSize.width * 0.321,
                  color: Colors.grey,
                ),
                Container(
                  width: screenSize.width * 0.35,
                  height: screenSize.width * 0.321,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: screenSize.width * 0.004),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenSize.width * 0.646,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.32,
                        height: screenSize.width * 0.321,
                        color: Colors.grey,
                      ),
                      Container(
                        width: screenSize.width * 0.32,
                        height: screenSize.width * 0.321,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.675,
                  height: screenSize.width * 0.648,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

shimmerProfile(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return Shimmer(
    gradient: LinearGradient(
      colors: [Colors.grey, Colors.grey[350], Colors.grey],
      begin: Alignment(1, 1),
      end: Alignment(-1, -1),
      stops: [0.4, 0.5, 0.6],
    ),
    child: Container(
      width: screenSize.width,
      height: screenSize.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: screenSize.width * 0.05,
              left: screenSize.width * 0.05,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: screenSize.width * 0.065,
                  height: screenSize.height * 0.007,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenSize.width * 0.01),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.005),
                Container(
                  width: screenSize.width * 0.065,
                  height: screenSize.height * 0.007,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenSize.width * 0.01),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.005),
                Container(
                  width: screenSize.width * 0.065,
                  height: screenSize.height * 0.007,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenSize.width * 0.01),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenSize.height * 0.05),
          Container(
            width: screenSize.width,
            margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.045),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.45,
                        height: screenSize.height * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.03),
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Container(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.02,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.03),
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Container(
                        width: screenSize.width * 0.4,
                        height: screenSize.height * 0.02,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.03),
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Container(
                        width: screenSize.width * 0.5,
                        height: screenSize.height * 0.02,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.03),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.25,
                  height: screenSize.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenSize.width * 0.01),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Divider(
            color: Colors.grey,
            height: screenSize.height * 0.02,
            thickness: screenSize.width * 0.007,
            indent: screenSize.width * 0.05,
            endIndent: screenSize.width * 0.05,
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.08,
                        height: screenSize.width * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.014,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.08,
                        height: screenSize.width * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.014,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.08,
                        height: screenSize.width * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.014,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.01),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: screenSize.height * 0.02,
            thickness: screenSize.width * 0.007,
            indent: screenSize.width * 0.01,
            endIndent: screenSize.width * 0.01,
          ),
          SizedBox(height: screenSize.height * 0.01),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemCount: 12,
            itemBuilder: (context, i) {
              return Container(
                color: Colors.grey,
              );
            },
          )),
        ],
      ),
    ),
  );
}
