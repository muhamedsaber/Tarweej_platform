import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tarweej_platform/config/data/models/user_model.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_result.dart';
import 'package:tarweej_platform/features/auth/services/email_service.dart';

class SignupRepo {
  final EmailService emailService;

  SignupRepo({required this.emailService});
  Future<FirebaseResult<UserModel>> signup(
      {required String email, required String password}) async {
    try {
      UserCredential credentials =
          await emailService.signup(email: email, password: password);
      log(credentials.user.toString());
      final user = UserModel.fromCredentials(credentials);
      return FirebaseResult.success(user);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }
}
