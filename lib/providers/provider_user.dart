import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';

class ProviderUser {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta2.herokuapp.com",
  );
  static PreferencesData preferencesData = PreferencesData();
  static Dio dio = Dio(options);
  static Response response;
  static Future login(String username, String password) async {
    try {
      response = await dio.post("/user/login", data: {
        "username": username,
        "password": password,
      });
      return response;
    } on DioError catch (e) {
      if (e.response.statusCode != 200) {
        print(e.toString());
      } else {
        print(e.request);
        print(e.message);
      }
    }
  }

  static Future register(
    String name,
    String username,
    String password,
  ) async {
    await dio.post("/user", data: {
      "name": name,
      "username": username,
      "password": password,
    });
  }

  static Future getUserProfile(username) async {
    return dio.get("/user/$username");
  }
}
