import 'package:dio/dio.dart';
import 'package:instagramxflutter/helper/preferences/preferences.dart';
import 'package:path_provider/path_provider.dart';

class ProviderVideo {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://serviceinsta2.herokuapp.com",
  );
  static PreferencesData preferencesData = PreferencesData();
  static Dio dio = Dio(options);

static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  static Future getAllVideo() async {
    String token = await preferencesData.getToken();
    dio.options.headers['Authorization'] = "bearer $token";
    return await dio.get("/video");
  }

  static Future postVideo(file, caption) async {
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
      await dio.post("/video", data: formData);
    } catch (e) {
      print(e.toString());
    }
  }
}
