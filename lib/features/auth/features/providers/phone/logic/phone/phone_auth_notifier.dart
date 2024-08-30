import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarweej_platform/config/data/models/user_model.dart';
import 'package:tarweej_platform/core/di/dependency_injection.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_handler.dart';
import 'package:tarweej_platform/core/networking/firebase/firebase_error_model.dart';
import 'package:tarweej_platform/features/auth/features/providers/phone/data/signin_with_phone_number_repo.dart';
part 'phone_auth_state.dart';

class PhoneAuthNotifier extends StateNotifier<PhoneAuthState> {
  PhoneAuthNotifier({required this.repo}) : super(PhoneAuthInitial());
  final SigninWithPhoneNumberRepo repo;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otbController = TextEditingController();

  final GlobalKey<FormState> otbFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  String codeVerificationId = "";
  authunticatePhoneNumber({
    required String countryCode,
  }) async {
    state = PhoneAuthLoading();
    await repo.sendCodeSMS(
      phoneNumber: "$countryCode${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {},
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (FirebaseAuthException e) {
        final error = FirebaseErrorHandler.handle(e);
        log(error.toString());
        state = PhoneAuthError(error);
      },
      codeSent: (String verificationId, int? resendToken) async {
        codeVerificationId = verificationId;
        state = PhoneAuthCodeSent(verificationId: verificationId);
      },
    );
  }

  verifyCodeSMS({required String verificationId}) async {
    state = PhoneAuthLoading();

    final result = await repo.verifyCodeSMS(
        smsCode: otbController.text, verificationId: verificationId);
    result.when(onSuccess: (data) {
      state = PhoneAuthSubmitCodeSuccess(
          user: UserModel(
        uid: data!.user!.uid,
        phoneNumber: data.user!.phoneNumber,
      ));
    }, onError: (error) {
      log(error.toString());
      state = PhoneAuthError(error!);
    });
  }

  
}

final phoneAuthProvider =
    StateNotifierProvider<PhoneAuthNotifier, PhoneAuthState>(
  (ref) {
    return PhoneAuthNotifier(repo: getIt<SigninWithPhoneNumberRepo>());
  },
);
