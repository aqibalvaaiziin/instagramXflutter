import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagramxflutter/helper/data/dataJson.dart';
import 'package:instagramxflutter/screen/detail_feet/detail_feet.dart';
import 'package:instagramxflutter/screen/feet_page/widgets/item_category.dart';
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
              itemCount: DataFeet.dataFeet.length,
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
                print("$i ${DataFeet.dataFeet[i]['image']}");
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      routeTo(
                        DetailFeet(
                          avatar: DataFeet.dataFeet[i]['avatar'],
                          name: DataFeet.dataFeet[i]['name'],
                          time: DataFeet.dataFeet[i]['time'],
                          comments: DataFeet.dataFeet[i]['comment'],
                          likes: DataFeet.dataFeet[i]['likes'],
                          image: DataFeet.dataFeet[i]['image'],
                          caption: DataFeet.dataFeet[i]['caption'],
                          view: DataFeet.dataFeet[i]['view'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      DataFeet.dataFeet[i]['image'],
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
