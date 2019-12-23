import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  /// 保存数据
  static Future<bool> setLocalStorage(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isOk = false;
    if (value is String) {
      isOk = await sharedPreferences.setString(key, value);
    } else if (value is int) {
      isOk = await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      isOk = await sharedPreferences.setBool(key, value);
    }
    return isOk;
  }

  /// 获取数据 String
  static Future<String> getStringLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(key);
    return data;
  }

  /// 获取数据 int
  static Future<int> getIntLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int data = sharedPreferences.getInt(key);
    return data;
  }

  /// 获取数据 bool
  static Future<bool> getBoolLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool data = sharedPreferences.getBool(key);
    return data;
  }

  /// 清除指定key
  static Future<bool> removeLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isOk = await sharedPreferences.remove(key);
    return isOk;
  }

  /// 清除所有key
  static Future<bool> removeAllLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isOk = await sharedPreferences.clear();
    return isOk;
  }
}
