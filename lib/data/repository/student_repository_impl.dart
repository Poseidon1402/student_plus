import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entity/student_entity.dart';
import '../../domain/repository/student_repository.dart';
import '../models/student_model.dart';
import '../sources/student_source.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentSource source;

  StudentRepositoryImpl({required this.source});

  @override
  Future<List<StudentEntity>> fetchStudents() async => await source.fetchStudents();

  @override
  Future<Either<Failure, StudentEntity>> insertStudent(StudentModel student) async {
    try {
      return Right(await source.insertStudent(student));
    } on DuplicatedException {
      return const Left(DuplicatedFailure());
    }
  }
}