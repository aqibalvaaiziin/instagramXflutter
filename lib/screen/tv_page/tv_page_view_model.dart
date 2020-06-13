import 'package:flutter/material.dart';
import './tv_page.dart';

abstract class TvPageViewModel extends State<TvPage> {
  PageController controller = PageController(initialPage: 0,keepPage: true);
  
}
