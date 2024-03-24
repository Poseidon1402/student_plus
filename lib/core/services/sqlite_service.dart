import 'package:sqflite/sqflite.dart';

abstract class SqliteService {

  static Future<Database> initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = '$databasePath/student.db';

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Students (number INTEGER PRIMARY KEY, name TEXT, math REAL, physics REAL, image_path TEXT)',
        );
      },
    );

    return database;
  }
}