import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/data/cache/user_cache.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';
import 'package:tarweej_platform/features/auth/features/login/data/login_repo.dart';

part 'login_state.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(repo: getIt<LoginRepo>());
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({required this.repo}) : super(LoginInitial());
  final LoginRepo repo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    state = LoginLoading();
    final result = await repo.login(
        email: emailController.text, password: passwordController.text);
    result.when(onSuccess: (data) async{
      await UserCache.saveUser(data!);
      log(data.toString());
      state = LoginSuccess();
    }, onError: (error) {
      state = LoginError(error: error!);
    });
  } //elo@gmail.com
  //Qwerty0000#
}
