import 'package:flutter/material.dart';
import 'package:tarweej_platform/core/helpers/app_regex.dart';
import 'package:tarweej_platform/features/auth/features/signup/presentation/notifiers/password/password_state.dart';

class PasswordChangeNotifier extends ChangeNotifier {
  PasswordChangeNotifier._();
  static final PasswordChangeNotifier _instance = PasswordChangeNotifier._();
  factory PasswordChangeNotifier() => _instance;
  PasswordState passwordState = PasswordState();
  updatePasswordState(String password) {
    
    passwordState = passwordState.copyWith(
      isPasswordContainsLowerCase:
          password.contains(AppRegex.isPasswordContainsLowerCase),
      isPasswordContainsUpperCase:
          password.contains(AppRegex.isPasswordContainsUpperCase),
      isPasswordContainsNumber:
          password.contains(AppRegex.isPasswordContainsNumber),
      isPasswordContainsSpecialCharacter:
          password.contains(AppRegex.isPasswordContainsSpecialCharacter),
      isPasswordLengthValid: password.length >= 8,
    );
    updatePasswordGuideVisibility(password);
    notifyListeners();
  }

  updatePasswordGuideVisibility(String? password) {
    if (password == null || password.isEmpty || passwordState.isPasswordValid) {
      isPasswordGuideVisible = false;
    } else {
      isPasswordGuideVisible = true;
    }
  }
  
  bool isPasswordGuideVisible = false;
}
