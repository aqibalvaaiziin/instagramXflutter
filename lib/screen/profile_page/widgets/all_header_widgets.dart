import 'package:flutter/material.dart';

imageProfile(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Column(
    children: <Widget>[
      Container(
        width: screenSize.width * 0.24,
        height: screenSize.width * 0.24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/avatar/woman2.jpg",
            ),
            fit: BoxFit.fitWidth,
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xff828282).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(-4, 4))
          ],
        ),
      ),
    ],
  );
}

descProfile(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: screenSize.width * 0.02),
                child: Text(
                  "Federica Sarawana",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: screenSize.height * 0.015),
        Container(
          padding: EdgeInsets.only(left: screenSize.width * 0.02),
          width: screenSize.width * 0.6,
          child: Text(
            "facere sunt voluptatibus corrupti incidunt, maxime aspernatur error? Sequi sit consectetur minima doloremque? Dignissimos minus sunt rem quaerat.",
            maxLines: 3,
            style: TextStyle(
                color: Colors.grey,
                height: screenSize.height * 0.0013,
                fontSize: screenSize.width * 0.03),
          ),
        ),
        SizedBox(height: screenSize.height * 0.018),
        Container(
          padding: EdgeInsets.only(left: screenSize.width * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.lightbulb_outline,
                size: screenSize.width * 0.04,
              ),
              SizedBox(width: screenSize.width * 0.01),
              Text(
                "Paris, ",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: screenSize.width * 0.035,
                ),
              ),
              Text(
                " France",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: screenSize.width * 0.035,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

statsProfile(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    child: Column(
      children: <Widget>[
        Divider(
          color: Colors.white,
          height: 2,
          thickness: 1,
          indent: screenSize.width * 0.05,
          endIndent: screenSize.width * 0.05,
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height * 0.085,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "8",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Posted",
                        style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "102K",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "100",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          height: 2,
          thickness: 1,
          indent: screenSize.width * 0.02,
          endIndent: screenSize.width * 0.02,
        ),
      ],
    ),
  );
}

followButton(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.003),
    width: screenSize.width * 0.4,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(
        Radius.circular(screenSize.width * 0.01),
      ),
    ),
    child: InkWell(
      splashColor: Colors.grey,
      onTap: () {},
      child: Center(
        child: Text(
          "Follow",
          style: TextStyle(
            fontSize: screenSize.width * 0.043,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

messageButton(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.003),
    width: screenSize.width * 0.4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(screenSize.width * 0.01),
        ),
        border: Border.all(color: Colors.white)),
    child: InkWell(
      splashColor: Colors.grey,
      onTap: () {},
      child: Center(
        child: Text(
          "Messege",
          style: TextStyle(
            fontSize: screenSize.width * 0.043,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
