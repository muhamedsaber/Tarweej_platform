import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/alerts/app_toasts.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/notifier/reset_password.dart/reset_password_notifier.dart';

class ResetPasswordListener extends ConsumerWidget {
  const ResetPasswordListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      resetPasswordNotifierProvider,
      (previous, next) {
        log("ResetPasswordListener: $next");

        if (next is ResetPasswordCodeSentSuccess) {
         
        } else if (next is ResetPasswordError) {
          AppToasts.showToast(message: next.error.message, context: context);
        }
      },
    );
    return const SizedBox.shrink();
  }
}
