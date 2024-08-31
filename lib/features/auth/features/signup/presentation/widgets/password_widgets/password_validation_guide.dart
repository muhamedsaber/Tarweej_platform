part of 'password_field_with_validation_guide.dart';

class PasswordValidationGuide extends StatelessWidget {
  const PasswordValidationGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: PasswordChangeNotifier(),
      builder: (context, child) {
        PasswordChangeNotifier passwordChangeNotifier =
            PasswordChangeNotifier();

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
          child: passwordChangeNotifier.passwordState.isPasswordValid
              ? const PasswordValidationSuccess()
              : passwordChangeNotifier.isPasswordGuideVisible
                  ? PasswordValidationTotalSteps(
                      passwordState: passwordChangeNotifier.passwordState,
                    )
                  : const SizedBox.shrink(),
        );
      },
    );
  }
}
