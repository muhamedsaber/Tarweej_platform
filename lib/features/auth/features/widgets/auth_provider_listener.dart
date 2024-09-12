import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/services/providers/notifiers/auth_provider_state_notifier.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/alerts/app_alers.dart';
import '../../../../core/alerts/firebase_error_dialog.dart';

class AuthProviderListener extends ConsumerWidget {
  const AuthProviderListener({super.key, required this.providerFamily});
  final ProviderListenable<AuthProviderState> providerFamily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthProviderState>(
      providerFamily,
      (previous, state) {
        log(state.toString());
        if (state is AuthProviderSuccessState) {
          _changeLoadingIndicatorVisibility(context, previous);
          // Navigate to main navigation view
          context.navigateTo(Routes.mainNavigationView);
        } else if (state is AuthProviderErrorState) {
          _changeLoadingIndicatorVisibility(context, previous);
          FirebaseErrorDialog.show(context, state.error);
        } else if (state is AuthProviderLoadingState) {
          AppLoadingIndicator.show(context);
        }
      },
    );
    return const SizedBox.shrink();
  }

  _changeLoadingIndicatorVisibility(
      BuildContext context, AuthProviderState? previous) {
    if (previous is AuthProviderLoadingState) {
      AppLoadingIndicator.hide(context);
    }
  }
}
