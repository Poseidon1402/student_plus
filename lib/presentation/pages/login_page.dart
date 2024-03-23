import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/colors/app_colors.dart';
import '../../core/constants/routes.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/input/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceCadet,
      resizeToAvoidBottomInset: false,
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            const Gap(50),
            SvgPicture.asset('assets/logo/logo1.svg'),
            const Gap(30),
            Text(
              'The ultimate application for teachers',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.white1),
            ),
            const Gap(30),
            Expanded(
              child: Container(
                constraints: const BoxConstraints.expand(),
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Text('Login',
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(
                            'To access your account',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.grey1),
                          ),
                          const Gap(30),
                          const CustomTextFormField(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: AppColors.grey3,
                            ),
                            hintText: 'Email',
                            borderRadius: 32,
                            hintTextColor: AppColors.grey3,
                            backgroundColor: AppColors.white2,
                          ),
                          const Gap(30),
                          const CustomTextFormField(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: AppColors.grey3,
                            ),
                            hintText: 'Password',
                            borderRadius: 32,
                            hintTextColor: AppColors.grey3,
                            backgroundColor: AppColors.white2,
                          ),
                          const Gap(30),
                          Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Forgot password ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.ultraPurple),
                                textAlign: TextAlign.end,
                              )),
                          const Gap(30),
                          FractionallySizedBox(
                            widthFactor: 1,
                            child: CustomElevatedButton(
                              onPressed: () => context.go(Routes.home),
                              borderRadius: 32,
                              backgroundColor: AppColors.spaceCadet,
                              child: Text(
                                'Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: AppColors.white1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account ? ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.spaceCadet),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.ultraPurple,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
