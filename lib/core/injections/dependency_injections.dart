import 'package:get_it/get_it.dart';

import '../../data/sources/student_source.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<StudentSource>(
    () => StudentSourceImpl(),
  );
}
