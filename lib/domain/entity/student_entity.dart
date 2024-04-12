import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final int number;
  final String name;
  final double average;
  final String imagePath;

  const StudentEntity({
    required this.number,
    required this.name,
    required this.average,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [number, name, average, imagePath];
}