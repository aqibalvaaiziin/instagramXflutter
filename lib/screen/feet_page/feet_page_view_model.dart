import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagramxflutter/providers/provider_image.dart';
import './feet_page.dart';

abstract class FeetPageViewModel extends State<FeetPage> {
  List dataCategory = [
    {"text": "Shop"},
    {"text": "Decor"},
    {"text": "Travel"},
    {"text": "Architecture"},
    {"text": "Food"},
    {"text": "Art"},
    {"text": "Style"},
  ];
  List allFeet = [];

  getAllFeet() {
    ProviderImage.getAllImage().then((value) {
      var jsonObject = jsonDecode(jsonEncode(value.data));
      for (var item in jsonObject) {
        setState(() {
          allFeet.add(item);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getAllFeet();
  }
}
