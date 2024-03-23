import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/colors/app_colors.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/input/custom_text_form_field.dart';

class RegisterStudentPage extends StatelessWidget {
  const RegisterStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.75,
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
            DottedBorder(
              borderType: BorderType.RRect,
              color: AppColors.black1.withOpacity(0.64),
              radius: const Radius.circular(24),
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 170,
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/tabler_photo_plus.svg'),
                    const Gap(50),
                    Text(
                      'Add a photo',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.black1.withOpacity(0.64)),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(30),
            Expanded(
              flex: 2,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                children: const [
                  CustomTextFormField(
                    hintText: 'Number',
                    borderRadius: 24,
                    hintTextColor: AppColors.grey3,
                    backgroundColor: AppColors.white2,
                  ),
                  Gap(10),
                  CustomTextFormField(
                    hintText: 'Name',
                    borderRadius: 24,
                    hintTextColor: AppColors.grey3,
                    backgroundColor: AppColors.white2,
                  ),
                  Gap(10),
                  CustomTextFormField(
                    hintText: 'Mathematical note',
                    borderRadius: 24,
                    hintTextColor: AppColors.grey3,
                    backgroundColor: AppColors.white2,
                  ),
                  Gap(10),
                  CustomTextFormField(
                    hintText: 'Physical note',
                    borderRadius: 24,
                    hintTextColor: AppColors.grey3,
                    backgroundColor: AppColors.white2,
                  ),
                ],
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: CustomElevatedButton(
                onPressed: () {},
                borderRadius: 32,
                backgroundColor: AppColors.spaceCadet,
                child: Text(
                  'Add',
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
}