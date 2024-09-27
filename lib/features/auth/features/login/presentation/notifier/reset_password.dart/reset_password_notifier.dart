import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';
import 'package:tarweej_platform/features/auth/features/login/data/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordNotifier({required this.repo}) : super(ResetPasswordInitial());
  final ResetPasswordRepo repo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  resetPassword() async {
    state = ResetPasswordLoading();
    final result = await repo.resetPassword(email: emailController.text);
    result.when(onSuccess: (data) {
      state = ResetPasswordCodeSentSuccess();
    }, onError: (error) {
      state = ResetPasswordError(error: error);
    });
  }

  // verifyCode() async {
  //   state = ResetPasswordLoading();
  //   final result =
  //       await repo.verifyPasswordResetCode(code: codeController.text);
  //   result.when(onSuccess: (data) {
  //     state = ResetPasswordCodeVerifiedSuccess();
  //   }, onError: (error) {
  //     state = ResetPasswordError(error: error!);
  //   });
  // }

  // changePassword() async {
  //   state = ResetPasswordLoading();
  //   final result = await repo.confirmPasswordReset(
  //       code: codeController.text, newPassword: newPasswordController.text);
  //   result.when(onSuccess: (data) {
  //     state = ResetPasswordChangeSuccess();
  //   }, onError: (error) {
  //     state = ResetPasswordError(error: error!);
  //   });
  // }
}

final resetPasswordNotifierProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
  return ResetPasswordNotifier(repo: getIt<ResetPasswordRepo>());
});
