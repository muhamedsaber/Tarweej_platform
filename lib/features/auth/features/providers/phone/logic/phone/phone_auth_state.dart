part of 'phone_auth_notifier.dart';

class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthSubmitCodeSuccess extends PhoneAuthState {
  final UserModel user;
  PhoneAuthSubmitCodeSuccess({required this.user});
}

class PhoneAuthError extends PhoneAuthState {
  final FirebaseErrorModel error;
  PhoneAuthError(this.error);
}

class PhoneAuthCodeSent extends PhoneAuthState {
  final String verificationId;
  PhoneAuthCodeSent({required this.verificationId});
}
