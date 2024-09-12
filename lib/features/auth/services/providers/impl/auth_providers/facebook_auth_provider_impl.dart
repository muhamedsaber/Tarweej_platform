import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../interfaces/authentication_provider.dart';

class FacebookAuthProviderImpl implements AuthenticationProvider {
  @override
  signIn() async {
    // Trigger the sign-in flow
    // login method will gonna make a request to facebook and return the result
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // The Result is used to create a user credential which is needed to sign in the user
    // into Firebase
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // After the user is signed in, the facebookAuthCredential is returned to the caller
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }
}
