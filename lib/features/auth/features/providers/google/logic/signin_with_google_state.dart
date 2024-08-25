import 'package:flutter/foundation.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';

@immutable
sealed class SigninWithGoogleState {}

class SigninWithGoogleInitial extends SigninWithGoogleState {}

class SigninWithGoogleSuccess extends SigninWithGoogleState {}

class SigninWithGoogleError extends SigninWithGoogleState {
  final FirebaseErrorModel error;
  SigninWithGoogleError({required this.error});
}

class SigninWithGoogleLoading extends SigninWithGoogleState {}
