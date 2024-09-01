import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/data/cache/cache_constants.dart';
import 'package:tarweej_platform/config/data/cache/cache_manager.dart';
import 'package:tarweej_platform/config/data/models/user_model.dart';

class UserCache {
  static Future<void> saveUser(UserModel user) async {
    final String usrStr = jsonEncode(user.toJson());
    await CacheHelper.setData(key: CacheConstants.userData, value: usrStr);
  }

  static Future<UserModel> getUser() async {
    final usrStr = await CacheHelper.getString(key: CacheConstants.userData);
    return UserModel.fromJson(jsonDecode(usrStr));
  }

  static Future<String> getUserUid() async {
    debugPrint("getUserUid with key: ${CacheConstants.userData}");
    final user = await getUser();
    return user.uid ?? ""; // it will never be empty
  }

  Future<void> updateUser(UserModel user) async {
    UserModel userModel = await getUser();
    userModel = userModel.copyWith(
      email: user.email,
      uid: user.uid,
      accountCoverPhoto: user.accountCoverPhoto,
      bio: user.bio,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      photoUrl: user.photoUrl,
    );
    await saveUser(userModel);
  }
}
