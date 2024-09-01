import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/widgets/login_form.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/widgets/login_listener.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/widgets/reset_password/reset_password_listener.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/widgets/reset_password/reset_password_sheet_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.navigateBack();
            },
          ),
          title: Text(context.translate.login),
        ),
        body: Center(
            child: Padding(
          padding: AppPadding.screenHorizontal23,
          child: ListView(
            children: [
              verticalSpace(100),
              const LoginForm(),
              verticalSpace(20),
              const LoginListener(),
              Text(context.translate.forgotPassword,
                  textAlign: TextAlign.center,
                  style: context.theme.font14OnSurfaceRegular),
              verticalSpace(16),
              Padding(
                padding: AppPadding.screenHorizontal23,
                child: TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.surface,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) {
                          return const ResetPasswordSheetBody();
                        },
                      );
                    },
                    child: Text(context.translate.resetPassword,
                        style: context.theme.font14OnSurfaceMedium)),
              ),
              const ResetPasswordListener()
            ],
          ),
        )),
      ),
    );
  }
}
