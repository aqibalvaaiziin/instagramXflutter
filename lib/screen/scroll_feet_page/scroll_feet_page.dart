import 'package:flutter/material.dart';
import './scroll_feet_page_view.dart';

class ScrollFeetPage extends StatefulWidget {
  final String id;

  const ScrollFeetPage({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  ScrollFeetPageView createState() => new ScrollFeetPageView();
}
