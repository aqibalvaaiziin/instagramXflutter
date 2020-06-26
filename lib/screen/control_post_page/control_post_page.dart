import 'package:flutter/material.dart';
import './control_post_page_view.dart';

class ControlPostPage extends StatefulWidget {
  final dataPost;
  final isImage;

  const ControlPostPage({
    Key key,
    this.dataPost,
    this.isImage,
  }) : super(key: key);

  @override
  ControlPostPageView createState() => new ControlPostPageView();
}
