part of 'password_field_with_validation_guide.dart';

class PasswordValidationStep extends StatelessWidget {
  const PasswordValidationStep(
      {super.key, required this.isValid, required this.text});
  final bool isValid;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.done : Icons.close,
          color: isValid ? Colors.green : Colors.grey,
        ),
        horizontalSpace(8),
        Text(text, style: _buildTextStyle(context))
      ],
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    if (isValid) {
      return context.theme.font10GreyRegular.copyWith(
        decoration: TextDecoration.lineThrough,
        decorationColor: Colors.grey,
      );
    } else {
      return context.theme.font10GreyRegular.copyWith(
        color: Colors.red,
      );
    }
  }
}
