part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StudentInitialState extends StudentState {}

class StudentLoadingState extends StudentState {}

class StudentLoadedState extends StudentState {
  final List<StudentEntity> students;

  StudentLoadedState({required this.students});

  @override
  List<Object?> get props => [students];
}