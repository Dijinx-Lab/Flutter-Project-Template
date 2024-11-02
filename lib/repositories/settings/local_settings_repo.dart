part of '../repositories.dart';

class LocalSettingsRepo {
  final SharedPrefUtil _prefUtil = SharedPrefUtil();

  LocalSettingsRepo._privateConstructor();

  static final LocalSettingsRepo _instance =
      LocalSettingsRepo._privateConstructor();

  factory LocalSettingsRepo() {
    return _instance;
  }

  void saveAppSettings(AppSettings settings) async {
    _prefUtil.currentSettings = settings;
  }

  AppSettings getAppSettings() {
    return _prefUtil.currentSettings;
  }
}
