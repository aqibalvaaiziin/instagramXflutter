import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';

class ProviderUser {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta.herokuapp.com",
    connectTimeout: 5000,
    receiveTimeout: 3000,
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

  static Future getUserLoginProfile() async {
    String username = await preferencesData.getUsername();
    return dio.get("/user/$username");
  }
}
