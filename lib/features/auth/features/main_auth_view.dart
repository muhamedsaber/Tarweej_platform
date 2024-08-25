import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/signup/presentation/widgets/signup_form.dart';
import 'package:tarweej_platform/features/auth/features/signup/presentation/widgets/singup_headline.dart';

class MainAuthView extends StatelessWidget {
  const MainAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // hide keyboard when user taps outside the text field 
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
              const SignupForm()
            ],
          ),
        ),
      ),
    );
  }
}
