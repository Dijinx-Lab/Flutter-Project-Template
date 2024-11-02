part of '../models.dart';

class AppSettings {
  AppTheme theme;
  String locale;
  // String region;

  AppSettings({
    required this.theme,
    required this.locale,
    // required this.region,
  });

  static AppSettings get defaultSettings => AppSettings(
        theme: AppTheme.light,
        locale: Languages.defaultLocale,
        // region: Languages.defaultRegion,
      );

  Map<String, Object?> toMap() {
    return {
      'theme': theme.index,
      'locale': locale,
      // 'region': region,
    };
  }

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      theme: AppTheme.values[json['theme']],
      locale: json['locale'] ?? Languages.defaultLocale,
      // region: json['region'] ?? Languages.defaultRegion,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme.index,
      'locale': locale,
      // 'region': region,
    };
  }
}
