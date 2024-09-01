import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/logic/signin_with_google_state.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/logic/singin_with_google_notifier.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../core/alerts/firebase_error_dialog.dart';

class SigninWithGoogleListener extends ConsumerWidget {
  const SigninWithGoogleListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SigninWithGoogleState>(
      signInWithGoogleProvider,
      (previous, state) {
        log(state.toString());
        if (state is SigninWithGoogleSuccess) {
          _changeLoadingIndicatorVisibility(context, previous);
          // Navigate to main navigation view
          context.navigateTo(Routes.mainNavigationView);
        } else if (state is SigninWithGoogleError) {
          _changeLoadingIndicatorVisibility(context, previous);
          FirebaseErrorDialog.show(context, state.error);
        } else if (state is SigninWithGoogleLoading) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }

  _changeLoadingIndicatorVisibility(
      BuildContext context, SigninWithGoogleState? previous) {
    if (previous is SigninWithGoogleLoading) {
      AppLoadingIndicator.hide(context);
    }
  }
}
