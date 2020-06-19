import 'package:dio/dio.dart';

class ProviderUser {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta.herokuapp.com",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static Dio dio = Dio(options);
  static Future login(String username, String password) async {
    return dio.post("/user/login", data: {
      "username": username,
      "password": password,
    });
  }
}
