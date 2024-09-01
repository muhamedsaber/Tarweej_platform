import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/router/routes.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/alerts/app_alers.dart';
import 'package:tarweej_platform/core/alerts/app_dialogs.dart';
import 'package:tarweej_platform/core/alerts/firebase_error_dialog.dart';
import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/core/helpers/size.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/notifier/login/login_state_notifier.dart';

class LoginListener extends ConsumerWidget {
  const LoginListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginNotifierProvider, (previous, state) {
      if (state is LoginSuccess) {
        _changeLoadingIndicatorVisibility(context, previous);
        // Navigate to main navigation view
        context.navigateTo(Routes.mainNavigationView);
      } else if (state is LoginError) {
        _changeLoadingIndicatorVisibility(context, previous);
        FirebaseErrorDialog.show(context, state.error);
      } else if (state is LoginLoading) {
        AppLoadingIndicator.show(context);
      }
    });

    return const SizedBox.shrink();
  }

  _changeLoadingIndicatorVisibility(
      BuildContext context, LoginState? previous) {
    if (previous is LoginLoading) {
      AppLoadingIndicator.hide(context);
    }
  }
}
