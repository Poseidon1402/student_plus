import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/student_entity.dart';
import '../../domain/usecases/fetch_students.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final FetchStudents fetchStudents;

  StudentBloc({required this.fetchStudents}) : super(StudentInitialState()) {
    on<FetchStudentEvent>(_handleFetchStudentEvent);
    on<InsertStudentEvent>(_handleInsertStudentEvent);
    on<UpdateStudentEvent>(_handleUpdateStudentEvent);
    on<DeleteStudentEvent>(_handleDeleteStudentEvent);
  }

  void _handleFetchStudentEvent(
      FetchStudentEvent event, Emitter<StudentState> emit) async {
    emit(StudentLoadingState());
    final students = await fetchStudents();
    emit(StudentLoadedState(students: students));
  }

  void _handleInsertStudentEvent(
      InsertStudentEvent event, Emitter<StudentState> emit) async {
    emit(
      StudentLoadedState(
        students: [
          ...(state as StudentLoadedState).students,
          event.student,
        ],
      ),
    );
  }

  void _handleUpdateStudentEvent(
      UpdateStudentEvent event, Emitter<StudentState> emit) async {
    emit(
      StudentLoadedState(
        students: (state as StudentLoadedState).students.map(
          (student) {
            if (student.number == event.student.number) {
              return event.student;
            }

            return student;
          },
        ).toList(),
      ),
    );
  }

  void _handleDeleteStudentEvent(
      DeleteStudentEvent event, Emitter<StudentState> emit) async {
    emit(
      StudentLoadedState(
        students: (state as StudentLoadedState)
            .students
            .where((student) => student.number != event.number)
            .toList(),
      ),
    );
  }
}
