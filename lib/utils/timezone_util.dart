part of 'utils.dart';

class TimeZoneUtil {
  static Future<void> initialize() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();

    final tz.Location location = tz.getLocation(timeZoneName);

    tz.setLocalLocation(location);
  }

  static DateTime toLocalTime(String utcTimeString) {
    DateTime utcDateTime = DateTime.parse(utcTimeString);
    final tz.TZDateTime utcTZDateTime = tz.TZDateTime.utc(
      utcDateTime.year,
      utcDateTime.month,
      utcDateTime.day,
      utcDateTime.hour,
      utcDateTime.minute,
      utcDateTime.second,
      utcDateTime.millisecond,
      utcDateTime.microsecond,
    );
    final tz.TZDateTime localDateTime = utcTZDateTime.toLocal();
    return localDateTime;
  }
}
