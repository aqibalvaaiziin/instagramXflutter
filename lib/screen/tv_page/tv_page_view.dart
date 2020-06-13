import 'package:flutter/material.dart';
import 'package:instagramxflutter/screen/tv_page/widgets/video/animation_player.dart';
import './tv_page_view_model.dart';

class TvPageView extends TvPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationPlayer(),
    );
  }
}
