import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/app_regex.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/logic/phone/phone_auth_notifier.dart';

class OtpTextField extends ConsumerWidget {
  const OtpTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          closeKeyboardWhenCompleted: true,
          controller: ref.watch(phoneAuthProvider.notifier).otbController,
          length: 6,
          errorTextStyle: context.theme.font14ErrorRegular,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
          ],
          errorText: context.translate.TheCodeIsInvalidCheckTheCodeAndTryAgain,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.translate.thisFieldIsRequired;
            }
            if (value.length < 6) {
              return context.translate.TheCodeIsInvalidCheckTheCodeAndTryAgain;
            }
            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
              return context.translate.TheCodeIsInvalidCheckTheCodeAndTryAgain;
            }
            return null;
          },
          followingPinTheme: PinTheme(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: AppBorderRadius.circularAll6,
              )),
          errorPinTheme: PinTheme(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.error,
                borderRadius: AppBorderRadius.circularAll6,
              )),
          defaultPinTheme: PinTheme(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: AppBorderRadius.circularAll6,
            ),
          ),
        ),
      ),
    );
  }
}
