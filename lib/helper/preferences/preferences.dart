import 'package:shared_preferences/shared_preferences.dart';

class PreferencesData {
  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringValue = preferences.getString("token");
    return stringValue;
  }

  Future setToken(String data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", data);
  }
}
