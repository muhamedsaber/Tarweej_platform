import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/logic/country/country_changer_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/logic/phone/phone_auth_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/widgets/otp/otp_textfield.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/widgets/otp/submit_sms_code_button.dart';

class OTPSmsCodeForm extends ConsumerWidget {
  const OTPSmsCodeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(phoneAuthProvider.notifier).otbFormKey,
      child: Column(
        children: [
          const OtpTextField(),
          verticalSpace(10),
          Text(
            context.translate.WeSentASixdigitCodeTo,
            style: context.theme.font16SecondaryRegular,
          ),
          //
          Directionality(
            textDirection: TextDirection.ltr,
            child: Consumer(
              builder: (context, ref, child) {
                final contoller =
                    ref.watch(phoneAuthProvider.notifier).phoneController;
                final countryCode =
                    ref.watch(countryChangerProvider).country.phoneCode;
                return Text(
                  "$countryCode ${contoller.text}",
                  style: context.theme.font18OnSurfaceMedium,
                );
              },
            ),
          ),
          verticalSpace(20),
          const SubmitSmsCodeButton()
        ],
      ),
    );
  }
}
