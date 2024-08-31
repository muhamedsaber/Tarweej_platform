import 'package:firebase_auth/firebase_auth.dart';

class EmailService {
  Future<UserCredential> signup(
      {required String email, required String password}) async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    );
  }

  Future<String> verifyPasswordResetCode({
    required String code,
  }) async {
    return await FirebaseAuth.instance.verifyPasswordResetCode(code);
  }

  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    await FirebaseAuth.instance
        .confirmPasswordReset(code: code, newPassword: newPassword);
  }
}
