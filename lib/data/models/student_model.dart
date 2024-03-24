import '../../domain/entity/student_entity.dart';

class StudentModel extends StudentEntity {
  const StudentModel({
    required super.number,
    required super.name,
    required super.math,
    required super.physics,
    required super.average,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) => StudentModel(
        number: map['number'],
        name: map['name'],
        math: map['math'],
        physics: map['physics'],
        average: map['physics'] * map['math'] / 2,
      );
}
