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

  // Update user in cache with only the updated fields
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

  // Remove user from cache when user logs out
  static Future<void> clearUser() async {
    await CacheHelper.removeData(key: CacheConstants.userData);
  }

  /// Sets the user's login status in the cache.
  ///
  /// [status] is a boolean indicating whether the user is logged in (true) or logged out (false).
  static Future<void> setLoginStatusTo(bool status) async {
    await CacheHelper.setData(key: CacheConstants.loginStatus, value: status);
  }

  /// Returns the user's login status from the cache.

  static Future<bool> isUserLoggedIn() async {
    return await CacheHelper.getBool(key: CacheConstants.loginStatus);
  }
}
