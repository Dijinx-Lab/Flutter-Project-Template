part of '../repositories.dart';

class SettingsRepo {
  final LocalSettingsRepo _localRepo = LocalSettingsRepo();

  SettingsRepo._privateConstructor();

  static final SettingsRepo _instance = SettingsRepo._privateConstructor();

  factory SettingsRepo() {
    return _instance;
  }

  Future<void> saveAppSettings(AppSettings settings) async {
    _localRepo.saveAppSettings(settings);
  }

  Future<AppSettings> getAppSettings() async {
    return _localRepo.getAppSettings();
  }
}
