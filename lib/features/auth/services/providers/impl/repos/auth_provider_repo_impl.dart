import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tarweej_platform/config/data/models/user_model.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_result.dart';
import 'package:tarweej_platform/features/auth/services/providers/interfaces/auth_provider_repo.dart';

import '../../../../../../core/networking/firebase/firebase_error_handler.dart';
import '../../interfaces/authentication_provider.dart';

class AuthProviderRepoImpl implements AuthProviderRepo {
  final AuthenticationProvider authProvider;
  AuthProviderRepoImpl({required this.authProvider});
  @override
  Future<FirebaseResult<UserModel>> signIn() async {
    try {
      UserCredential credentials = await authProvider.signIn();
      log(credentials.user.toString());
      final user = UserModel.fromCredentials(credentials);
      return FirebaseResult.success(user);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }
}
