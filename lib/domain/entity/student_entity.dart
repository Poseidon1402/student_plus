import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final String number;
  final String name;
  final double math;
  final double physics;
  final double average;
  final String imagePath;

  const StudentEntity({
    required this.number,
    required this.name,
    required this.math,
    required this.physics,
    required this.average,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [number, name, math, physics, average, imagePath];
}