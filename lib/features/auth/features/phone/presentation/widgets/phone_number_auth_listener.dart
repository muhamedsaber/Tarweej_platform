import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

import '../../../../../../../core/alerts/firebase_error_dialog.dart';
import '../logic/phone/phone_auth_notifier.dart';

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
          _changeLoadingIndicatorVisibility(context, previous);
          FirebaseErrorDialog.show(context, next.error);
        } else if (next is PhoneAuthCodeSent) {
          _changeLoadingIndicatorVisibility(context, previous);
          context.navigateTo(Routes.otpVerificationView);
        } else if (next is PhoneAuthSubmitCodeSuccess) {
          _changeLoadingIndicatorVisibility(context, previous);
          // Navigate to main navigation view
          context.navigateTo(Routes.mainNavigationView);
        }
      },
    );
    return const SizedBox.shrink();
  }

  // If the previous state is PhoneAuthLoading, hide the loading indicator
  // by calling AppLoadingIndicator.hide(context)
  _changeLoadingIndicatorVisibility(
      BuildContext context, PhoneAuthState? previous) {
    if (previous is PhoneAuthLoading) {
      AppLoadingIndicator.hide(context);
    }
  }
}
