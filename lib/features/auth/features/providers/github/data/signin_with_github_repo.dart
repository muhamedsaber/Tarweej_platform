import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tarweej_platform/config/data/models/user_model.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_result.dart';
import 'package:tarweej_platform/features/auth/services/provider_services.dart';

class SigninWithGitHubRepo {
  final AuthProviderServices providerServices;
  SigninWithGitHubRepo({required this.providerServices});
  Future<FirebaseResult<UserModel>> signIn() async {
    try {
      UserCredential credentials = await providerServices.signInWithGitHub();
      log(credentials.user.toString());
      final user = UserModel.fromCredentials(credentials);
      return FirebaseResult.success(user);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }
}