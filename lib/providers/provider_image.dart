import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:path_provider/path_provider.dart';

class ProviderImage {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta2.herokuapp.com",
  );
  static PreferencesData preferencesData = PreferencesData();

  static Dio dio = Dio(options);

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

//Get Image

  static Future getAllImage() async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/image");
  }

  static Future getOneImage(String id) async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/image/$id");
  }

  static Future getProfileImage(String username) async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/image/by-user/$username");
  }

  static Future getDataImageByFollow() async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/image/get/following");
  }

//Get Image

//Post Image

  static Future postImage(file, caption) async {
    try {
      final path = await _localPath;
      String token = await preferencesData.getToken();
      String dummyName = "$path/$file";
      String fileName = dummyName.split('/').last;
      dio.options.headers['Authorization'] = "bearer $token";
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file, filename: fileName),
        "caption": caption,
      });
      await dio.post("/image", data: formData);
    } catch (e) {
      print(e.toString());
    }
  }

//Post Image
}
