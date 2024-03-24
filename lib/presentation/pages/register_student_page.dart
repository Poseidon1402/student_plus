import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/colors/app_colors.dart';
import '../../core/injections/dependency_injections.dart';
import '../../core/validator/form_validators.dart';
import '../../data/models/student_model.dart';
import '../../domain/entity/student_entity.dart';
import '../../domain/usecases/insert_student.dart';
import '../../domain/usecases/update_student.dart';
import '../bloc/student_bloc.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/input/custom_text_form_field.dart';

class RegisterStudentPage extends StatefulWidget {
  final StudentEntity? student;

  const RegisterStudentPage({super.key, this.student});

  @override
  State<RegisterStudentPage> createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState extends State<RegisterStudentPage> {
  String? _img;
  late final TextEditingController _numberController;
  late final TextEditingController _nameController;
  late final TextEditingController _physicsController;
  late final TextEditingController _mathController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _img = widget.student?.imagePath;
    _numberController = TextEditingController(text: widget.student?.number.toString() ?? '');
    _nameController = TextEditingController(text: widget.student?.name ?? '');
    _mathController = TextEditingController(text: widget.student?.math.toString() ?? '');
    _physicsController = TextEditingController(text: widget.student?.physics.toString() ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).height * 0.78,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.close,
                  color: AppColors.ultraPurple,
                ),
              ),
            ),
            Text(
              'Add a student',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(30),
            GestureDetector(
              onTap: () => getImage(),
              child: Builder(builder: (context) {
                if (_img != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.file(
                      File(_img!),
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  );
                }

                return DottedBorder(
                  borderType: BorderType.RRect,
                  color: AppColors.black1.withOpacity(0.64),
                  radius: const Radius.circular(24),
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: SvgPicture.asset('assets/icons/tabler_photo_plus.svg')),
                        Text(
                          'Add a photo',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: AppColors.black1.withOpacity(0.64)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const Gap(10),
            Expanded(
              flex: 2,
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  children: [
                    CustomTextFormField(
                      controller: _numberController,
                      hintText: 'Number',
                      borderRadius: 24,
                      validator: (value) => length(
                        value,
                        min: 4,
                        max: 4,
                        maxMessage: 'Ce champ doit être composé de 4 chiffres',
                        minMessage: 'Ce champ doit être composé de 4 chiffres',
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(signed: true),
                      hintTextColor: AppColors.grey3,
                      backgroundColor: AppColors.white2,
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      controller: _nameController,
                      hintText: 'Name',
                      borderRadius: 24,
                      hintTextColor: AppColors.grey3,
                      validator: isRequired,
                      keyboardType: TextInputType.name,
                      backgroundColor: AppColors.white2,
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      controller: _mathController,
                      hintText: 'Mathematical note',
                      borderRadius: 24,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                      validator: (value) =>
                          intervalValue(value: value, min: 0, max: 20),
                      hintTextColor: AppColors.grey3,
                      backgroundColor: AppColors.white2,
                    ),
                    const Gap(10),
                    CustomTextFormField(
                      controller: _physicsController,
                      hintText: 'Physical note',
                      borderRadius: 24,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                      validator: (value) =>
                          intervalValue(value: value, min: 0, max: 20),
                      hintTextColor: AppColors.grey3,
                      backgroundColor: AppColors.white2,
                    ),
                  ],
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: CustomElevatedButton(
                onPressed: _insertStudent,
                borderRadius: 32,
                backgroundColor: AppColors.spaceCadet,
                child: Text(
                  widget.student != null ? 'Save' : 'Add',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.white1),
                ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }

  void _insertStudent() async {
    if (_formKey.currentState!.validate()) {
      if (widget.student != null) {
        sl<UpdateStudent>()
            .call(
          StudentModel(
            number: int.parse(_numberController.text),
            name: _nameController.text,
            imagePath: '$_img',
            math: double.parse(_mathController.text),
            physics: double.parse(_physicsController.text),
            average: (double.parse(_mathController.text) +
                    double.parse(_physicsController.text)) /
                2,
          ),
        )
            .then((student) {
          Fluttertoast.showToast(
            msg: 'Student updated successfully',
            textColor: AppColors.white1,
          );
          context.read<StudentBloc>().add(UpdateStudentEvent(student: student));
          context.pop();
        });
      } else {
        final result = await sl<InsertStudent>().call(
          StudentModel(
            number: int.parse(_numberController.text),
            name: _nameController.text,
            imagePath: '$_img',
            math: double.parse(_mathController.text),
            physics: double.parse(_physicsController.text),
            average: (double.parse(_mathController.text) +
                    double.parse(_physicsController.text)) /
                2,
          ),
        );

        result.fold(
            (failure) => Fluttertoast.showToast(
                  msg: failure.message,
                  textColor: AppColors.white1,
                  backgroundColor: AppColors.red1,
                ), (student) {
          Fluttertoast.showToast(
            msg: 'Student added successfully',
            textColor: AppColors.white1,
          );
          context.read<StudentBloc>().add(InsertStudentEvent(student: student));
          context.pop();
        });
      }
    }
  }

  Future getImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    final directory = await getExternalStorageDirectory();

    if (pickedFile != null) {
      if (directory != null) {
        await File(pickedFile.path)
            .copy(
              '${directory.path}/${pickedFile.name}',
            )
            .then(
              (file) => setState(() => _img = file.path),
            );
      }
    }
  }
}
