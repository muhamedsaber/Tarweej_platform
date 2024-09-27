import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../config/data/models/user_model.dart';
import '../../../../core/helpers/app_constants.dart';

abstract class UserDocService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUserDoc(UserModel user);
  Future<Map<String, dynamic>?> getUserDoc(UserModel user);
}

class UserDocServiceImpl extends UserDocService {
  @override
  Future<void> createUserDoc(UserModel user) async {
    await firestore
        .collection(AppConstants.usersDataCollection)
        .doc(user.uid)
        .set(user.toJson());
  }


  @override
  Future<Map<String, dynamic>> getUserDoc(UserModel user) async {
    final docSnapShot = await firestore
        .collection(AppConstants.usersDataCollection)
        .doc(user.uid)
        .get();
    return docSnapShot.data()!;
  }
}
