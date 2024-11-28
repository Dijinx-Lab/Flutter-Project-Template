import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_essentials/app/app.dart';
import 'package:flutter_essentials/constants/constants.dart';
import 'package:flutter_essentials/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await TimeZoneUtil.initialize();
  await SharedPrefUtil().initialize();
  await LocalDbUtil.initialize();
  EasyLocalization.logger.enableBuildModes = [];

  runApp(
    EasyLocalization(
      supportedLocales: Languages.supported,
      path: Languages.pathToFiles,
      fallbackLocale: Languages.fallback,
      child: const App(),
    ),
  );
}