part of 'constants.dart';

class Languages {
  static const List<Locale> supported = [
    fallback,
    Locale('fr'),
  ];

  static const String pathToFiles = 'assets/translations';

  static const String defaultLocale = 'en';

  static const Locale fallback = Locale(defaultLocale);
}
