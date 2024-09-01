import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/providers/github/logic/signin_with_github_notifier.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../core/alerts/firebase_error_dialog.dart';

class SigninWithGitHubListener extends ConsumerWidget {
  const SigninWithGitHubListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SigninWithGitHubState>(
      signInWithGitHubProvider,
      (previous, state) {
        log(state.toString());
        if (state is SigninWithGitHubSuccess) {
          _changeLoadingIndicatorVisibility(context, previous);
          // Navigate to main navigation view
          context.navigateTo(Routes.mainNavigationView);
        } else if (state is SigninWithGitHubError) {
          _changeLoadingIndicatorVisibility(context, previous);
          FirebaseErrorDialog.show(context, state.error);
        } else if (state is SigninWithGitHubLoading) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }

  _changeLoadingIndicatorVisibility(
      BuildContext context, SigninWithGitHubState? previous) {
    if (previous is SigninWithGitHubLoading) {
      AppLoadingIndicator.hide(context);
    }
  }
}
