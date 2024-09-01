import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_result.dart';
import 'package:tarweej_platform/features/auth/services/email_service.dart';

class ResetPasswordRepo {
  final EmailService emailService;
  ResetPasswordRepo(this.emailService);

  Future<FirebaseResult<bool>> resetPassword({required String email}) async {
    try {
      await emailService.sendPasswordResetEmail(email: email);
      return FirebaseResult.success(true);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }

  Future<FirebaseResult> verifyPasswordResetCode({required String code}) async {
    try {
      String email = await emailService.verifyPasswordResetCode(code: code);
      return FirebaseResult.success(email);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }

  Future<FirebaseResult> confirmPasswordReset(
      {required String code, required String newPassword}) async {
    try {
      await emailService.confirmPasswordReset(
          code: code, newPassword: newPassword);
      return FirebaseResult.success(null);
    } catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }
}
