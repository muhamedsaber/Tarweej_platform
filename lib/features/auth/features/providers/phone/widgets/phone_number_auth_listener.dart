import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/alerts/app_dialogs.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/logic/phone/phone_auth_notifier.dart';

class PhoneNumberAuthListener extends ConsumerWidget {
  const PhoneNumberAuthListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<PhoneAuthState>(
      phoneAuthProvider,
      (previous, next) {
        log(next.toString());
        if (next is PhoneAuthLoading) {
          AppLoadingIndicator.show(context);
        } else if (next is PhoneAuthError) {
          // hide
          hideLoadingIndicator(context, previous);
          final error = next.error;
          AppDialogs.showAlertDialog(
              context: context,
              title: error.message,
              icon: error.icon,
              actions: [AppDialogs.okButton(context)]);
        } else if (next is PhoneAuthCodeSent) {
          hideLoadingIndicator(context, previous);
          context.navigateTo(Routes.otpVerificationView);
        } else if (next is PhoneAuthSubmitCodeSuccess) {
          hideLoadingIndicator(context, previous);
         
        }
      },
    );
    return const SizedBox.shrink();
  }

  // If the previous state is PhoneAuthLoading, hide the loading indicator
  // by calling AppLoadingIndicator.hide(context)
  hideLoadingIndicator(BuildContext context, PhoneAuthState? previous) {
    if (previous is PhoneAuthLoading) {
      AppLoadingIndicator.hide(context);
    }
  }
}
