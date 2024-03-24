import '../repository/student_repository.dart';

abstract class DeleteStudent {
  Future<bool> call(int number);
}

class DeleteStudentImpl implements DeleteStudent {
  final StudentRepository repository;

  DeleteStudentImpl({required this.repository});

  @override
  Future<bool> call(int number) async {
    return await repository.deleteStudent(number);
  }
}