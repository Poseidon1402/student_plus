import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'RAJOELISON Aina Tiavina\n',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                  text: '2247',
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
                    style:
                    Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: '16.5',
                    style:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                    style:
                    Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: '16.5',
                    style:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                    style:
                    Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: '16.5',
                    style:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
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
              color: AppColors.green3.withOpacity(0.07),
            ),
            child: Text(
              'Admitted',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.green3,),
            ),
          ),
        ),
      ],
    );
  }
}