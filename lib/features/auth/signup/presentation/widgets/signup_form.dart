import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_field.dart';
import 'package:tarweej_platform/core/helpers/app_regex.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/signup/presentation/notifiers/signup/signup_state_notifier.dart';
import 'package:tarweej_platform/features/auth/signup/presentation/notifiers/password/password_change_notifier.dart';
import 'package:tarweej_platform/features/auth/signup/presentation/widgets/password_widgets/password_field_with_validation_guide.dart';
import 'package:tarweej_platform/features/auth/signup/presentation/widgets/singup_listener.dart';

class SignupForm extends ConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupNotifier = ref.read(signupNotifierProvider.notifier);
    final formKey = signupNotifier.formKey;
    final emailController = signupNotifier.emailController;
    final passwordController = signupNotifier.passwordController;

    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextField(
            hintText: context.translate.email,
            controller: emailController,
            validator: (data) {
              if (data.isNullOrEmpty()) {
                return context.translate.thisFieldIsRequired;
              } else if (!data!.contains(AppRegex.email)) {
                return context.translate.pleaseEnterValidEmail;
              }
              return null;
            },
          ),
          verticalSpace(16),
          PasswordFieldWithValidationGuide(
            controller: passwordController,
          ),
          verticalSpace(10),
          AppTextButton(
            title: context.translate.createAccount,
            width: context.screenWidth,
            onPressed: () {
              if (formKey.currentState!.validate() &&
                  //  check if the password is valid before signup
                  // if the password is not valid, the user will not be able to signup
                  PasswordChangeNotifier().passwordState.isPasswordValid) {
                signupNotifier.signup();
              }
            },
          ),
          const SignupListener()
        ],
      ),
    );
  }
}
