import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/core/common_ui/widgets/sheet_body.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/notifier/reset_password.dart/reset_password_notifier.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/widgets/reset_password/check_your_email_box.dart';
import 'package:tarweej_platform/features/auth/features/login/presentation/widgets/reset_password/reset_password_email_form.dart';

class ResetPasswordSheetBody extends ConsumerStatefulWidget {
  const ResetPasswordSheetBody({super.key});

  @override
  ConsumerState<ResetPasswordSheetBody> createState() =>
      _ResetPasswordSheetBodyState();
}

class _ResetPasswordSheetBodyState
    extends ConsumerState<ResetPasswordSheetBody> {
  // Widget? _currentChild;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPasswordNotifierProvider);

    // // Determine the new child widget based on state, only if it should change
    // Widget newChild;
    // if (state is ResetPasswordCodeSentSuccess) {
    //   newChild = const ResetPasswordCodeForm(key: ValueKey("1"));
    // } else if (state is ResetPasswordCodeVerifiedSuccess) {
    //   newChild = const NewPasswordForm(key: ValueKey("2"));
    // } else if (state is ResetPasswordInitial || _currentChild == null) {
    //   newChild = const ResetPasswordEmailForm(key: ValueKey("3"));
    // } else {
    //   // For states where we don't want to change the UI, use the current widget
    //   newChild = _currentChild!;
    // }

    // // Update the current child only if it changes
    // if (newChild != _currentChild) {
    //   _currentChild = newChild;
    // }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SheetBody(
        height: 500.h,
        sheetBackgroundColor: context.theme.scaffoldBackgroundColor,
        children: AnimatedSwitcher(
          duration: const Duration(milliseconds: 260),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                      .animate(animation),
              child: child,
            );
          },
          child: state is ResetPasswordCodeSentSuccess
              ? const CheckYourEmailBox()
              : const ResetPasswordEmailForm(),
        ),
      ),
    );
  }
}
