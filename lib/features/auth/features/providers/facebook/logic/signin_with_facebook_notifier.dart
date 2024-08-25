import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';
import 'package:tarweej_platform/features/auth/features/providers/facebook/data/signin_with_facebook_repo.dart';

part 'signin_with_facebook_state.dart';
class SingInWithFacebookNotifier extends StateNotifier<SigninWithFacebookState> {
  SingInWithFacebookNotifier(this.repo) : super(SigninWithFacebookInitial());
  final SigninWithFacebookRepo repo;
  signIn() async {
    state = SigninWithFacebookLoading();
    final result = await repo.signIn();
    result.when(onSuccess: (data) {
      state = SigninWithFacebookSuccess();
    }, onError: (error) {
      log(error?.code.toString() ?? "");
      state = SigninWithFacebookError(error: error!);
    });
  }
}

final signInWithFacebookProvider =
    StateNotifierProvider<SingInWithFacebookNotifier, SigninWithFacebookState>(
        (ref) => SingInWithFacebookNotifier(getIt<SigninWithFacebookRepo>()));
