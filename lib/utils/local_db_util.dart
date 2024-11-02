part of 'utils.dart';

class LocalDbUtil {
  static Future<void> initialize() async {
    await openDatabase(
      join(await getDatabasesPath(), Keys.dbName),
      version: await _getDbVersion(),
      onCreate: (db, version) async {
        await _runCreateScript(db);
      },
    );
  }

  static Future<int> _getDbVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    final pieces = version.split('.');
    return int.parse(pieces[0]) * 100 + int.parse(pieces[1]);
  }

  static Future<void> _runCreateScript(Database db) async {
    var batch = db.batch();

    batch.execute('''
    CREATE TABLE IF NOT EXISTS ${Keys.tasksTable} (
      ${Keys.id} INTEGER PRIMARY KEY,
      userId INTEGER,
      title TEXT,
      description TEXT,
      dueAt TEXT,
      status TEXT,
      ${Keys.json} TEXT, 
      ${Keys.createdAt} TEXT
    )
  ''');

    //Add more as needed
    await batch.commit(noResult: true);
  }
}
