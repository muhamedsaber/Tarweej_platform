import 'package:get_it/get_it.dart';
import 'package:tarweej_platform/features/auth/features/login/data/login_repo.dart';
import 'package:tarweej_platform/features/auth/features/login/data/reset_password_repo.dart';
import 'package:tarweej_platform/features/auth/services/email_service.dart';
import 'package:tarweej_platform/features/auth/features/signup/data/signup_repo.dart';
import 'package:tarweej_platform/features/auth/services/providers/impl/auth_providers/facebook_auth_provider_impl.dart';
import 'package:tarweej_platform/features/auth/services/providers/impl/auth_providers/github_auth_provider_impl.dart';
import 'package:tarweej_platform/features/auth/services/providers/impl/auth_providers/twitter_auth_provider_impl.dart';

import '../../features/auth/features/phone/data/signin_with_phone_number_repo.dart';
import '../../features/auth/services/providers/impl/auth_providers/google_auth_provider_impl.dart';



GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<EmailService>(EmailService());
 
  _setupSignup();
  _setupAuthenticationProviders();
  _setupSignInWithPhoneNumber();
  _setupLogin();
  _resetPasswordSetup();
}
_setupAuthenticationProviders(){
  getIt.registerSingleton<FacebookAuthProviderImpl>(FacebookAuthProviderImpl());
  getIt.registerSingleton<GoogleAuthProviderImpl>(GoogleAuthProviderImpl());
  getIt.registerSingleton<GitHubAuthProviderImpl>(GitHubAuthProviderImpl());
  getIt.registerSingleton<TwitterAuthProviderImpl>(TwitterAuthProviderImpl());
}
_setupSignup() {
  getIt.registerSingleton<SignupRepo>(
      SignupRepo(emailService: getIt<EmailService>()));
}

void _setupSignInWithPhoneNumber() {
  getIt.registerFactory<SigninWithPhoneNumberRepo>(
    () => SigninWithPhoneNumberRepo(),
  );
}

void _setupLogin() {
  getIt.registerSingleton<LoginRepo>(
    LoginRepo(emailService: getIt<EmailService>()),
  );
}

void _resetPasswordSetup() {
  getIt.registerSingleton<ResetPasswordRepo>(
    ResetPasswordRepo(getIt<EmailService>()),
  );
}
