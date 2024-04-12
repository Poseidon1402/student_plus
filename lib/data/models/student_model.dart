import '../../domain/entity/student_entity.dart';

class StudentModel extends StudentEntity {
  const StudentModel({
    required super.number,
    required super.name,
    required super.average,
    required super.imagePath,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) => StudentModel(
        number: map['number'],
        name: map['name'],
        imagePath: map['image_path'],
        average: map['average'],
      );

  Map<String, dynamic> toMap() => {
    'number': super.number,
    'name': super.name,
    'average': super.average,
    'image_path': super.imagePath,
  };
}
