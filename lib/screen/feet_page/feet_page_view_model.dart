import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import 'package:instagramxflutter/redux/action/main_state_action.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:instagramxflutter/screen/find_user_page/find_user_page.dart';
import 'package:instagramxflutter/widgets/route_animation.dart';
import 'package:redux/redux.dart';
import './feet_page.dart';

abstract class FeetPageViewModel extends State<FeetPage> {
  Store<AppState> store;

  List dataCategory = [
    {"text": "Shop"},
    {"text": "Decor"},
    {"text": "Travel"},
    {"text": "Architecture"},
    {"text": "Food"},
    {"text": "Art"},
    {"text": "Style"},
  ];

  gotToFindUser() {
    Navigator.of(context).push(routeToV(FindUserPage()));
  }

  Future initAllImage() async {
    ProviderImage.getAllImage().then((value) {
      List jsonObject = value.data;
      store.dispatch(SetAllImage(allImage: List.from(jsonObject)));
    }).catchError((err) => print("AllImage : ${err.toString()}"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store = StoreProvider.of<AppState>(context);
      await initAllImage();
    });
  }
}
