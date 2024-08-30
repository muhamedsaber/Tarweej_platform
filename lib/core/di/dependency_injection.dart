import 'package:get_it/get_it.dart';
import 'package:tarweej_platform/features/auth/features/providers/facebook/data/signin_with_facebook_repo.dart';
import 'package:tarweej_platform/features/auth/features/providers/github/data/signin_with_github_repo.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/data/signin_with_google_repo.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/data/signin_with_phone_number_repo.dart';
import 'package:tarweej_platform/features/auth/features/providers/twitter/data/signin_with_twitter_repo.dart';
import 'package:tarweej_platform/features/auth/services/email_service.dart';
import 'package:tarweej_platform/features/auth/features/signup/data/repos/signup_repo.dart';
import 'package:tarweej_platform/features/auth/services/provider_services.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<EmailService>(EmailService());
  getIt.registerSingleton<AuthProviderServices>(AuthProviderServices());
  _setupSignup();
  _setupSignInWithGoogle();
  _setupSignInWithFacebook();
  _setupSignInWithTwitter();
  _setupSignInWithGitHub();
  _setupSignInWithPhoneNumber();
}

_setupSignup() {
  getIt.registerSingleton<SignupRepo>(
      SignupRepo(emailService: getIt<EmailService>()));
}

_setupSignInWithGoogle() {
  getIt.registerSingleton<SignInWithGoogleRepo>(
      SignInWithGoogleRepo(providersService: getIt<AuthProviderServices>()));
}

_setupSignInWithFacebook(){
   getIt.registerSingleton<SigninWithFacebookRepo>(
      SigninWithFacebookRepo(providerServices: getIt<AuthProviderServices>()));
}
_setupSignInWithTwitter(){
   getIt.registerSingleton<SignInWithTwitterRepo>(
      SignInWithTwitterRepo(providersService: getIt<AuthProviderServices>()));
}
void _setupSignInWithGitHub() {
  getIt.registerFactory<SigninWithGitHubRepo>(
    () => SigninWithGitHubRepo(providerServices:getIt<AuthProviderServices>()),
  );
}
void _setupSignInWithPhoneNumber() {
  getIt.registerFactory<SigninWithPhoneNumberRepo>(
    () => SigninWithPhoneNumberRepo(),
  );
}
