import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationProvider {
  // Sign in With Providers[Google, Facebook, GitHub...etc]
  Future<UserCredential>signIn();
}
