import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/alerts/firebase_error_dialog.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/providers/facebook/logic/signin_with_facebook_notifier.dart';

import '../../../../../../config/router/routes.dart';

class SigninWithFacebookListener extends ConsumerWidget {
  const SigninWithFacebookListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SigninWithFacebookState>(
      signInWithFacebookProvider,
      (previous, state) {
        log(state.toString());
        if (state is SigninWithFacebookSuccess) {
          _handleLoadingIndicator(previous, context);
          // Navigate to main navigation view
          context.navigateTo(Routes.mainNavigationView);
        } else if (state is SigninWithFacebookError) {
          _handleLoadingIndicator(previous, context);
          FirebaseErrorDialog.show(context, state.error);
        } else if (state is SigninWithFacebookLoading) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }

  _handleLoadingIndicator(
      SigninWithFacebookState? previous, BuildContext context) {
    if (previous is SigninWithFacebookLoading) {
      AppLoadingIndicator.hide(context);
    }
  }
}
