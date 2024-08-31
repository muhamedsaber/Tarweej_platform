import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_field.dart';
import 'package:tarweej_platform/core/helpers/app_regex.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/notifier/login/login_state_notifier.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginNotifierProvider.notifier);
    return Form(
        key: notifier.formKey,
        child: Column(
          children: [
            AppTextField(
              controller: notifier.emailController,
              hintText: context.translate.email,
              validator: (word) {
                // validation process
                if (word == null || word.isEmpty) {
                  return context.translate.thisFieldIsRequired;
                } else if (!word.contains(AppRegex.email)) {
                  return context.translate.pleaseEnterValidEmail;
                } else {
                  return null;
                }
              },
            ),
            verticalSpace(16),
            AppTextField(
              controller: notifier.passwordController,
              hintText: context.translate.password,
              validator: (word) {
                // validation process
                // It Was a bigger validation process but I cut it.
                // After getting frustrated with Firebase Auth
                // There is no password reset code in firebase auth Firebase Cannot send email to the user
                // that contains the reset password code
                // it exists but it require Cloud Functions and I don't have money to pay for it
                // Fuck Firebase Auth

                if (word == null || word.isEmpty) {
                  return context.translate.thisFieldIsRequired;
                } else {
                  return null;
                }
              },
            ),
            verticalSpace(17),
            AppTextButton(
              width: context.screenWidth,
              title: context.translate.login,
              onPressed: () {
                if (notifier.formKey.currentState!.validate()) {
                  notifier.login();
                }
              },
            )
          ],
        ));
  }
}
