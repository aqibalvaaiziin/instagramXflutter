import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';

class ProviderImage {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta.herokuapp.com",
  );
  static PreferencesData preferencesData = PreferencesData();

  static Dio dio = Dio(options);

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

  static Future getLoginProfileImage() async {
    String token = await preferencesData.getToken();
    String username = await preferencesData.getUsername();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/image/by-user/$username");
  }
}
