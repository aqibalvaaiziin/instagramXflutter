import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:instagramxflutter/redux/model/main_state_model.dart';
import 'package:instagramxflutter/screen/feet_page/widgets/item_category.dart';
import 'package:instagramxflutter/screen/scroll_feet_page/scroll_feet_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import 'package:instagramxflutter/widgets/shimmer.dart';
import './feet_page_view_model.dart';

class FeetPageView extends FeetPageViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Scaffold(
        body: StoreConnector<AppState, MainState>(
          converter: (store) => store.state.mainState,
          builder: (context, state) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => gotToFindUser(),
                  child: Container(
                      margin: EdgeInsets.only(
                        top: screenSize.width * 0.07,
                        left: screenSize.width * 0.05,
                        right: screenSize.width * 0.05,
                      ),
                      width: screenSize.width,
                      height: screenSize.height * 0.05,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            size: screenSize.width * 0.07,
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Container(
                            width: screenSize.width * 0.7,
                            child: Text(
                              "Search",
                              style: TextStyle(
                                fontSize: screenSize.width * 0.055,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.013,
                    bottom: screenSize.height * 0.013,
                    left: screenSize.width * 0.02,
                    right: screenSize.width * 0.02,
                  ),
                  width: screenSize.width,
                  height: screenSize.height * 0.03,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataCategory.length,
                    itemBuilder: (context, i) =>
                        listCategory(context, dataCategory[i]),
                  ),
                ),
                state.allImage.length > 0
                    ? Expanded(
                        child: StaggeredGridView.countBuilder(
                          padding: EdgeInsets.only(
                            top: screenSize.height * 0.01,
                          ),
                          crossAxisSpacing: 3,
                          crossAxisCount: 3,
                          mainAxisSpacing: 3,
                          itemCount: state.allImage.length,
                          staggeredTileBuilder: (i) {
                            var main = 0;
                            var cross = 0;
                            if (i % 3 == 0 && i % 4 == 0) {
                              cross = 2;
                              main = 2;
                            } else if (i % 3 == 1 && i % 4 - 2 == 1) {
                              cross = 2;
                              main = 2;
                            } else {
                              cross = 1;
                              main = 1;
                            }
                            return StaggeredTile.count(cross, main);
                          },
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  routeToV(
                                    ScrollFeetPage(
                                      id: state.allImage[i]['_id'],
                                      from: "imageFeet",
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Image.network(
                                  state.allImage[i]['imageLink'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: ListView(
                        children: <Widget>[
                          shimmerFeed(context),
                        ],
                      )),
              ],
            );
          },
        ),
      ),
    );
  }
}
