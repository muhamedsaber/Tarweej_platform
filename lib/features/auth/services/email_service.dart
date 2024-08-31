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

  // Future<void> logout() async {
  //   await FirebaseAuth.instance.signOut();
  // }

  // Future<User?> getCurrentUser() async {
  //   return FirebaseAuth.instance.currentUser;
  // }

  // Future<void> resetPassword({required String email}) async {
  //   await FirebaseAuth.instance.sendPasswordResetEmail(email: email,actionCodeSettings: );
  // }
  // confirmPassword(){
  //   FirebaseAuth.instance.confirmPasswordReset(code:,newPassword:  );
  // }
}
