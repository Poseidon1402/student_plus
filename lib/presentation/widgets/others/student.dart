import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/colors/app_colors.dart';
import '../../../domain/entity/student_entity.dart';
import '../buttons/custom_elevated_button.dart';

class Student extends StatelessWidget {
  final StudentEntity student;

  const Student({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showModalBottomSheet(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(student.imagePath),
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '${student.name}\n',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                    text: '${student.number}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.grey2),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: AppColors.white3)),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Math\n',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: student.math.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.charcoal,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    TextSpan(
                      text: ' /20',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.grey2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: AppColors.white3)),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Phys\n',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: student.physics.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.charcoal,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    TextSpan(
                      text: ' /20',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.grey2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: AppColors.white3)),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Average\n',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: student.average.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.charcoal,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    TextSpan(
                      text: ' /20',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.grey2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(44),
                color: student.average >= 10 ? AppColors.green3.withOpacity(0.07) : AppColors.blue1.withOpacity(0.07),
              ),
              child: Text(
                student.average >= 10 ? 'Admitted' : 'Repeater',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: student.average >= 10 ? AppColors.green3 : AppColors.blue1,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (_) => Wrap(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.white3,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const Gap(30),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    borderRadius: 32,
                    backgroundColor: AppColors.spaceCadet,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.edit,
                          color: AppColors.white1,
                        ),
                        const Gap(15),
                        Text(
                          'Edit',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.white1),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(30),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    borderRadius: 32,
                    backgroundColor: AppColors.red3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delete,
                          color: AppColors.white1,
                        ),
                        const Gap(15),
                        Text(
                          'Delete',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.white1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
