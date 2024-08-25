import 'package:get_it/get_it.dart';
import 'package:tarweej_platform/features/auth/services/email_service.dart';
import 'package:tarweej_platform/features/auth/signup/data/repos/signup_repo.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<EmailService>(EmailService());
  _setupSignup();
}
_setupSignup(){
  getIt.registerSingleton<SignupRepo>(SignupRepo(emailService: getIt<EmailService>()));
}