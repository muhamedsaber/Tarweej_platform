import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: context.theme.colorScheme.secondary,
            indent: 5,
            endIndent: 5,
          ),
        ),
        Text(
          context.translate.or,
          style: context.theme.font14OnSurfaceMedium,
        ),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 5,
            color: context.theme.colorScheme.secondary,
          ),
        )
      ],
    );
  }
}
