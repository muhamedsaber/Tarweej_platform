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
}
