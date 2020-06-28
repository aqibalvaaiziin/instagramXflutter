import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';

class ProviderVideoComment {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta2.herokuapp.com",
  );
  static PreferencesData preferencesData = PreferencesData();

  static Dio dio = Dio(options);

  static Future getAllComment(String idVideo) async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/comment/video/$idVideo");
  }

  static Future addComment(String idVideo, String comment) async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";

    return await dio.post(
      "/comment/video/$idVideo",
      data: {
        "comment": comment,
      },
    );
  }
}
