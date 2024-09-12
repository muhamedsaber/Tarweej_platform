import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../interfaces/authentication_provider.dart';

class TwitterAuthProviderImpl implements AuthenticationProvider {
  @override
  Future<UserCredential> signIn() async{
     TwitterAuthProvider twitterProvider = TwitterAuthProvider();

    UserCredential credential;
    if (kIsWeb) {
      credential = await FirebaseAuth.instance.signInWithPopup(twitterProvider);
    } else {
      credential =
          await FirebaseAuth.instance.signInWithProvider(twitterProvider);
    }
    return credential;
  }
  
}