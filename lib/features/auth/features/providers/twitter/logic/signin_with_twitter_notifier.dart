

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';
import 'package:tarweej_platform/features/auth/features/providers/twitter/data/signin_with_twitter_repo.dart';

import '../../../../../../config/data/cache/user_cache.dart';
part 'signin_with_twitter_state.dart';
class SingInWithTwitterNotifier extends StateNotifier<SigninWithTwitterState> {
  SingInWithTwitterNotifier(this.repo) : super(SigninWithTwitterInitial());
  final SignInWithTwitterRepo repo;
  signIn() async {
    state = SigninWithTwitterLoading();
    final result = await repo.signIn();
    result.when(onSuccess: (data) async{
       await UserCache.saveUser(data!);
      state = SigninWithTwitterSuccess();
    }, onError: (error) {
      log(error?.code.toString() ?? "");
      state = SigninWithTwitterError(error: error!);
    });
  }
}
final signInWithTwitterProvider =
    StateNotifierProvider<SingInWithTwitterNotifier, SigninWithTwitterState>(
        (ref) => SingInWithTwitterNotifier(getIt<SignInWithTwitterRepo>()));