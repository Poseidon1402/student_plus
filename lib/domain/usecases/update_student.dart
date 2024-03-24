import '../../data/models/student_model.dart';
import '../entity/student_entity.dart';
import '../repository/student_repository.dart';

abstract class UpdateStudent {
  Future<StudentEntity> call(StudentModel student);
}

class UpdateStudentImpl implements UpdateStudent {
  final StudentRepository repository;

  UpdateStudentImpl({required this.repository});

  @override
  Future<StudentEntity> call(StudentModel student) async {
    return await repository.updateStudent(student);
  }
}