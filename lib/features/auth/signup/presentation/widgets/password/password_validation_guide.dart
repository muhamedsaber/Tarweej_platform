part of 'password_field_with_validation_guide.dart';
class PasswordValidationGuide extends StatelessWidget {
  const PasswordValidationGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: PasswordChangeNotifier(),
      builder: (context, child) {
        bool isVisible = PasswordChangeNotifier().isPasswordGuideVisible;
        bool isPasswordValid =
            PasswordChangeNotifier().passwordState.isPasswordValid;
        if (isPasswordValid) {
          return const PasswordValidationSuccess();
        } else if (isVisible) {
          return PasswordValidationTotalSteps(
            passwordState: PasswordChangeNotifier().passwordState,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
