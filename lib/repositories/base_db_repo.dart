part of 'repositories.dart';

abstract class BaseDbRepo {
  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), Keys.dbName),
    );
  }
}
