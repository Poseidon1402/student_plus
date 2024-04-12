import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/colors/app_colors.dart';
import '../../core/constants/routes.dart';
import '../../core/validator/form_validators.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/input/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green4,
      resizeToAvoidBottomInset: false,
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                constraints: const BoxConstraints.expand(),
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Form(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/logo/MoyenneMaster1.svg'),
                      const Gap(30),
                      Text(
                        'A comprehensive view of academic performance',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.grey1),
                      ),
                      const Gap(30),
                      Expanded(
                        child: ListView(
                          children: [
                            Text('Login',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.green4)),
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
                              validator: isEmail,
                              hintTextColor: AppColors.grey3,
                              backgroundColor: AppColors.white2,
                            ),
                            const Gap(30),
                            CustomTextFormField(
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColors.grey3,
                              ),
                              hintText: 'Password',
                              borderRadius: 32,
                              obscureText: true,
                              validator: (value) => length(value, min: 8, max: 30),
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
                                      ?.copyWith(color: AppColors.green5),
                                  textAlign: TextAlign.end,
                                )),
                            const Gap(30),
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: CustomElevatedButton(
                                onPressed: () => context.go(Routes.home),
                                borderRadius: 32,
                                backgroundColor: AppColors.green4,
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
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account ? ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.white1),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: AppColors.green5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
