import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';

import 'package:tarweej_platform/firebase_options.dart';
import 'package:tarweej_platform/tarweej_platform_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  fakeLogin();
  runApp(const TarweejPlatformApp());
}

fakeLogin() async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: "f@gmail.com", password: "f");
  } catch (e) {
  final error=  FirebaseErrorHandler.handle(e);
  log(error.code);
  log(error.message);
  log(error.icon.toString());
  }
}
