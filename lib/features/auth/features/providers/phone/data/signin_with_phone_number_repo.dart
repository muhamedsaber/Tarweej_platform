import 'package:firebase_auth/firebase_auth.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_result.dart';

class SigninWithPhoneNumberRepo {
  Future<void> sendCodeSMS({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<FirebaseResult<UserCredential>> verifyCodeSMS({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final credential =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

      return FirebaseResult.success(credential);
    } on FirebaseAuthException catch (e) {
      return FirebaseResult.error(FirebaseErrorHandler.handle(e));
    }
  }
}
