import 'package:flutter/material.dart';
import './feet_page_view.dart';

class FeetPage extends StatefulWidget {
  final bool isFeet;

  const FeetPage({
    Key key,
    this.isFeet,
  }) : super(key: key);

  @override
  FeetPageView createState() => new FeetPageView();
}
