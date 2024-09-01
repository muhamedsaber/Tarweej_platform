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
    if (usrStr == "") {
      return UserModel();
    } else {
      final user = UserModel.fromJson(jsonDecode(usrStr));
      return user;
    }
  }

  static Future<String> getUserUid() async {
    debugPrint("getUserUid with key: ${CacheConstants.userData}");
    final user = await getUser();
    return user.uid ?? ""; // it will never be empty
  }

  static Future<void> updateUser(UserModel user) async {
    UserModel userModel = await getUser();
    userModel = userModel.copyWith(
      email: user.email,
      uid: user.uid,
      accountCoverPhoto: user.accountCoverPhoto,
      bio: user.bio,
      isVerified: user.isVerified,
      name: user.name,
      phoneNumber: user.phoneNumber,
      photoUrl: user.photoUrl,
    );
    await saveUser(userModel);
  }
}
