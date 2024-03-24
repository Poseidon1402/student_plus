import '../../domain/entity/student_entity.dart';
import '../../domain/repository/student_repository.dart';
import '../sources/student_source.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentSource source;

  StudentRepositoryImpl({required this.source});

  @override
  Future<List<StudentEntity>> fetchStudents() async => await source.fetchStudents();
}