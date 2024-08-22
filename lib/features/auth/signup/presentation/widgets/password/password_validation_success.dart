part of 'password_field_with_validation_guide.dart';

class PasswordValidationSuccess extends StatelessWidget {
  const PasswordValidationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          const Icon(
            Icons.done,
            color: Colors.green,
          ),
          horizontalSpace(10),
          Text(context.translate.passwordIsValid, style: context.theme.font16SecondaryRegular)
        ],
      ),
    );
  }
}
