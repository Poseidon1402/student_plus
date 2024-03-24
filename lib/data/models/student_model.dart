import '../../domain/entity/student_entity.dart';

class StudentModel extends StudentEntity {
  const StudentModel({
    required super.number,
    required super.name,
    required super.math,
    required super.physics,
    required super.average,
    required super.imagePath,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) => StudentModel(
        number: map['number'],
        name: map['name'],
        math: map['math'],
        physics: map['physics'],
        imagePath: map['image_path'],
        average: map['physics'] * map['math'] / 2,
      );

  Map<String, dynamic> toMap() => {
    'number': super.number,
    'name': super.name,
    'math': super.math,
    'physics': super.physics,
    'image_path': super.imagePath,
  };
}
