import '../../../../../config/data/models/user_model.dart';
import '../../../../../core/networking/firebase/firebase_result.dart';

abstract class AuthProviderRepo {
  Future<FirebaseResult<UserModel>> signIn();
}
