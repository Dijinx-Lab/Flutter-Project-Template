part of 'constants.dart';

class Urls {
  //Api
  static const String baseV1Url = 'http://localhost:3000';

  static const String authenticate = '$baseV1Url/user/authenticate';

  static String tasks(int userId, {int? taskId}) {
    if (taskId != null) {
      return '$baseV1Url/user/$userId/tasks/$taskId';
    }
    return '$baseV1Url/user/$userId/tasks';
  }
}
