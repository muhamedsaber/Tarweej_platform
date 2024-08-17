import 'package:flutter/material.dart';
import 'package:tarweej_platform/config/router/app_router.dart';
import 'package:tarweej_platform/config/theme/dark_theme/dark_theme.dart';

void main() {
  runApp(const TarweejPlatformApp());
}
class TarweejPlatformApp extends StatelessWidget {
  const TarweejPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  DarkTheme().theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute:AppRouter().onGenerateRoute,
    );
  }
}