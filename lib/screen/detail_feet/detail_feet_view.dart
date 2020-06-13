import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/detail_feet/widgets/comment_section.dart';
import 'package:instagramxflutter/screen/detail_feet/widgets/feet_header.dart';
import '../../helper/data/dataJson.dart';
import './detail_feet_view_model.dart';

class DetailFeetView extends DetailFeetViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: commentSection(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: titleFeet(context, widget),
            pinned: true,
            centerTitle: true,
            expandedHeight: screenSize.height * 0.75,
            flexibleSpace: FlexibleSpaceBar(
              background: feetHeader(context, widget),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(DataComment.dataComment
                .map((item) => listComments(context, item))
                .toList()),
          ),
        ],
      ),
    );
  }
}
