import 'package:get_it/get_it.dart';
import 'package:tarweej_platform/features/auth/features/providers/facebook/data/signin_with_facebook_repo.dart';
import 'package:tarweej_platform/features/auth/features/providers/google/data/signin_with_google_repo.dart';
import 'package:tarweej_platform/features/auth/services/email_service.dart';
import 'package:tarweej_platform/features/auth/features/signup/data/repos/signup_repo.dart';
import 'package:tarweej_platform/features/auth/services/provider_services.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<EmailService>(EmailService());
  getIt.registerSingleton<AuthProviderServices>(AuthProviderServices());
  _setupSignup();
  _setupSignInWithGoogle();
  _setupSignInWithFacebook();
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