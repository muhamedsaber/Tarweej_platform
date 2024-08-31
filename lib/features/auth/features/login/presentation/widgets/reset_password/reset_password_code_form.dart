// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
// import 'package:tarweej_platform/core/helpers/extensions.dart';
// import 'package:tarweej_platform/core/helpers/size.dart';

// import '../../../../../../../core/common_ui/widgets/app_text_button.dart';
// import '../../../../../../../core/common_ui/widgets/otp_textfield.dart';
// import '../../notifier/reset_password.dart/reset_password_notifier.dart';

// class ResetPasswordCodeForm extends ConsumerWidget {
//   const ResetPasswordCodeForm({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final notifier = ref.watch(resetPasswordNotifierProvider.notifier);
//     final state = ref.watch(resetPasswordNotifierProvider);
//     return Form(
//       key: notifier.codeFormKey,
//       child: Column(
//         children: [
//           verticalSpace(20),
//           Text(
//             context.translate.WeSentASixdigitCodeTo,
//             style: context.theme.font14OnSurfaceMedium.copyWith(
//               color: context.theme.colorScheme.onSurface.withOpacity(0.6),
//             ),
//           ),
//           verticalSpace(4),
//           Text(
//              notifier.emailController.text,
//             style: context.theme.font14OnSurfaceMedium,
//           ),
//           verticalSpace(20),
//           OtpTextField(
//             controller: notifier.codeController,
//           ),
//           verticalSpace(20),
//           AppTextButton(
//             isLoading: state is ResetPasswordLoading,
//             width: context.screenWidth,
//             title: context.translate.confirm,
//             onPressed: () {
//               if (notifier.codeFormKey.currentState!.validate()) {
//                 notifier.verifyCode();
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
