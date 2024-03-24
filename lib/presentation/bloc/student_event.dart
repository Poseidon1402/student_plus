part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStudentEvent extends StudentEvent {}