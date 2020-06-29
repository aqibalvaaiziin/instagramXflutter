import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramxflutter/providers/provider_video.dart';
import 'package:instagramxflutter/redux/action/main_state_action.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:redux/redux.dart';
import './video_page.dart';

abstract class VideoPageViewModel extends State<VideoPage> {
  PageController controller = PageController(initialPage: 0);
  TextEditingController inputComment = TextEditingController();
  bool isfav = false;
  List dataComment = List();
  String dataId;
  Store<AppState> store;


  Future initVideo() async {
    ProviderVideo.getAllVideo().then((res) {
      List jsonObject = res.data;
      store.dispatch(SetAllVideo(video: jsonObject));
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store = StoreProvider.of<AppState>(context);
      await initVideo();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
