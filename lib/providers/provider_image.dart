
import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';

class ProviderImage {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta.herokuapp.com",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static PreferencesData preferencesData = PreferencesData();

  static Dio dio = Dio(options);

  static Future getAllImage() async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/image");
  }
}
