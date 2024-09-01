import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:tarweej_platform/config/data/cache/user_cache.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';
import 'package:tarweej_platform/features/auth/features/providers/GitHub/data/signin_with_GitHub_repo.dart';
import 'package:tarweej_platform/features/auth/services/provider_services.dart';

part "signin_with_github_state.dart";

class SingInWithGitHubNotifier extends StateNotifier<SigninWithGitHubState> {
  SingInWithGitHubNotifier(this.repo) : super(SigninWithGitHubInitial());
  final SigninWithGitHubRepo repo;
  signIn() async {
    state = SigninWithGitHubLoading();
    final result = await repo.signIn();
    result.when(onSuccess: (data) async {
      await UserCache.saveUser(data!);
      state = SigninWithGitHubSuccess();
    }, onError: (error) {
      log(error?.code.toString() ?? "");
      state = SigninWithGitHubError(error: error!);
    });
  }
}

final signInWithGitHubProvider = StateNotifierProvider<SingInWithGitHubNotifier,
        SigninWithGitHubState>(
    (ref) => SingInWithGitHubNotifier(
        SigninWithGitHubRepo(providerServices: getIt<AuthProviderServices>())));
