import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {

  static const KEY_BASIC_AUTH = "basic_auth";

  Future<String> getBasicAuth() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(KEY_BASIC_AUTH);
  }

  void setBasicAuth(String value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(KEY_BASIC_AUTH, value);
  }
}