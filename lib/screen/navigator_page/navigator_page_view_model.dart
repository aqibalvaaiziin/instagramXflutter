import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/providers/provider_user.dart';
import 'package:instagramxflutter/redux/action/main_state_action.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:redux/redux.dart';
import './navigator_page.dart';

abstract class NavigatorPageViewModel extends State<NavigatorPage> {
  String username;
  PreferencesData preferencesData = PreferencesData();
  Store<AppState> store;

  Future initAllUser() async {
    ProviderUser.getAllUsers().then((value) {
      List jsonObject = value.data;
      store.dispatch(
        SetUsers(users: List.from(jsonObject)),
      );
    }).catchError((err) => print("users : ${err.toString()}"));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      preferencesData.getUsername().then((value) {
        setState(() {
          username = value;
        });
      });
      store = StoreProvider.of<AppState>(context);
      await initAllUser();
    });
  }
}
