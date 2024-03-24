import '../../domain/entity/student_entity.dart';
import '../../domain/repository/student_repository.dart';
import '../sources/student_source.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentSource _source;

  StudentRepositoryImpl(this._source);

  @override
  Future<List<StudentEntity>> fetchStudents() async => await _source.fetchStudents();
}