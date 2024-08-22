
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_field.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/signup/presentation/password/password_change_notifier.dart';
import 'package:tarweej_platform/features/auth/signup/presentation/password/password_state.dart';
part 'password_validation_guide.dart';
part 'password_validation_step.dart';
part 'password_validation_steps.dart';
part 'password_validation_success.dart';

class PasswordFieldWithValidationGuide extends StatefulWidget {
  const PasswordFieldWithValidationGuide({super.key});

  @override
  State<PasswordFieldWithValidationGuide> createState() =>
      _PasswordFieldWithValidationGuideState();
}

class _PasswordFieldWithValidationGuideState extends State<PasswordFieldWithValidationGuide> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      PasswordChangeNotifier().updatePasswordState(controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: controller,
          hintText: context.translate.password,
        ),
        verticalSpace(10),
        const PasswordValidationGuide()
      ],
    );
  }
}
