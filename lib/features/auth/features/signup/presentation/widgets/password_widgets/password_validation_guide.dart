part of 'password_field_with_validation_guide.dart';

class PasswordValidationGuide extends StatelessWidget {
  const PasswordValidationGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: PasswordChangeNotifier(),
      builder: (context, child) {
        bool isPasswordGuideVisible =
            PasswordChangeNotifier().isPasswordGuideVisible;
        bool isPasswordValid =
            PasswordChangeNotifier().passwordState.isPasswordValid;
        if (isPasswordValid) {
          return const PasswordValidationSuccess();
        } else if (isPasswordGuideVisible) {
          return PasswordValidationTotalSteps(
            passwordState: PasswordChangeNotifier().passwordState,
          );
        } else {
          // Hide the guide
          // If Password is Empty or null
          return const SizedBox.shrink();
        }
      },
    );
  }
}
