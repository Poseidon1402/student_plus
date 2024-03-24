import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../core/colors/app_colors.dart';
import '../../core/services/computation.dart';
import '../bloc/student_bloc.dart';
import '../widgets/input/custom_text_form_field.dart';
import '../widgets/others/student.dart';
import 'register_student_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<StudentBloc>().add(FetchStudentEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(builder: (context, state) {
      if (state is StudentLoadingState || state is StudentInitialState) {
        return const Center(child: CircularProgressIndicator());
      }

      final students = (state as StudentLoadedState).students;

      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Student lists',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextFormField(
                backgroundColor: AppColors.white2,
                borderRadius: 20,
                hintText: 'Search by name, number, ...',
                hintTextColor: AppColors.grey2,
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white1,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: AppColors.grey2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: _buildBody(context),
        bottomSheet: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: AppColors.white1,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Class average\n',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text:
                            '${Computation.getAverage(students.map((student) => student.average).toList()).toStringAsFixed(2)},',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: ' /20',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey3),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Minimum\n',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text:
                            '${Computation.getMinimum(students.map((student) => student.average).toList())}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: ' /20',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey3),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Maximum\n',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text:
                            '${Computation.getMaximum(students.map((student) => student.average).toList())}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: ' /20',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey3),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showRegisterStudentDialog(context),
          backgroundColor: AppColors.ultraPurple,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: AppColors.white1,
          ),
        ),
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
        ),
        child: Column(
          children: [
            _buildHeader(context),
            const Gap(20),
            Expanded(
              child: BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                final students = (state as StudentLoadedState).students;

                return ListView.separated(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Student(
                      student: students[index],
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(20),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (BuildContext context, state) {
        final students = (state as StudentLoadedState).students;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.spaceCadet,
                    borderRadius: BorderRadius.circular(8)),
                child: SvgPicture.asset('assets/icons/filter.svg'),
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(
                'Name',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Admitted',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: students
                              .where((student) => student.average >= 10)
                              .length
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: ' /${students.length}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.grey2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Repeater',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: students
                              .where((student) => student.average <= 10)
                              .length
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: ' /${students.length}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.grey2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Flexible(child: SizedBox()),
          ],
        );
      },
    );
  }

  void _showRegisterStudentDialog(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (_) => const RegisterStudentPage(),
    );
  }
}
