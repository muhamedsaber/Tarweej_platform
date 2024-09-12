import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/signup/presentation/widgets/signup_form.dart';
import 'package:tarweej_platform/features/auth/features/signup/presentation/widgets/singup_headline.dart';
import 'package:tarweej_platform/features/auth/features/widgets/or_separator.dart';
import 'package:tarweej_platform/features/auth/features/widgets/provider_auth_section.dart';


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
          padding: AppPadding.screenHorizontal23,
          child: ListView(
            children: [
              verticalSpace(50),
              const SignupHeadline(),
              verticalSpace(26),
              const SignupForm(),
              verticalSpace(26),
              const OrSeparator(),
              verticalSpace(15),
              const ProvidersAuthSection(),
              verticalSpace(10),
              AppTextButton(
                title: context.translate.login,
                onPressed: () {
                  context.navigateTo(Routes.loginView);
                },
                backgroundColor: context.theme.scaffoldBackgroundColor,
              ),
              //----Listeners
             
            ],
          ),
        ),
      ),
    );
  }
}
