part of "login_state_notifier.dart";


@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  LoginError({required this.error});

  final FirebaseErrorModel error;
}

final class LoginLoading extends LoginState {}
