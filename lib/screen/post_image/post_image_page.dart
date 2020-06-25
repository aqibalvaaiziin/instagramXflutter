import 'package:flutter/material.dart';
import './post_image_page_view.dart';

class PostImagePage extends StatefulWidget {
  final dataImage;

  const PostImagePage({
    Key key,
    this.dataImage,
  }) : super(key: key);

  @override
  PostImagePageView createState() => new PostImagePageView();
}
