import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarweej_platform/config/theme/styles/text_styles.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton(
      {super.key, required this.language, this.isTapped = false});
  final bool isTapped;
  final String language;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            language,
            style: context.theme.font14OnSurfaceMedium,
            textAlign: TextAlign.center,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: isTapped
                ? const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    key: ValueKey('1'),
                  )
                : const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    key: ValueKey('2'),
                  ),
          ),
        ],
      ),
    );
  }
}
