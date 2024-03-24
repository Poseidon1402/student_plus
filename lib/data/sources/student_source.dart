import 'package:sqflite/sqflite.dart';

import '../../core/error/exceptions.dart';
import '../../core/services/sqlite_service.dart';
import '../../domain/entity/student_entity.dart';
import '../models/student_model.dart';

abstract class StudentSource {
  Future<List<StudentEntity>> fetchStudents();
  Future<StudentEntity> insertStudent(StudentModel student);
  Future<StudentEntity> updateStudent(StudentModel student);
  Future<bool> deleteStudent(int number);
}

class StudentSourceImpl implements StudentSource {
  @override
  Future<List<StudentEntity>> fetchStudents() async {
    final database = await SqliteService.initDatabase();

    List<Map<String, dynamic>> data =
        await database.rawQuery('SELECT * FROM Students');
    List<StudentEntity> students =
        data.map((e) => StudentModel.fromMap(e)).toList();

    return students;
  }

  @override
  Future<StudentEntity> insertStudent(StudentModel student) async {
    final database = await SqliteService.initDatabase();

    final user = await database.query(
      'Students',
      where: 'number = ?',
      whereArgs: [student.number],
    );

    if(user.isNotEmpty) {
      throw DuplicatedException();
    }

    await database.insert('Students', student.toMap());

    return student;
  }

  @override
  Future<StudentEntity> updateStudent(StudentModel student) async {
    final database = await SqliteService.initDatabase();

    await database.update(
      'Students',
      student.toMap(),
      where: 'number = ?',
      whereArgs: [student.number],
    );

    return student;
  }

  @override
  Future<bool> deleteStudent(int number) async {
    final database = await SqliteService.initDatabase();

    await database.delete('Students', where: 'number = ?', whereArgs: [number]);

    return true;
  }
}
