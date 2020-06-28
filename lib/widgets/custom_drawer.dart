import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final screeSize = mediaQuery.size;
    return Container(
      color: Color(0xff333333),
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: screeSize.height * 0.3,
            color: Colors.grey.withAlpha(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                  width: screeSize.width * 0.35,
                  height: screeSize.width * 0.35,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Instagram",
                  style: TextStyle(
                      fontSize: screeSize.width * 0.06,
                      fontFamily: "vegan",
                      letterSpacing: 1.5),
                )
              ],
            ),
          ),
          Container(
            height: screeSize.height * 0.585,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped Log Out");
                        },
                        leading: Icon(FontAwesome.pencil_square_o,
                            size: screeSize.width * 0.06),
                        title: Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: screeSize.width * 0.045),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped Log Out");
                        },
                        leading:
                            Icon(FontAwesome.key, size: screeSize.width * 0.06),
                        title: Text(
                          "Edit Password",
                          style: TextStyle(fontSize: screeSize.width * 0.045),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          debugPrint("Tapped Log Out");
                        },
                        leading:
                            Icon(Icons.bookmark, size: screeSize.width * 0.06),
                        title: Text(
                          "Saved",
                          style: TextStyle(fontSize: screeSize.width * 0.045),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    debugPrint("Tapped Log Out");
                  },
                  leading:
                      Icon(Icons.exit_to_app, size: screeSize.width * 0.06),
                  title: Text(
                    "Log Out",
                    style: TextStyle(fontSize: screeSize.width * 0.045),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
