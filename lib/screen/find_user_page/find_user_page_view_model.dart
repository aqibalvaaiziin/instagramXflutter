import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:redux/redux.dart';
import './find_user_page.dart';

abstract class FindUserPageViewModel extends State<FindUserPage> {
  TextEditingController search = TextEditingController();
  Timer _debounce;
  Store<AppState> store;
  bool isEmptyInput = true;
  List dataUser = List();
  List dataUserFound = List();
  PreferencesData preferencesData = PreferencesData();
  String username;
  bool changeInput() {
    if (search.text.isEmpty) {
      setState(() {
        isEmptyInput = true;
      });
    } else {
      setState(() {
        isEmptyInput = false;
      });
    }
    return isEmptyInput;
  }

  void onSearchTextChanged(String text) async {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      List searchResult = List();
      searchResult.addAll(dataUser);
      if (search != null) {
        List dummy = List();
        searchResult.forEach((item) {
          if (item['name'].toLowerCase().contains(text) ||
              item['username'].toLowerCase().contains(text)) {
            dummy.add(item);
          }
        });
        setState(() {
          dataUserFound.addAll(dummy);
        });
        return;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store = StoreProvider.of<AppState>(context);
      dataUser = store.state.mainState.users;
      preferencesData.getUsername().then((value) {
        setState(() {
          username = value;
        });
      });
    });
  }
}
