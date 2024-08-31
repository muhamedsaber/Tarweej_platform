import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/widgets/login_form.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/widgets/login_listener.dart';

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
              const LoginListener()
            ],
          ),
        )),
      ),
    );
  }
}
