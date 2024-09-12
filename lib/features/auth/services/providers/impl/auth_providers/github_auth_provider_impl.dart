import 'package:firebase_auth/firebase_auth.dart';
import 'package:tarweej_platform/features/auth/services/providers/interfaces/authentication_provider.dart';

class GitHubAuthProviderImpl implements AuthenticationProvider {
  @override
  Future<UserCredential> signIn() async {
    GithubAuthProvider githubProvider = GithubAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(githubProvider);
  }
}
