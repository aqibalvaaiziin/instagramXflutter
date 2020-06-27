import 'dart:io';

import 'package:flutter/material.dart';
import './post_video_page_view.dart';

class PostVideoPage extends StatefulWidget {
  final File dataVideo;

  const PostVideoPage({Key key, this.dataVideo}) : super(key: key);

  @override
  PostVideoPageView createState() => new PostVideoPageView();
}
