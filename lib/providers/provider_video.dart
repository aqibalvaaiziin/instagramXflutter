import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';

class ProviderVideo {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta.herokuapp.com",
  );
  static PreferencesData preferencesData = PreferencesData();
  static Dio dio = Dio(options);

  static Future getAllVideo() async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/video");
  }
}
