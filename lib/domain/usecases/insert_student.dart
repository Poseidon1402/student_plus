import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/models/student_model.dart';
import '../entity/student_entity.dart';
import '../repository/student_repository.dart';

abstract class InsertStudent {
  Future<Either<Failure, StudentEntity>> call(StudentModel student);
}

class InsertStudentImpl implements InsertStudent {
  final StudentRepository repository;

  InsertStudentImpl({required this.repository});

  @override
  Future<Either<Failure, StudentEntity>> call(StudentModel student) async {
    return await repository.insertStudent(student);
  }
}