import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_template/app/app.dart';
import 'package:mobile_template/constants/constants.dart';
import 'package:mobile_template/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await TimeZoneUtil.initialize();
  await SharedPrefUtil().initialize();
  await LocalDbUtil.initialize();

  runApp(
    EasyLocalization(
      supportedLocales: Languages.supported,
      path: Languages.pathToFiles,
      fallbackLocale: Languages.fallback,
      child: const App(),
    ),
  );
}
