import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import './post_image_page.dart';
import 'dart:io' as Io;
import 'dart:ui' as ui;

abstract class PostImagePageViewModel extends State<PostImagePage> {
  Uint8List decodeBytes;
  GlobalKey globalKey = new GlobalKey();
  var file;
  int selectedIndex;
  bool isLoadImage = false;

  changeSelected(int i) {
    setState(() {
      selectedIndex = i;
      print(selectedIndex);
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // For your reference print the AppDoc directory
    print(directory.path);
    return directory.path;
  }

  Future<Uint8List> capturePng() async {
    if (mounted) {
      try {
        RenderRepaintBoundary boundary =
            globalKey.currentContext.findRenderObject();
        ui.Image image = await boundary.toImage(pixelRatio: 3.0 * 3.0);
        ByteData byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        var pngBytes = byteData.buffer.asUint8List();
        var bs64 = base64Encode(pngBytes);
        final path = await _localPath;
        setState(() {
          decodeBytes = base64Decode(bs64);
          file = Io.File("$path/decode.png");
          file.writeAsBytesSync(decodeBytes);
          print("dataku :  ${file.path}");
        });
        return pngBytes;
      } catch (e) {
        print(e);
      }
    } else {
      return null;
    }
    return null;
  }

  Widget isLoading() {
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
      isLoadImage = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    isLoadImage = false;
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }
}
