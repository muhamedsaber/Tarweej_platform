// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
// import 'package:tarweej_platform/core/common_ui/widgets/app_text_button.dart';
// import 'package:tarweej_platform/core/common_ui/widgets/app_text_field.dart';
// import 'package:tarweej_platform/core/common_ui/widgets/otp_textfield.dart';
// import 'package:tarweej_platform/core/helpers/extensions.dart';
// import 'package:tarweej_platform/core/helpers/size.dart';

// import '../../../../../../../core/helpers/app_regex.dart';
// import '../../notifier/reset_password.dart/reset_password_notifier.dart';

// class NewPasswordForm extends ConsumerWidget {
//   const NewPasswordForm({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final notifier = ref.watch(resetPasswordNotifierProvider.notifier);
//     final state = ref.watch(resetPasswordNotifierProvider);
//     return Form(
//       key: notifier.newPasswordFormKey,
//       child: Column(
//         children: [
//           verticalSpace(20),
//           Text(
//             context.translate.EnterYourNewPassword,
//             style: context.theme.font14OnSurfaceMedium.copyWith(
//               color: context.theme.colorScheme.onSurface.withOpacity(0.6),
//             ),
//           ),
//           verticalSpace(20),
//           AppTextField(
//             validator: (word) {
//               // validation process
//               if (word == null || word.isEmpty) {
//                 return context.translate.thisFieldIsRequired;
//               } else if (!word.contains(AppRegex.isPasswordContainsLowerCase)) {
//                 return context
//                     .translate.isPasswordContainsAtLeast1LowerCaseLetter;
//               } else if (!word.contains(AppRegex.isPasswordContainsUpperCase)) {
//                 return context
//                     .translate.isPasswordContainsAtLeast1UpperCaseLetter;
//               } else if (!word.contains(AppRegex.isPasswordContainsNumber)) {
//                 return context.translate.isPasswordContainsAtLeast1Number;
//               } else if (!word
//                   .contains(AppRegex.isPasswordContainsSpecialCharacter)) {
//                 return context
//                     .translate.isPasswordContainsAtLeast1SpecialCharacter;
//               } else if (word.length < 8) {
//                 return context.translate.isPasswordContainsAtLeast8Characters;
//               } else {
//                 return null;
//               }
//             },
//             hintText: context.translate.email,
//             controller: notifier.emailController,
//           ),
//           verticalSpace(20),
//           AppTextButton(
//             isLoading: state is ResetPasswordLoading,
//             width: context.screenWidth,
//             title: context.translate.confirm,
//             onPressed: () {
//               if (notifier.newPasswordFormKey.currentState!.validate()) {
//                 notifier.verifyCode();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
