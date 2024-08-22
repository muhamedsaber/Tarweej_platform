import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_field.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/signup/presentation/widgets/password/password_field_with_validation_guide.dart';
import 'package:tarweej_platform/features/auth/signup/presentation/widgets/singup_headline.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: AppPadding.syHorizontal23,
          child: ListView(
            children: [
              verticalSpace(50),
              const SignupHeadline(),
              verticalSpace(26),
               AppTextField(
                hintText:context.translate.email ,
              ),
              verticalSpace(16),
             const PasswordFieldWithValidationGuide(),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
