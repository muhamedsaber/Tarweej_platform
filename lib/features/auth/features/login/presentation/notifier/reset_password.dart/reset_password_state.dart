part of "reset_password_notifier.dart";

class ResetPasswordState {}
class ResetPasswordInitial extends ResetPasswordState {}
class ResetPasswordCodeSentSuccess extends ResetPasswordState {}
// class ResetPasswordCodeVerifiedSuccess extends ResetPasswordState {}
// class ResetPasswordChangeSuccess extends ResetPasswordState {}
class ResetPasswordError extends ResetPasswordState {
  ResetPasswordError({required this.error});

  final FirebaseErrorModel error;
}
class ResetPasswordLoading extends ResetPasswordState {}
