import 'package:flutter/material.dart';
import './scroll_feet_page_view.dart';

class ScrollFeetPage extends StatefulWidget {
  final String id;
  final String from;
  const ScrollFeetPage({
    Key key,
    this.id,
    this.from,
  }) : super(key: key);

  @override
  ScrollFeetPageView createState() => new ScrollFeetPageView();
}
