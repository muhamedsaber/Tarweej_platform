import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/data/cache/user_cache.dart';
import '../../../../../core/networking/firebase/firebase_error_model.dart';
import '../impl/repos/mock_auth_provider_repo_impl.dart';
import '../interfaces/authentication_provider.dart';
import '../interfaces/auth_provider_repo.dart';
part 'auth_provider_state.dart';

class AuthProviderStateNotifier extends StateNotifier<AuthProviderState> {
  AuthProviderStateNotifier(this.repo) : super(AuthProviderInitialState());
  final AuthProviderRepo repo;

  signIn() async {
    state = AuthProviderLoadingState();
    final result = await repo.signIn();
    result.when(onSuccess: (data) async {
      // Saving user info in cache
      await UserCache.saveUser(data!);
      await UserCache.setLoginStatusTo(true);
      // updating the state
      state = AuthProviderSuccessState();
    }, onError: (error) {
      log(error?.code.toString() ?? "");
      state = AuthProviderErrorState(error: error!);
    });
  }
}
// here i feel the power of riverpod.
// imagine how easy it to change a dependency in the runtime.
// i can change the authProvider in the runtime without changing the code. 
final authProviderStateNotifier = StateNotifierProvider.family<
    AuthProviderStateNotifier, AuthProviderState, AuthenticationProvider>(
  (ref, authProvider) => AuthProviderStateNotifier(MockAuthProviderRepoImpl()),
);
