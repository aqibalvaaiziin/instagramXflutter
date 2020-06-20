import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';

class ProviderImageComment {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta.herokuapp.com",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static PreferencesData preferencesData = PreferencesData();

  static Dio dio = Dio(options);

  static Future getAllComment(String idImage) async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/comment/image/$idImage");
  }

  static Future addComment(String idImage, String comment) async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";

    return await dio.post(
      "/comment/image/$idImage",
      data: {
        "comment": comment,
      },
    );
  }
}
