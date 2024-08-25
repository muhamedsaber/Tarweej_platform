part of 'signin_with_twitter_notifier.dart';

@immutable
sealed class SigninWithTwitterState {}

class SigninWithTwitterInitial extends SigninWithTwitterState {}

class SigninWithTwitterSuccess extends SigninWithTwitterState {}

class SigninWithTwitterError extends SigninWithTwitterState {
  final FirebaseErrorModel error;
  SigninWithTwitterError({required this.error});
}

class SigninWithTwitterLoading extends SigninWithTwitterState {}
