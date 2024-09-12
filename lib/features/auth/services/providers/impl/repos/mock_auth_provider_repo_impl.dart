import 'package:tarweej_platform/config/data/models/user_model.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_codes.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_result.dart';

import '../../../../../../core/networking/firebase/firebase_exception_factory.dart';
import '../../interfaces/auth_provider_repo.dart';

class MockAuthProviderRepoImpl implements AuthProviderRepo {
  @override
  Future<FirebaseResult<UserModel>> signIn() async {
    await Future.delayed(const Duration(seconds: 2));
    return FirebaseResult.error(FirebaseErrorHandler.handle(
        FirebaseExceptionFactory.create(
            code:
                FirebaseErrorCodes.accountAlreadyExistWithDifferentCredentials,
            pluginType: FirebasePluginType.auth)));
  }
}
