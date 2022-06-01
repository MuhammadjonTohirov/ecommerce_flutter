// create enum StorageKeys
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

enum StorageKeys {
  appAccessToken,
  appRefreshToken,
}

class ShortStorage {
  static Future<String?> get(StorageKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.toString());
  }

  static Future<bool> set(StorageKeys key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key.toString(), value);
  }

  static Future<bool> remove(StorageKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key.toString());
  }
}
