part of 'utils.dart';

class SharedPrefUtil {
  static SharedPreferences? _sharedPreferences;

  factory SharedPrefUtil() => SharedPrefUtil._internal();

  SharedPrefUtil._internal();

  Future<void> initialize() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  // -----
  // App Settings
  // -----

  AppSettings get currentSettings {
    try {
      String? jsonData = _sharedPreferences!.getString(Keys.appSettings);
      if (jsonData == null || jsonData == '') {
        return AppSettings.defaultSettings;
      }
      return AppSettings.fromJson(json.decode(jsonData));
    } catch (e) {
      return AppSettings.defaultSettings;
    }
  }

  set currentSettings(AppSettings value) {
    try {
      final String jsonData = json.encode(value.toJson());
      _sharedPreferences!.setString(Keys.appSettings, jsonData);
    } catch (e) {
      _sharedPreferences!.setString(Keys.appSettings, '');
    }
  }
}
