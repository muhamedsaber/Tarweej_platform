part of "signup_state_notifier.dart";

@immutable
abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupError extends SignupState {
  SignupError({required this.error});

  final FirebaseErrorModel error;
}

final class SignupLoading extends SignupState {}
