import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key,
  required this.controller,
  });
final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          closeKeyboardWhenCompleted: true,
          controller: controller,
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
