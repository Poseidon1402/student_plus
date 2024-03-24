import '../entity/student_entity.dart';

abstract class StudentRepository {
  Future<List<StudentEntity>> fetchStudents();
}