part of 'password_field_with_validation_guide.dart';

class PasswordValidationTotalSteps extends StatelessWidget {
  const PasswordValidationTotalSteps({super.key, required this.passwordState});
  final PasswordState passwordState;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PasswordValidationStep(
          isValid: passwordState.isPasswordLengthValid,
          text: context.translate.isPasswordContainsAtLeast8Characters,
        ),
        PasswordValidationStep(
          isValid: passwordState.isPasswordContainsUpperCase,
          text: context.translate.isPasswordContainsAtLeast1UpperCaseLetter,
        ),
        PasswordValidationStep(
          isValid: passwordState.isPasswordContainsLowerCase,
          text: context.translate.isPasswordContainsAtLeast1LowerCaseLetter,
        ),
        PasswordValidationStep(
          isValid: passwordState.isPasswordContainsNumber,
          text: context.translate.isPasswordContainsAtLeast1Number,
        ),
        PasswordValidationStep(
          isValid: passwordState.isPasswordContainsSpecialCharacter,
          text: context.translate.isPasswordContainsAtLeast1SpecialCharacter,
        ),
      ],
    );
  }
}
