import '../entity/student_entity.dart';
import '../repository/student_repository.dart';

abstract class FetchStudents {
  Future<List<StudentEntity>> call();
}

class FetchStudentsImpl implements FetchStudents {
  final StudentRepository repository;

  FetchStudentsImpl({required this.repository});

  @override
  Future<List<StudentEntity>> call() async {
    return await repository.fetchStudents();
  }
}