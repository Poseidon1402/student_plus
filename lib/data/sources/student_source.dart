import 'package:sqflite/sqflite.dart';

import '../../domain/entity/student_entity.dart';
import '../models/student_model.dart';

abstract class StudentSource {
  Future<List<StudentEntity>> fetchStudents();
  Future<void> initDatabase();
}

class StudentSourceImpl implements StudentSource {
  late final Database database;

  StudentSourceImpl() {
    initDatabase().then((database) => this.database = database);
  }

  @override
  Future<Database> initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = '$databasePath/student.db';

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Students (number INTEGER PRIMARY KEY, name TEXT, math REAL, physics REAL, average REAL)',
        );
      },
    );

    return database;
  }

  @override
  Future<List<StudentEntity>> fetchStudents() async {
    List<Map<String, dynamic>> data = await database.rawQuery('SELECT * FROM Studens');
    List<StudentEntity> students = data.map((e) => StudentModel.fromMap(e)).toList();

    return students;
  }
}
