import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final String number;
  final String name;
  final int math;
  final int physics;
  final int average;

  const StudentEntity({
    required this.number,
    required this.name,
    required this.math,
    required this.physics,
    required this.average,
  });

  @override
  List<Object?> get props => [number, name, math, physics, average];
}