import 'package:tarweej_platform/config/data/models/user_model.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_result.dart';

import 'user_doc_service.dart';

class UserDocRepo {
  final UserDocService userDocService;
  UserDocRepo(this.userDocService);
  Future<FirebaseResult<UserModel>> getUser(UserModel user) async {
    try {
      final docData = await userDocService.getUserDoc(user);
      UserModel userModel = UserModel.fromJson(docData!);
      return FirebaseResult.success(userModel);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }

  Future<FirebaseResult<String>> createUser(UserModel user) async {
    try {
      await userDocService.createUserDoc(user);

      return const FirebaseResult.success("User Created Successfully");
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }
}
