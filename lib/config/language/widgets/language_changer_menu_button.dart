import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/language/language_changer_notifier.dart';
import 'package:tarweej_platform/config/language/localization_herlper.dart';
import 'package:tarweej_platform/config/language/widgets/language_menu_button.dart';
import 'package:tarweej_platform/core/helpers/app_constants.dart';
import 'package:tarweej_platform/core/helpers/extensions.dart';

class LaguageChangerButton extends ConsumerStatefulWidget {
  const LaguageChangerButton({super.key});

  @override
  ConsumerState<LaguageChangerButton> createState() =>
      _LaguageChangerButtonState();
}

class _LaguageChangerButtonState extends ConsumerState<LaguageChangerButton> {
  bool isTapped = false;
  flipIcon() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final language = LocalizationHelper.getCurrentLanguageByContext(context);
    final languageNotifier = ref.watch(languageChangerProvider.notifier);

    return Theme(
      data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: context.theme.colorScheme.primary,
          colorScheme: context.theme.colorScheme,
          popupMenuTheme: const PopupMenuThemeData()),
      child: PopupMenuButton(
        elevation: 4,
        offset: const Offset(0, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        position: PopupMenuPosition.under,
        child: LanguageButton(
          isTapped: isTapped,
          language: language == AppLanguage.ar
              ? context.translate.Arabic
              : context.translate.English,
        ),
        onOpened: () => flipIcon(),
        onCanceled: () => flipIcon(),
        onSelected: (value) {
          // Changing the language
          languageNotifier.changeLanguage(value);
          // Switching the icon of the button
          flipIcon();
        },
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: AppConstants.ar,
              child: Text(
                context.translate.Arabic,
              ),
            ),
            PopupMenuItem(
              value: AppConstants.en,
              child: Text(
                context.translate.English,
              ),
            ),
          ];
        },
      ),
    );
  }
}
