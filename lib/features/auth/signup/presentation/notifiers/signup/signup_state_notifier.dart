import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';
import 'package:tarweej_platform/features/auth/signup/data/repos/signup_repo.dart';
part 'signup_state.dart';


final signupNotifierProvider =
    StateNotifierProvider<SignupNotifier, SignupState>((ref) {
  return SignupNotifier(repo: getIt<SignupRepo>());
});

class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier({required this.repo}) : super(SignupInitial());
  final SignupRepo repo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    state = SignupLoading();
    final result = await repo.signup(
        email: emailController.text, password: passwordController.text);
    result.when(onSuccess: (data) {
      state = SignupSuccess();
    }, onError: (error) {
      state = SignupError(error: error!);
    });
  }
}
