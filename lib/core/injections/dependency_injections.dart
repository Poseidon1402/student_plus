import 'package:get_it/get_it.dart';

import '../../data/repository/student_repository_impl.dart';
import '../../data/sources/student_source.dart';
import '../../domain/repository/student_repository.dart';
import '../../domain/usecases/delete_student.dart';
import '../../domain/usecases/fetch_students.dart';
import '../../domain/usecases/insert_student.dart';
import '../../domain/usecases/update_student.dart';
import '../../presentation/bloc/student_bloc.dart';

final sl = GetIt.instance;

void setup() {
  // Bloc
  sl.registerFactory(
    () => StudentBloc(
      fetchStudents: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<FetchStudents>(
    () => FetchStudentsImpl(repository: sl()),
  );
  sl.registerLazySingleton<InsertStudent>(
    () => InsertStudentImpl(repository: sl()),
  );
  sl.registerLazySingleton<UpdateStudent>(
    () => UpdateStudentImpl(repository: sl()),
  );
  sl.registerLazySingleton<DeleteStudent>(
    () => DeleteStudentImpl(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<StudentRepository>(
    () => StudentRepositoryImpl(source: sl()),
  );

  // Source
  sl.registerLazySingleton<StudentSource>(
    () => StudentSourceImpl(),
  );
}
