import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_field.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/signup/presentation/notifiers/password/password_change_notifier.dart';
import 'package:tarweej_platform/features/auth/features/signup/presentation/notifiers/password/password_state.dart';
part 'password_validation_guide.dart';
part 'password_validation_step.dart';
part 'password_validation_steps.dart';
part 'password_validation_success.dart';

class PasswordFieldWithValidationGuide extends StatelessWidget {
  const PasswordFieldWithValidationGuide({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      PasswordChangeNotifier().updatePasswordState(controller.text);
    });
    return Column(
      children: [
        AppTextField(
          controller: controller,
          hintText: context.translate.password,
          validator: (word) {
            if (word == null || word.isEmpty) {
              return context.translate.thisFieldIsRequired;
            }
            return null;
          },
        ),
        verticalSpace(10),
        const PasswordValidationGuide()
      ],
    );
  }
}
