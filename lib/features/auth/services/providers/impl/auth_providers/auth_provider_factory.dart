import 'github_auth_provider_impl.dart';
import 'google_auth_provider_impl.dart';
import 'twitter_auth_provider_impl.dart';

@Deprecated("Use direct runing time injection instead. ")
class AuthProviderFactory {
  AuthProviderFactory._internal();
  static final AuthProviderFactory _instance = AuthProviderFactory._internal();
  factory AuthProviderFactory() => _instance;
  // for the first time you see this u are gonna notice that
  // factory is violating the open/closed principle
  // but u are wrong .
  // nah im kidding u are right yes im violating the open/closed principle
  // and im very happy about it , tell u wat i sleep better at night knowing that i violated the open/closed principle
  getProvider(AuthProviderType type) {
    switch (type) {
      case AuthProviderType.google:
        return GoogleAuthProviderImpl();
      case AuthProviderType.github:
        return GitHubAuthProviderImpl();
      case AuthProviderType.twitter:
        return TwitterAuthProviderImpl();
      default:
        UnknownAuthProviderException("The Provider Type is not supported");
    }
  }
}

enum AuthProviderType {
  facebook,
  google,
  github,
  twitter,
}

// Exception
class UnknownAuthProviderException implements Exception {
  final String message;
  UnknownAuthProviderException(this.message);

  @override
  String toString() => 'UnknownAuthProviderException: $message';
}
