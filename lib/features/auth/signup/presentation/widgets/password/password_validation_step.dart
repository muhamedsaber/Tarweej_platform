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
        _buildIcon(),
        horizontalSpace(8),
        Text(text, style: _buildTextStyle(context))
      ],
    );
  }

  _buildIcon() {
    if (isValid) {
      return const Icon(
        Icons.done,
        color: Colors.green,
      );
    } else {
      return const Icon(
        Icons.close,
        color: Colors.grey,
      );
    }
  }

  TextStyle _buildTextStyle(BuildContext context) {
    if (isValid) {
      return context.theme.font10GreyRegular.copyWith(
          decoration: TextDecoration.lineThrough, decorationColor: Colors.grey);
    } else {
      return context.theme.font10GreyRegular.copyWith(
        color: Colors.red,
      );
    }
  }
}
