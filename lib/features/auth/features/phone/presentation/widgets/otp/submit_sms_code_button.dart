
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_toasts.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';

import '../../logic/phone/phone_auth_notifier.dart';

class SubmitSmsCodeButton extends ConsumerWidget {
  const SubmitSmsCodeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(phoneAuthProvider.notifier);

    return Center(
      child: AppTextButton(
        borderRadius: AppBorderRadius.infinity,
        width: 130.w,
        style: context.theme.font18OnSurfaceMedium,
        title: context.translate.next,
        onPressed: () {
          if (ref
              .watch(phoneAuthProvider.notifier)
              .otbFormKey
              .currentState!
              .validate()) {
            ref
                .read(phoneAuthProvider.notifier)
                .verifyCodeSMS(verificationId: notifier.codeVerificationId);
          } else {
            AppToasts.showToast(
                message:
                    context.translate.TheCodeIsInvalidCheckTheCodeAndTryAgain,
                position: ToastPosition.top,
                context: context);
          }
        },
      ),
    );
  }
}
