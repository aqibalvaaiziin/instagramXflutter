import 'dart:typed_data';
import 'dart:io' as Io;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import './control_post_page.dart';
import 'package:jiffy/jiffy.dart';

abstract class ControlPostPageViewModel extends State<ControlPostPage> {
  TextEditingController captionController = TextEditingController();

  final picker = ImagePicker();
  bool inProcess = false;
  int selectedIndex;
  Uint8List decodeBytes;
  bool isLoading = false;
  var file;
  GlobalKey globalKey = new GlobalKey();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Widget isLoad() {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  setLoading() {
    setState(() {
      isLoading = true;
    });
  }

  Future convertImage() async {
    try {
      final path = await _localPath;
      var date = Jiffy(DateTime.now()).yMMMMEEEEdjm;
      file = Io.File("$path/$date.png");
      file.writeAsBytesSync(widget.dataPost);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    isLoading = false;
  }
}
