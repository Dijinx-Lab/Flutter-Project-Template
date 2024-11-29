part of 'routes.dart';

class EssentialNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static const List<String> upTransitionRoutes = [];

  static Route<dynamic> routeTable(RouteSettings settings) {
    Widget page = _routeNameMapper(settings.name ?? "");

    if (upTransitionRoutes.contains(settings.name)) {
      return RouteTransitions.up(page, settings);
    }

    return MaterialPageRoute<dynamic>(settings: settings, builder: (_) => page);
  }

  static Widget _routeNameMapper(String route) {
    switch (route) {
      case Routes.splash:
        return const SplashScreen();
      case Routes.display:
        return const WidgetDisplayScreen();
      case Routes.unrecoverableError:
        return const UnrecoverableErrorScreen();
      default:
        return const UnrecoverableErrorScreen();
    }
  }
}
