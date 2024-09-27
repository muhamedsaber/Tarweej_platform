import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';

import 'package:tarweej_platform/tarweej_platform_app.dart';

import 'config/language/language_changer_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencyInjection();
  final appDocumentsDirectory = await getExternalStorageDirectory();
  log(appDocumentsDirectory.toString());
  runApp(
    ProviderScope(
      overrides: [
        /// Look at [languageChangerProvider] for more details.
        ///
        /// Override the provider with a new initialization.
        /// This Provide a new instance of LanguageChanger with the new language as [InitialState]
        /// Which i can pass the cached language to it.
        languageChangerProvider.overrideWith(
          (ref) => LanguageChanger("en"),
        ),

        /// [overrideWithProvider] is deprecated and will be removed
      ],
      child: const TarweejPlatformApp(
        isUserLoggedIn: true,
      ),
    ),
  );
}

//elo@gmail.com
//Qwerty0000#
