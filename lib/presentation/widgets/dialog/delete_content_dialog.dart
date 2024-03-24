import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/colors/app_colors.dart';
import '../buttons/custom_elevated_button.dart';

void deleteConfirmationDialog(
    {required BuildContext context,
    required VoidCallback onDeleteButtonTapped}) {
  showDialog(
    context: context,
    useRootNavigator: true,
    builder: (_) => AlertDialog.adaptive(
      elevation: 0.0,
      content: Wrap(
        children: [
          SizedBox(
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Image.asset('assets/images/on_delete.png'),
                ),
                const Gap(20),
                Text(
                  'Would you like to delete this student from the database ?',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap(20),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: CustomElevatedButton(
                    onPressed: onDeleteButtonTapped,
                    borderRadius: 12,
                    backgroundColor: AppColors.spaceCadet,
                    child: Text(
                      'Delete',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.white1),
                    ),
                  ),
                ),
                const Gap(10),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: CustomElevatedButton(
                    onPressed: () => context.pop(),
                    borderRadius: 12,
                    backgroundColor: AppColors.spaceCadet.withOpacity(0.1),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.spaceCadet),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
