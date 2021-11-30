import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteClient {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'board_database_v2.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE tasks(id VARCHAR(255) PRIMARY KEY, title VARCHAR(255), description TEXT, dueDateTime VARCHAR(255), status VARCHAR(255))",
        );
      },
    );
  }
}
