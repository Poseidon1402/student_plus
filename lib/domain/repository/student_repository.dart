import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/models/student_model.dart';
import '../entity/student_entity.dart';

abstract class StudentRepository {
  Future<List<StudentEntity>> fetchStudents();
  Future<Either<Failure, StudentEntity>> insertStudent(StudentModel student);
  Future<StudentEntity> updateStudent(StudentModel student);
  Future<bool> deleteStudent(int number);
}