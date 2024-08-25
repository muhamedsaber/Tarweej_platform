part of 'signin_with_facebook_notifier.dart';

@immutable
sealed class SigninWithFacebookState {}

class SigninWithFacebookInitial extends SigninWithFacebookState {}

class SigninWithFacebookSuccess extends SigninWithFacebookState {}

class SigninWithFacebookError extends SigninWithFacebookState {
  final FirebaseErrorModel error;
  SigninWithFacebookError({required this.error});
}

class SigninWithFacebookLoading extends SigninWithFacebookState {}
