import 'package:flutter/material.dart';
import './detail_feet_view.dart';

class DetailFeet extends StatefulWidget {
  final String id;
  final String avatar;
  final String name;
  final String time;
  final String image;
  final int likes;
  final int comments;
  final String caption;
  final int view;

  const DetailFeet({
    Key key,
    this.id,
    this.avatar,
    this.name,
    this.time,
    this.image,
    this.likes,
    this.comments,
    this.caption,
    this.view,
  }) : super(key: key);

  @override
  DetailFeetView createState() => new DetailFeetView();
}
