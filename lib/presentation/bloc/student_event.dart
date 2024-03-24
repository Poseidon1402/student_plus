part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStudentEvent extends StudentEvent {}

class InsertStudentEvent extends StudentEvent {
  final StudentEntity student;

  InsertStudentEvent({required this.student});

  @override
  List<Object?> get props => [student];
}