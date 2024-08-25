import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/data/signin_with_google_repo.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/logic/signin_with_google_state.dart';

class SingInWithGoogleNotifier extends StateNotifier<SigninWithGoogleState> {
  SingInWithGoogleNotifier(this.repo) : super(SigninWithGoogleInitial());
  final SignInWithGoogleRepo repo;
  signIn() async {
    state = SigninWithGoogleLoading();
    final result = await repo.signIn();
    result.when(onSuccess: (data) {
      state = SigninWithGoogleSuccess();
    }, onError: (error) {
      log(error?.code.toString() ?? "");
      state = SigninWithGoogleError(error: error!);
    });
  }
}

final singInWithGoogleProvider =
    StateNotifierProvider<SingInWithGoogleNotifier, SigninWithGoogleState>(
        (ref) => SingInWithGoogleNotifier(getIt<SignInWithGoogleRepo>()));
