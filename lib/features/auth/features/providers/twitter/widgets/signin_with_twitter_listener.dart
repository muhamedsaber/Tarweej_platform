


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/alerts/firebase_error_dialog.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/providers/twitter/logic/signin_with_twitter_notifier.dart';

import '../../../../../../config/router/routes.dart';

class SigninWithTwitterListener extends ConsumerWidget {
  const SigninWithTwitterListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SigninWithTwitterState>(
      signInWithTwitterProvider ,
      (previous, state) {
        log(state.toString());
        if (state is SigninWithTwitterSuccess) {
          _changeLoadingIndicatorVisibility(context, previous);
          // Navigate to main navigation view
          context.navigateTo(Routes.mainNavigationView);
        } else if (state is SigninWithTwitterError) {
          _changeLoadingIndicatorVisibility(context, previous);
          FirebaseErrorDialog.show(context, state.error);
        } else if (state is SigninWithTwitterLoading) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }
  _changeLoadingIndicatorVisibility(
      BuildContext context, SigninWithTwitterState? previous) {
    if (previous is SigninWithTwitterLoading) {
      AppLoadingIndicator.hide(context);
    }
  }
  
}
