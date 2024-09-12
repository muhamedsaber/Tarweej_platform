part of "auth_provider_state_notifier.dart";
sealed class AuthProviderState {}

class AuthProviderInitialState extends AuthProviderState {}

class AuthProviderLoadingState extends AuthProviderState {}

class AuthProviderErrorState extends AuthProviderState {
  final FirebaseErrorModel error;
  AuthProviderErrorState({required this.error});
}

class AuthProviderSuccessState extends AuthProviderState {}
