import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_essentials/app/bloc/app_bloc.dart';
import 'package:flutter_essentials/constants/constants.dart';
import 'package:flutter_essentials/views/splash/splash_screen.dart';
import 'package:flutter_essentials/views/test/widget_display_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (providerContext) => AppBloc()..add(AppStartedEvent()),
      child: BlocConsumer<AppBloc, AppState>(
          listener: (listenerContext, state) async {
        if (state is AppReady) {
          await context.setLocale(Locale(
            state.locale.isEmpty ? Languages.defaultLocale : state.locale,
          ));
        }
      }, builder: (builderContext, state) {
        if (state is AppReady) {
          return MaterialApp(
              title: Keys.appName,
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              navigatorObservers: [FlutterSmartDialog.observer],
              builder: FlutterSmartDialog.init(),
              locale: state.locale.isEmpty
                  ? Languages.fallback
                  : Locale(state.locale),
              home: _getStartPage(state));
        }

        return const MaterialApp(
          home: SplashScreen(),
        );
      }),
    );
  }

  _getStartPage(AppState state) {
    return const WidgetDisplayScreen();
    // return AuthScreen();
  }
}
