import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';

import 'package:tarweej_platform/firebase_options.dart';
import 'package:tarweej_platform/tarweej_platform_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
   setupDependencyInjection();
  runApp(const ProviderScope(child: TarweejPlatformApp()));
}
//RjJYZElYOHUybzRSZllnRkl2Wk06MTpjaQ

//S0AQhV9_Z1-huhwSulHcgSB0SEGbB63QuUTB6kIiAPg8dAORrE //Access Token
//1175678873645854720-GqOpYuh88C4qaXs9hjG1OnAiXkQnWP //Access Token Secret



