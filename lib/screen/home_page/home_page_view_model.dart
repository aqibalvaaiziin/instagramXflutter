import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import 'package:instagramxflutter/redux/action/main_state_action.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:redux/redux.dart';
import './home_page.dart';
import 'package:collection/collection.dart';

abstract class HomePageViewModel extends State<HomePage> {
  bool isfav = false;
  bool isbooked = false;
  Function equals = const ListEquality().equals;
  bool contains = false;
  Store<AppState> store;

  Future initImageByFollowing() async {
    ProviderImage.getDataImageByFollow().then((value) {
      List jsonObject = value.data;
      store.dispatch(
        SetImageByFollowing(imageByFollowing: List.from(jsonObject)),
      );
    }).catchError((err) => print("ImageByFollowing : ${err.toString()}"));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store = StoreProvider.of<AppState>(context);
      await initImageByFollowing();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

