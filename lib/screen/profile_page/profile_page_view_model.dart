import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import 'package:instagramxflutter/redux/action/main_state_action.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:redux/redux.dart';
import './profile_page.dart';

abstract class ProfilePageViewModel extends State<ProfilePage> {
  ScrollController scrollController = ScrollController();
  double dataOffset = 0.0;
  PreferencesData preferencesData = PreferencesData();
  String username;
  Store<AppState> store;
  FSBStatus drawerStatus;

  Future initImageProfile() async {
    store.dispatch(SetImageProfile(imageProfile: []));
    preferencesData.getUsername().then((username) {
      ProviderImage.getProfileImage(username).then((value) {
        List jsonObject = value.data;
        store.dispatch(
          SetImageProfile(imageProfile: jsonObject),
        );
      }).catchError((err) => print("Image Profile : ${err.toString()}"));
    })
      ..catchError((err) => print("pref User : ${err.toString()}"));
  }

  Future initImageOtherProfile() async {
    store.dispatch(SetImageProfile(imageProfile: []));
    ProviderImage.getProfileImage(widget.username).then((value) {
      var jsonObject = value.data;
      store.dispatch(
        SetImageProfile(imageProfile: jsonObject),
      );
    }).catchError((err) => print("Image Other Profile : ${err.toString()}"));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store = StoreProvider.of<AppState>(context);
      if (widget.isMe) {
        await initImageProfile();
      } else {
        await initImageOtherProfile();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
