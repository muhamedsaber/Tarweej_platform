import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tarweej_platform/config/data/models/user_model.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_result.dart';
import 'package:tarweej_platform/features/auth/services/provider_services.dart';

class SignInWithGoogleRepo {
  final ProviderServices providersService;
  SignInWithGoogleRepo({required this.providersService});
  Future<FirebaseResult<UserModel>> signIn() async {
    try {
      UserCredential credentials = await providersService.signInWithGoogle();
      log(credentials.user.toString());
      UserModel model = UserModel(
        email: credentials.user!.email,
        uid: credentials.user!.uid,
      );
      return FirebaseResult.success(model);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }
}
