import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/logic/country/country_changer_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/logic/phone/phone_auth_notifier.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/widgets/phone/phone_number_section.dart';

class PhoneNumberForm extends ConsumerWidget {
  const PhoneNumberForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneAuthNotifier = ref.watch(phoneAuthProvider.notifier);

    return Form(
      key: phoneAuthNotifier.phoneFormKey,
      child: Column(
        children: [
          const PhoneNumberSection(),
          verticalSpace(8),
          Center(
            child: Text(
              context.translate.WeWillSendYouACodeToConfirmYourPhoneNumber,
              style: context.theme.font10GreyRegular,
            ),
          ),
          verticalSpace(20),
          Center(
            child: AppTextButton(
                borderRadius: AppBorderRadius.infinity,
                width: 130.w,
                style: context.theme.font18OnSurfaceMedium,
                title: context.translate.next,
                onPressed: () {
                  if (phoneAuthNotifier.phoneFormKey.currentState!.validate()) {
                    phoneAuthNotifier.phoneFormKey.currentState!.save();
                    // getting the country code from the country model that user selected
                    // and pass it to the [authunticatePhoneNumber] method
                    String countryCode =
                        ref.watch(countryChangerProvider).country.phoneCode;
                    // calling the [authunticatePhoneNumber] method to send the code to the user
                    ref
                        .read(phoneAuthProvider.notifier)
                        .authunticatePhoneNumber(countryCode: countryCode);
                    // NOTE: Navigation is handled in the [PhoneAuthNotifier] class
                    // Navigation only happens if the phone number is valid
                    // and the code is sent successfully
                  }
                }),
          )
        ],
      ),
    );
  }
}
