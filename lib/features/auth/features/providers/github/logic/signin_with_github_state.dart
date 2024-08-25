part of 'signin_with_github_notifier.dart';
@immutable
sealed class SigninWithGitHubState {}

class SigninWithGitHubInitial extends SigninWithGitHubState {}

class SigninWithGitHubSuccess extends SigninWithGitHubState {}

class SigninWithGitHubError extends SigninWithGitHubState {
  final FirebaseErrorModel error;
  SigninWithGitHubError({required this.error});
}

class SigninWithGitHubLoading extends SigninWithGitHubState {}
