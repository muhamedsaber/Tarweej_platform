import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tarweej_platform/config/router/app_router.dart';
import 'package:tarweej_platform/config/theme/dark_theme/dark_theme.dart';
import 'package:tarweej_platform/generated/l10n.dart';

class TarweejPlatformApp extends StatelessWidget {
  const TarweejPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DarkTheme().theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().onGenerateRoute,
      locale: const Locale("ar"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
