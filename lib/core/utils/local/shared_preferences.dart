import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/constant/cached_key.dart';

class CacheData {
  static late SharedPreferences preferences;

  static Future<void> cacheInitialization() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) return await preferences.setInt(key, value);
    if (value is String) return await preferences.setString(key, value);
    if (value is double) return await preferences.setDouble(key, value);
    if (value is bool) return await preferences.setBool(key, value);

    throw UnsupportedError('Unsupported value type: ${value.runtimeType}');
  }

  static T? getData<T>({required String key}) {
    return preferences.get(key) as T?;
  }

  static Future<bool> deleteData({required String key}) async {
    return await preferences.remove(key);
  }

  static Future<void> addCity(String cityName) async {
    List<String> cities =
        preferences.getStringList(CachedKey.cachedListCity) ?? [];

    if (!cities.contains(cityName)) {
      cities.add(cityName);
      await preferences.setStringList(CachedKey.cachedListCity, cities);
    }
  }

  static Future<bool> clearAllData() async {
    return await preferences.clear();
  }

  // Optional helpers:
  static int? getInt(String key) => preferences.getInt(key);
  static bool? getBool(String key) => preferences.getBool(key);
  static double? getDouble(String key) => preferences.getDouble(key);
  static String? getString(String key) => preferences.getString(key);
}
