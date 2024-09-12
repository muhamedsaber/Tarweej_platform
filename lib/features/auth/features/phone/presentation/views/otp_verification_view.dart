import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

import '../widgets/otp/otp_sms_code_form.dart';

class OTPVerificationView extends StatelessWidget {
  const OTPVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.navigateBack();
              },
              icon: const Icon(Icons.close)),
        ),
        body: Padding(
          padding: AppPadding.screenHorizontal23,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.translate.EnterYourCode,
                style: context.theme.font18OnSurfaceBold,
              ),
              verticalSpace(30),
              const OTPSmsCodeForm()
            ],
          ),
        ),
      ),
    );
  }
}


