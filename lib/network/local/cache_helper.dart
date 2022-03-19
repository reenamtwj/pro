import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
    return sharedPreferences.getBool(key);
  }

  static Future<dynamic> saveData(
      {required String key, required dynamic value}) async {
    if (value == bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value == String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value == int) {
      return await sharedPreferences.setInt(key, value);
    }
    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static dynamic removeData({required String key}) {
    return sharedPreferences.remove(key);
  }
}
