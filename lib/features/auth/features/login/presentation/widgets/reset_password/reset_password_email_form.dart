import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_field.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/notifier/reset_password.dart/reset_password_notifier.dart';

import '../../../../../../../core/helpers/app_regex.dart';

class ResetPasswordEmailForm extends ConsumerWidget {
  const ResetPasswordEmailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(resetPasswordNotifierProvider.notifier);
    final state = ref.watch(resetPasswordNotifierProvider);
    return Form(
      key: notifier.emailFormKey,
      child: Column(
        children: [
          verticalSpace(20),
          Text(
            context.translate.enterYourEmail,
            style: context.theme.font14OnSurfaceMedium,
          ),
          verticalSpace(20),
          AppTextField(
            validator: (word) {
              if (word == null || word.isEmpty) {
                return context.translate.thisFieldIsRequired;
              } else if (!word.contains(AppRegex.email)) {
                return context.translate.pleaseEnterValidEmail;
              } else {
                return null;
              }
            },
            hintText: context.translate.email,
            controller: notifier.emailController,
          ),
          verticalSpace(20),
          AppTextButton(
            isLoading: state is ResetPasswordLoading,
            width: context.screenWidth,
            title: context.translate.next,
            onPressed: () {
              if (notifier.emailFormKey.currentState!.validate()) {
                notifier.resetPassword();
              }
            },
          )
        ],
      ),
    );
  }
}
