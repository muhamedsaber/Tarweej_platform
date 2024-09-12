import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../interfaces/authentication_provider.dart';

class GoogleAuthProviderImpl implements AuthenticationProvider {
  @override
  signIn() async {
    // Trigger the authentication flow
    // opening the google sign in page which enables user to select his google account
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // getting the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential which is needed to sign in the user into Firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //  After the user is signed in, the credential is returned to the caller
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
