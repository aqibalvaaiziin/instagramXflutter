import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagramxflutter/screen/feet_page/widgets/item_category.dart';
import 'package:instagramxflutter/screen/scroll_feet_page/scroll_feet_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import './feet_page_view_model.dart';

class FeetPageView extends FeetPageViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: screenSize.width * 0.07,
              left: screenSize.width * 0.06,
              right: screenSize.width * 0.06,
            ),
            width: screenSize.width,
            height: screenSize.height * 0.05,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  size: screenSize.width * 0.055,
                ),
              ),
            ),
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
          Expanded(
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.01,
              ),
              crossAxisSpacing: 3,
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              itemCount: allFeet.length,
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
                          id: allFeet[i]['_id'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Image.network(
                      allFeet[i]['imageLink'],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
